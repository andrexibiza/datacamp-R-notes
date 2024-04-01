#https://www.rdocumentation.org/packages/stats/versions/3.6.2/topics/aov

library(tidyverse)
library(multcomp)

#Read in Week 10 dataset
df <- readRDS("penguins_clean_w10.rds") 
str(df)

#Analysis of variance on penguin weights by species
#Weights are generally normally distributed.
#Population variances should be equal.

m <- aov(weight ~ species, df) 
summary(m)

# Perform Tukey's HSD test
tukey_results <- TukeyHSD(m, conf.level = 0.95)

# Print the results of Tukey's HSD test
print(tukey_results)

###################################################################
# Make new Excel and RDS files of Week 10 dataset (no changes were made)

#df <- readRDS("players_clean_w10.rds") 

# str(df)

write.csv(df, "penguins_clean_w11.csv") #does not preserve structure of variables
write_rds(df, "penguins_clean_w11.rds") #preserves structure of variables


#Check updated Week 8 dataset. 

#newdf <- read_rds("players_clean_w10.rds")
#str(newdf)



