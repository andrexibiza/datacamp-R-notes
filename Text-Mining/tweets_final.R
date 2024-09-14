# 2016 Election Tweets / Axl Ibiza
# 2024-09-14
# code adapted from https://www.tidytextmining.com/twitter

# init
library(broom)
library(dplyr)
library(ggplot2)
library(lubridate)
library(readr)
library(scales)
library(stringr)
library(purrr)
library(tidyr)
library(tidytext)

# read data
tweets <- read.csv("tweets.csv")
head(tweets)
dim(tweets) # 6444  28
colnames(tweets)
# [1] "id"                      "handle"                  "text"                    "is_retweet"             
# [5] "original_author"         "time"                    "in_reply_to_screen_name" "in_reply_to_status_id"  
# [9] "in_reply_to_user_id"     "is_quote_status"         "lang"                    "retweet_count"          
# [13] "favorite_count"          "longitude"               "latitude"                "place_id"               
# [17] "place_full_name"         "place_name"              "place_type"              "place_country_code"     
# [21] "place_country"           "place_contained_within"  "place_attributes"        "place_bounding_box"     
# [25] "source_url"              "truncated"               "entities"                "extended_entities"      
# [29] "candidate"              


### 1) Tweet Frequency by Candidate

# Convert the 'time' column to a datetime format
tweets <- tweets %>%
  mutate(time = ymd_hms(time))

# Filter tweets by candidate
tweets <- tweets %>%
    mutate(candidate = ifelse(handle == "HillaryClinton", "Clinton", "Trump"))

# Create the plot
ggplot(tweets, aes(x = time, fill = candidate)) +
  geom_histogram(position = "identity", bins = 20, show.legend = FALSE) +
  facet_wrap(~candidate, ncol = 1)

### 2) Word Frequency Analysis
replace_reg <- "https://t.co/[A-Za-z\\d]+|http://[A-Za-z\\d]+|&amp;|&lt;|&gt;|RT|https"
unnest_reg <- "([^A-Za-z_\\d#@']|'(?![A-Za-z_\\d#@]))"

tidy_tweets <- tweets %>% 
  filter(!str_detect(text, "^RT")) %>%
  mutate(text = str_replace_all(text, replace_reg, "")) %>%
  unnest_tokens(word, text, token = "regex", pattern = unnest_reg) %>%
  filter(!word %in% stop_words$word,
         !word %in% str_remove_all(stop_words$word, "'"),
         str_detect(word, "[a-z]"))

frequency <- tidy_tweets %>% 
  count(candidate, word, sort = TRUE) %>% 
  left_join(tidy_tweets %>% 
              count(candidate, name = "total")) %>%
  mutate(freq = n/total)

frequency <- frequency %>% 
  select(candidate, word, freq) %>% 
  pivot_wider(names_from = candidate, values_from = freq) %>%
  arrange(Clinton, Trump)

ggplot(frequency, aes(Clinton, Trump)) +
  geom_jitter(alpha = 0.1, size = 2.5, width = 0.25, height = 0.25) +
  geom_text(aes(label = word), check_overlap = TRUE, vjust = 1.5) +
  scale_x_log10(labels = percent_format()) +
  scale_y_log10(labels = percent_format()) +
  geom_abline(color = "red")

### 3) Comparison of Word Usage
word_ratios <- tidy_tweets %>%
  filter(!str_detect(word, "^@")) %>%
  count(word, candidate) %>%
  group_by(word) %>%
  filter(sum(n) >= 10) %>%
  ungroup() %>%
  pivot_wider(names_from = candidate, values_from = n, values_fill = 0) %>%
  mutate_if(is.numeric, list(~(. + 1) / (sum(.) + 1))) %>%
  mutate(logratio = log(Trump / Clinton)) %>%
  arrange(desc(abs(logratio)))

word_ratios %>%
  group_by(logratio < 0) %>%
  slice_max(abs(logratio), n = 15) %>% 
  ungroup() %>%
  mutate(word = reorder(word, logratio)) %>%
  ggplot(aes(word, logratio, fill = logratio < 0)) +
  geom_col(show.legend = FALSE) +
  coord_flip() +
  ylab("log odds ratio (Trump/Clinton)") +
  scale_fill_discrete(name = "", labels = c("Trump", "Clinton"))

# graph v2 with Spanish stopwords removed
# Spanish stopwords
spanish <- c("de", "en", "los", "el", "para", "ve", "es", "por", "la")

# Filter Spanish stopwords
word_ratios_filtered <- word_ratios %>%
  filter(!word %in% spanish)

word_ratios_filtered %>%
  group_by(logratio < 0) %>%
  slice_max(abs(logratio), n = 15) %>% 
  ungroup() %>%
  mutate(word = reorder(word, logratio)) %>%
  ggplot(aes(word, logratio, fill = logratio < 0)) +
  geom_col(show.legend = FALSE) +
  coord_flip() +
  ylab("log odds ratio (Trump/Clinton)") +
  scale_fill_discrete(name = "", labels = c("Trump", "Clinton"))

### 4) Changes in Word Use Analysis
words_by_time <- tidy_tweets %>%
  filter(!str_detect(word, "^@")) %>%
  mutate(time_floor = floor_date(time, unit = "1 month")) %>%
  count(time_floor, candidate, word) %>%
  group_by(candidate, time_floor) %>%
  mutate(time_total = sum(n)) %>%
  group_by(candidate, word) %>%
  mutate(word_total = sum(n)) %>%
  ungroup() %>%
  rename(count = n) %>%
  filter(word_total > 30)

nested_data <- words_by_time %>%
  nest(data = c(-word, -candidate)) 

nested_models <- nested_data %>%
  mutate(models = map(data, ~ glm(cbind(count, time_total) ~ time_floor, ., 
                                  family = "binomial")))
slopes <- nested_models %>%
  mutate(models = map(models, tidy)) %>%
  unnest(cols = c(models)) %>%
  filter(term == "time_floor") %>%
  mutate(adjusted.p.value = p.adjust(p.value))

top_slopes <- slopes %>% 
  filter(adjusted.p.value < 0.05)

words_by_time %>%
  inner_join(top_slopes, by = c("word", "candidate")) %>%
  filter(candidate == "Trump") %>%
  group_by(word) %>% 
  summarize(total_count = sum(count)) %>% 
  arrange(desc(total_count)) %>%
  slice_max(total_count, n = 5) %>%
  inner_join(words_by_time, by = "word") %>%
  ggplot(aes(time_floor, count/time_total, color = word)) +
  geom_line(size = 1.3) +
  labs(x = NULL, y = "Word frequency")

words_by_time %>%
  inner_join(top_slopes, by = c("word", "candidate")) %>%
  filter(candidate == "Clinton") %>%
  group_by(word) %>% 
  summarize(total_count = sum(count)) %>% 
  arrange(desc(total_count)) %>%
  inner_join(words_by_time, by = "word") %>%
  ggplot(aes(time_floor, count/time_total, color = word)) +
  geom_line(size = 1.3) +
  labs(x = NULL, y = "Word frequency")

### 5) Favorites and Retweets Analysis
tweets <- read.csv("tweets.csv") %>% 
  mutate(time = ymd_hms(time)) %>% 
  mutate(candidate = ifelse(handle == "HillaryClinton", "Clinton", "Trump"))  
#dim(tweets)

tidy_tweets <- tweets %>% 
  filter(!str_detect(text, "^(RT|@)")) %>%
  mutate(text = str_replace_all(text, replace_reg, "")) %>%
  unnest_tokens(word, text, token = "regex", pattern = unnest_reg) %>%
  filter(!word %in% stop_words$word,
         !word %in% str_remove_all(stop_words$word, "'"))

#dim(tidy_tweets)

totals <- tidy_tweets %>% 
  group_by(candidate, id) %>% 
  summarise(rts = first(retweet_count)) %>% 
  group_by(candidate) %>% 
  summarise(total_rts = sum(rts))
#totals

word_by_rts <- tidy_tweets %>% 
  group_by(id, word, candidate) %>% 
  summarise(rts = first(retweet_count)) %>% 
  group_by(candidate, word) %>% 
  summarise(retweets = median(rts), uses = n()) %>%
  left_join(totals) %>%
  filter(retweets != 0) %>%
  ungroup()

word_by_rts %>% 
  filter(uses >= 5) %>%
  arrange(desc(retweets))

word_by_rts %>%
  filter(uses >= 5) %>%
  group_by(candidate) %>%
  slice_max(retweets, n = 10) %>% 
  arrange(retweets) %>%
  ungroup() %>%
  mutate(word = factor(word, unique(word))) %>%
  ungroup() %>%
  ggplot(aes(word, retweets, fill = candidate)) +
  geom_col(show.legend = FALSE) +
  facet_wrap(~ candidate, scales = "free", ncol = 2) +
  coord_flip() +
  labs(x = NULL, 
       y = "Median # of retweets for tweets containing each word")



word_by_rts %>%
  filter(uses >= 5) %>%
  group_by(candidate) %>%
  slice_max(retweets, n = 10) %>% 
  arrange(retweets) %>%
  ungroup() %>%
  mutate(word = factor(word, unique(word))) %>%
  ungroup() %>%
  ggplot(aes(word, retweets, fill = candidate)) +
  geom_col(show.legend = FALSE) +
  facet_wrap(~ candidate, scales = "free", ncol = 2) +
  coord_flip() +
  labs(x = NULL, 
       y = "Median # of retweets for tweets containing each word")




