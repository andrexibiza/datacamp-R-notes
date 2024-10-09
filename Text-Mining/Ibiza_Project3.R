### DATA5350 Project 3 - NASA Geospatial Metadata
### Axl Ibiza, MBA
### 2024-10-08

# Code adapted from https://www.tidytextmining.com/nasa

# Load packages
library(dplyr)
library(ggraph)
library(ggplot2)
library(igraph)
library(jsonlite)
library(tidyr)
library(tidytext)
library(topicmodels)
library(widyr)

# Import JSON metadata from NASA
metadata <- fromJSON("https://data.nasa.gov/data.json")
names(metadata$dataset)

### Data Cleaning
# Titles
nasa_title <- tibble(id = metadata$dataset$identifier, 
                     title = metadata$dataset$title)
nasa_title

# Descriptions
nasa_desc <- tibble(id = metadata$dataset$identifier, 
                    desc = metadata$dataset$description)

nasa_desc %>% 
  select(desc) %>% 
  sample_n(5)

# Keywords
nasa_keyword <- tibble(id = metadata$dataset$identifier, 
                       keyword = metadata$dataset$keyword) %>%
  unnest(keyword)

nasa_keyword

### Text Pre-processing for Titles and Descriptions
nasa_title <- nasa_title %>% 
  unnest_tokens(word, title) %>% 
  anti_join(stop_words)

nasa_desc <- nasa_desc %>% 
  unnest_tokens(word, desc) %>% 
  anti_join(stop_words)

nasa_title
nasa_desc

### Initial Simple Exploration
nasa_title %>%
  count(word, sort = TRUE)

nasa_desc %>% 
  count(word, sort = TRUE)

# Need a custom stopword list
my_stopwords <- tibble(word = c(as.character(1:10), 
                                "v1.0", "v03", "l2", "l3", "l4", "v5.2.0", 
                                "v003", "v004", "v005", "v006", "v7"))
nasa_title <- nasa_title %>% 
  anti_join(my_stopwords)
nasa_desc <- nasa_desc %>% 
  anti_join(my_stopwords)

# What are the most common keywords?
nasa_keyword %>% 
  group_by(keyword) %>% 
  count(sort = TRUE)

# Change all keywords to uppercase
nasa_keyword <- nasa_keyword %>% 
  mutate(keyword = toupper(keyword))

### Word Co-occurrences and Correlations
# Titles
title_word_pairs <- nasa_title %>% 
  pairwise_count(word, id, sort = TRUE, upper = FALSE)

title_word_pairs

# Descriptions
desc_word_pairs <- nasa_desc %>% 
  pairwise_count(word, id, sort = TRUE, upper = FALSE)

desc_word_pairs

# Visualize title word pairs
set.seed(1234)
title_word_pairs %>%
  filter(n >= 250) %>%
  graph_from_data_frame() %>%
  ggraph(layout = "fr") +
  geom_edge_link(aes(edge_alpha = n, edge_width = n), edge_colour = "cyan4") +
  geom_node_point(size = 5) +
  geom_node_text(aes(label = name), repel = TRUE, 
                 point.padding = unit(0.2, "lines")) +
  theme_void()

# Visualize description word pairs
desc_word_pairs %>%
  filter(n >= 5000) %>%
  graph_from_data_frame() %>%
  ggraph(layout = "fr") +
  geom_edge_link(aes(edge_alpha = n, edge_width = n), edge_colour = "darkred") +
  geom_node_point(size = 5) +
  geom_node_text(aes(label = name), repel = TRUE,
                 point.padding = unit(0.2, "lines")) +
  theme_void()

# Keyword networks
keyword_pairs <- nasa_keyword %>% 
  pairwise_count(keyword, id, sort = TRUE, upper = FALSE)

keyword_pairs %>%
  filter(n >= 700) %>%
  graph_from_data_frame() %>%
  ggraph(layout = "fr") +
  geom_edge_link(aes(edge_alpha = n, edge_width = n), edge_colour = "royalblue") +
  geom_node_point(size = 5) +
  geom_node_text(aes(label = name), repel = TRUE,
                 point.padding = unit(0.2, "lines")) +
  theme_void()

# Keyword correlations
keyword_cors <- nasa_keyword %>% 
  group_by(keyword) %>%
  filter(n() >= 50) %>%
  pairwise_cor(keyword, id, sort = TRUE, upper = FALSE)

keyword_cors

# Visualize keyword correlations
keyword_cors %>%
  filter(correlation > .8) %>%
  graph_from_data_frame() %>%
  ggraph(layout = "fr") +
  geom_edge_link(aes(edge_alpha = correlation, edge_width = correlation), edge_colour = "royalblue") +
  geom_node_point(size = 5) +
  geom_node_text(aes(label = name), repel = TRUE,
                 point.padding = unit(0.2, "lines")) +
  theme_void()