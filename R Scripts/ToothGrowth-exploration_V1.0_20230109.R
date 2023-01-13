data("ToothGrowth")
View(ToothGrowth)

# Apply a filter
filtered_tg <- filter(ToothGrowth, dose==0.5)
View(filtered_tg)

# Sort the data
arrange(filtered_tg,len)

# Nested function
arrange(filter(ToothGrowth,dose==0.5),len)+

# Use a pipe
filtered_toothgrowth <- ToothGrowth %>%
  filter(dose==0.5) %>% 
  arrange(len)

## Same result as the other methods. 
## Pipes help make programming more efficient 
## and less cluttered.

filtered_toothgrowth <- ToothGrowth %>%
  filter(dose==0.5) %>% 
  group_by(supp) %>% 
  summarize(mean_len = mean(len,na.rm = T),.group='drop')
