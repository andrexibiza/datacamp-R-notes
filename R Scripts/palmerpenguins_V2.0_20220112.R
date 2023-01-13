# Install 'palmerpengins' package
# install.packages("palmerpenguins") -- Already installed

# Load 'palmerpenguins' 
library(palmerpenguins)

# View data
View(penguins)

# Skim
skim_without_charts(penguins)

# Glimpse
glimpse(penguins)

# Arrange the data
penguins %>% arrange(bill_length_mm)

# Examples of sorting and grouping data

penguins %>% 
  group_by(island) %>% 
  drop_na() %>% 
  summarize(mean_bill_length_mm = mean(bill_length_mm))

penguins %>% 
  group_by(island) %>% 
  drop_na() %>% 
  summarize(mean_bill_length_mm = max(bill_length_mm))

penguins %>% 
  group_by(species, island) %>% 
  drop_na() %>%
  summarize(max_bl = max(bill_length_mm), 
            mean_bl= mean(bill_length_mm))

# What if we only want data on Adelie penguins?

# Create plot
# ggplot(data=penguins, aes(x=flipper_length_mm, y=body_mass_g))+geom_point(aes(color=species))
# citation("palmerpenguins")
# library(tidyverse)
# library(lubridate)
# ?print