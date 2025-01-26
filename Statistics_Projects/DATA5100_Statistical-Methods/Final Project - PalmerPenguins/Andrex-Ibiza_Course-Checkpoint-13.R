# Load packages
library(tidyverse)
library(stats)

# Load Week 12 data, verify structure
df <- readRDS("penguins_clean_w12.rds") 
str(df)

###### Chi square goodness of fit test
### to test the distribution of species in the penguins dataset

# Set seed for reproducibility
set.seed(666)

# Observe actual frequencies for each species
actual_frequencies <- table(df$species)

# Assuming we expect the species to be evenly distributed
expected_frequencies <- rep(1/length(unique(df$species)), length(unique(df$species)))

# Perform chi-square goodness of fit test
chi_square_test <- chisq.test(x = actual_frequencies, p = expected_frequencies)

# Output the result of the chi-square test
chi_square_test

# Chi-squared test for given probabilities
# 
# data:  actual_frequencies
# X-squared = 31.907, df = 2, p-value = 1.179e-07


##### Chi-square test for independence
### between `species` and `island`

# Test the independence between 'species' and 'island' in the penguins dataset
# Create a contingency table of the two categorical variables
contingency_table <- table(df$species, df$island)

# Perform chi-square test of independence
chi_square_independence_test <- chisq.test(contingency_table)

# Output the result of the chi-square test of independence
chi_square_independence_test

# Pearson's Chi-squared test
# 
# data:  contingency_table
# X-squared = 299.55, df = 4, p-value < 2.2e-16

# No dataset changes this week
write.csv(df, "penguins_clean_w13.csv") #does not preserve structure of variables
write_rds(df, "penguins_clean_w13.rds") #preserves structure of variables



