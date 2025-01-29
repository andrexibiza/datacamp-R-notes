# 2016 Election Tweets / Axl Ibiza, MBA
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

# Prepare data for analysis
tidy_tweets <- tweets %>% 
  filter(!str_detect(text, "^RT")) %>%                                       # Remove retweets to avoid counting words multiple times
  mutate(text = str_replace_all(text, replace_reg, "")) %>%                  # Remove URLs and special characters
  unnest_tokens(word, text, token = "regex", pattern = unnest_reg) %>%       # Tokenize text 
  filter(!word %in% stop_words$word,                                         # Remove common stop words (e.g., "the", "a", "is")
         !word %in% str_remove_all(stop_words$word, "'"),                    # Remove stop words even if they contain apostrophes
         str_detect(word, "[a-z]"))                                          # Keep only words containing lowercase letters

# Calculate word frequencies for each candidate
frequency <- tidy_tweets %>% 
  count(candidate, word, sort = TRUE) %>%                                    # Count occurrences of each word for each candidate
  left_join(tidy_tweets %>% 
              count(candidate, name = "total")) %>%                          # Calculate the total number of words used by each candidate
  mutate(freq = n/total)                                                     # Calculate the relative frequency of each word within each candidate's tweets

# Prepare data for plotting
frequency <- frequency %>% 
  select(candidate, word, freq) %>%                                          # Select relevant columns
  pivot_wider(names_from = candidate, values_from = freq) %>%                # Reshape data
  arrange(Clinton, Trump)                                                    # Arrange data

# Visualize word frequencies
ggplot(frequency, aes(Clinton, Trump)) +                                     # Create a scatterplot with Clinton's frequency on the x-axis and Trump's on the y-axis
  geom_jitter(alpha = 0.1, size = 2.5, width = 0.25, height = 0.25) +        # Add jitter to avoid overplotting
  geom_text(aes(label = word), check_overlap = TRUE, vjust = 1.5) +          # Add word labels
  scale_x_log10(labels = percent_format()) +                                 # Use log scale for better visualization of differences
  scale_y_log10(labels = percent_format()) +
  geom_abline(color = "red")                                                 # Adds the diagonal red line to tell the two candidates apart

### 3) Comparison of Word Usage
word_ratios <- tidy_tweets %>%
  filter(!str_detect(word, "^@")) %>%                                        # Remove mentions to focus on content words
  count(word, candidate) %>%                                                 # Count how often each word appears for each candidate
  group_by(word) %>%                                                         # Group the data by word
  filter(sum(n) >= 10) %>%                                                   # Keep only words that appear at least 10 times overall
  ungroup() %>%                   
  pivot_wider(names_from = candidate, values_from = n, values_fill = 0) %>%  # Reshape data for ratio calculation
  mutate_if(is.numeric, list(~(. + 1) / (sum(.) + 1))) %>%                   # Calculate proportions, adding 1 to handle zero counts
  mutate(logratio = log(Trump / Clinton)) %>%                                # Calculate the log odds ratio (positive = Trump, negative = Clinton)
  arrange(desc(abs(logratio)))                                               # Sort by the largest differences (regardless of direction)

# Visualization
word_ratios %>%
  group_by(logratio < 0) %>%                                                 # Group by whether the word is used more by Clinton (TRUE) or Trump (FALSE)
  slice_max(abs(logratio), n = 15) %>%                                       # Take the top 15 words with the largest differences
  ungroup() %>%
  mutate(word = reorder(word, logratio)) %>%                                 # Reorder words for better plotting
  ggplot(aes(word, logratio, fill = logratio < 0)) +                         # Create a bar plot
  geom_col(show.legend = FALSE) +                                            # Add bars (no legend needed since fill color differentiates)
  coord_flip() +                                                             # Flip coordinates for horizontal bars and easier word reading
  ylab("log odds ratio (Trump/Clinton)") +                                   # Label the y-axis
  scale_fill_discrete(name = "", labels = c("Trump", "Clinton"))             # Customize fill color labels

# graph v2 with Spanish stopwords removed
# Spanish stopwords
spanish <- c("de", "en", "los", "el", "para", "ve", "es", "por", "la")       # Define list of Spanish stopwords

# Filter Spanish stopwords
word_ratios_filtered <- word_ratios %>%                                      # Removes stopwords from ratios
  filter(!word %in% spanish)

word_ratios_filtered %>%
  group_by(logratio < 0) %>%                                                 # Group by whether the word is used more by Clinton (TRUE) or Trump (FALSE)
  slice_max(abs(logratio), n = 15) %>%                                       # Take the top 15 words with the largest differences
  ungroup() %>%
  mutate(word = reorder(word, logratio)) %>%                                 # Reorder words for better plotting
  ggplot(aes(word, logratio, fill = logratio < 0)) +                         # Create a bar plot
  geom_col(show.legend = FALSE) +                                            # Add bars (no legend needed since fill color differentiates)
  coord_flip() +                                                             # Flip coordinates for horizontal bars and easier word reading
  ylab("log odds ratio (Trump/Clinton)") +                                   # Label the y-axis
  scale_fill_discrete(name = "", labels = c("Trump", "Clinton"))             # Customize fill color labels

### 4) Changes in Word Use Analysis

# Prepare data
words_by_time <- tidy_tweets %>%
  filter(!str_detect(word, "^@")) %>%                                       # Remove mentions, focusing on content words
  mutate(time_floor = floor_date(time, unit = "1 month")) %>%               # Group tweets by month
  count(time_floor, candidate, word) %>%                                    # Count word occurrences per candidate per month
  group_by(candidate, time_floor) %>%                                       # Group by candidate and month
  mutate(time_total = sum(n)) %>%                                           # Calculate the total words used by each candidate each month
  group_by(candidate, word) %>%                                             # Group by candidate and word
  mutate(word_total = sum(n)) %>%                                           # Calculate the total times each word was used by each candidate
  ungroup() %>%
  rename(count = n) %>%                                                     # Rename 'n' column to 'count' for clarity
  filter(word_total > 30)                                                   # Keep only words used more than 30 times overall

# Model word use over time
nested_data <- words_by_time %>%
  nest(data = c(-word, -candidate))                                         # Nest data for running regressions by word and candidate

nested_models <- nested_data %>%
  mutate(models = map(data, ~ glm(cbind(count, time_total) ~ time_floor, ., # Fit the model
                                  family = "binomial")))
slopes <- nested_models %>%
  mutate(models = map(models, tidy)) %>%                                    # Extract model coefficients
  unnest(cols = c(models)) %>%                                              # Unnest the coefficients
  filter(term == "time_floor") %>%                                          # Keep only the coefficient for time (slope of the trend)
  mutate(adjusted.p.value = p.adjust(p.value))                              # Adjust p-values for multiple comparisons

top_slopes <- slopes %>% 
  filter(adjusted.p.value < 0.05)                                           # Keep only words with a statistically significant change over time

# Visualize changes in Trump's word usage
words_by_time %>%
  inner_join(top_slopes, by = c("word", "candidate")) %>%                  # Filter for words with significant trends
  filter(candidate == "Trump") %>%                                         # Select Trump's data
  group_by(word) %>% 
  summarize(total_count = sum(count)) %>%                                  # Calculate total word count for ordering
  arrange(desc(total_count)) %>%                                           # Order by total word count
  slice_max(total_count, n = 5) %>%                                        # Select the top 5 most frequent words
  inner_join(words_by_time, by = "word") %>%                               # Join back with the original data
  ggplot(aes(time_floor, count/time_total, color = word)) +                # Create the plot
  geom_line(size = 1.3) +                                                  # Add lines
  labs(x = NULL, y = "Word frequency")                                     # Set axis labels

# Visualize changes in Clinton's word usage
words_by_time %>%
  inner_join(top_slopes, by = c("word", "candidate")) %>%                  # Filter for words with significant trends
  filter(candidate == "Clinton") %>%                                       # Select Clinton's data
  group_by(word) %>% 
  summarize(total_count = sum(count)) %>%                                  # Calculate total word count for ordering
  arrange(desc(total_count)) %>%                                           # Order by total word count
  inner_join(words_by_time, by = "word") %>%                               # Join back with the original data
  ggplot(aes(time_floor, count/time_total, color = word)) +                # Create the plot
  geom_line(size = 1.3) +                                                  # Add lines
  labs(x = NULL, y = "Word frequency")                                     # Set axis labels

### 5) Favorites and Retweets Analysis

## Retweets
tweets <- read.csv("tweets.csv") %>%                                         # Reload the tweets data and prepare it (same as before)
  mutate(time = ymd_hms(time)) %>%                                           # Convert 'time' to a datetime object
  mutate(candidate = ifelse(handle == "HillaryClinton", "Clinton", "Trump")) # Add a 'candidate' column 
#dim(tweets)

tidy_tweets <- tweets %>% 
  filter(!str_detect(text, "^(RT|@)")) %>%                                   # Filter out retweets and mentions
  mutate(text = str_replace_all(text, replace_reg, "")) %>%                  # Clean text (remove URLs, etc.)
  unnest_tokens(word, text, token = "regex", pattern = unnest_reg) %>%       # Tokenize text
  filter(!word %in% stop_words$word,                                         # Remove stop words
         !word %in% str_remove_all(stop_words$word, "'"))                    # Remove stop words (including those with apostrophes)

#dim(tidy_tweets)

# Calculate total retweets per candidate
totals <- tidy_tweets %>% 
  group_by(candidate, id) %>%                                              # Group by candidate and tweet ID
  summarise(rts = first(retweet_count)) %>%                                # Get the retweet count for each tweet
  group_by(candidate) %>%                                                  # Group by candidate
  summarise(total_rts = sum(rts))                                          # Sum retweets for each candidate
#totals

# Calculate median retweets per word, per candidate
word_by_rts <- tidy_tweets %>% 
  group_by(id, word, candidate) %>%                                        # Group by tweet ID, word, and candidate
  summarise(rts = first(retweet_count)) %>%                                # Get the retweet count for each tweet
  group_by(candidate, word) %>%                                            # Group by candidate and word
  summarise(retweets = median(rts), uses = n()) %>%                        # Calculate median retweets and word usage count
  left_join(totals) %>%                                                    # Add the total retweets per candidate
  filter(retweets != 0) %>%                                                # Keep words with at least one retweet
  ungroup()

# View words with at least 5 uses, ordered by median retweets
word_by_rts %>%                                                           
  filter(uses >= 5) %>%
  arrange(desc(retweets))

# Visualize the top 10 words by median retweets for each candidate
word_by_rts %>%
  filter(uses >= 5) %>%                                                   # Keep words used at least 5 times
  group_by(candidate) %>%                                                 # Group by candidate
  slice_max(retweets, n = 10) %>%                                         # Get the top 10 words by median retweets
  arrange(retweets) %>%                                                   # Arrange by retweets for plotting
  ungroup() %>%
  mutate(word = factor(word, unique(word))) %>%                           # Convert word to factor for plotting
  ungroup() %>%
  ggplot(aes(word, retweets, fill = candidate)) +                         # Create a bar plot
  geom_col(show.legend = FALSE) +                                         # Add bars without a legend
  facet_wrap(~ candidate, scales = "free", ncol = 2) +                    # Create separate plots for each candidate
  coord_flip() +                                                          # Flip coordinates for horizontal bars
  labs(x = NULL, 
       y = "Median # of retweets for tweets containing each word")        # Add y-axis label

## Favorites Analysis

# (This section follows the same logic as the previous retweet analysis)
totals <- tidy_tweets %>% 
  group_by(candidate, id) %>% 
  summarise(favs = first(favorite_count)) %>% 
  group_by(candidate) %>% 
  summarise(total_favs = sum(favs))

word_by_favs <- tidy_tweets %>% 
  group_by(id, word, candidate) %>% 
  summarise(favs = first(favorite_count)) %>% 
  group_by(candidate, word) %>% 
  summarise(favorites = median(favs), uses = n()) %>%
  left_join(totals) %>%
  filter(favorites != 0) %>%
  ungroup()

word_by_favs %>%
  filter(uses >= 5) %>%
  group_by(candidate) %>%
  slice_max(favorites, n = 10) %>% 
  arrange(favorites) %>%
  ungroup() %>%
  mutate(word = factor(word, unique(word))) %>%
  ungroup() %>%
  ggplot(aes(word, favorites, fill = candidate)) +
  geom_col(show.legend = FALSE) +
  facet_wrap(~ candidate, scales = "free", ncol = 2) +
  coord_flip() +
  labs(x = NULL, 
       y = "Median # of favorites for tweets containing each word")
