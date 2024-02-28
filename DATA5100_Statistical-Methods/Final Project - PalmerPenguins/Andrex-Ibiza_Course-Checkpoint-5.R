# Load packages
library(dplyr)
library(tidyverse)

# Load Week 4 data checkpoint
df <- readRDS("penguins_clean_w4.rds")
str(df)

# Find the expected value of flipper_length_mm
flipper_df <- data.frame(table(df$flipper_length_mm))
flipper_lengths <- as.numeric(as.character(flipper_df$Var1))
probabilities <- flipper_df$Freq/sum(flipper_df$Freq)
sum(probabilities) # should be 1

expected_flipper_length <- round(sum(flipper_lengths*probabilities), 0)
cat("The expected flipper length of a penguin from this study is", expected_flipper_length, 'millimeters.')

# Find the probability of each outcome of the species variable
species_df <- data.frame(table(df$species))
species <- as.character(species_df$Var1)
probabilities <- round(species_df$Freq/sum(species_df$Freq), 3)
sum(probabilities) # should be 1

for (i in 1:3){
  cat("The probability a penguin is the species", species[i], "is", probabilities[i],".")
}

# Make new Excel and RDS files of Week 5 data (no changes were made)
write.csv(df, "penguins_clean_w5.csv") # does not preserve variable structure
write_rds(df, "penguins_clean_w5.rds") # preserves variable structure