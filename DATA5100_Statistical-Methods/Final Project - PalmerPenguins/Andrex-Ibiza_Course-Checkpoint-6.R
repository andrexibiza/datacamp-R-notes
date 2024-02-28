library(tidyverse)
library(dplyr)
library(gt) #for nice tables
library(scales)

#Read in Week 5 dataset
df <- readRDS("penguins_clean_w5.rds") 
str(df)

#### Discrete Probability Distribution for Heights

# Find the probability of each weight (body_mass_g)
weights_freq_distribution <- data.frame(table(df$body_mass_g))
weights <- as.numeric(as.character(weights_freq_distribution$Var1))
probabilities <- round(weights_freq_distribution$Freq/sum(weights_freq_distribution$Freq),4)
sum(probabilities) #should sum to 1 

# Construct a discrete probability distribution of heights
weights_discrete_prob_distribution <- data.frame(weights,probabilities)

# Nice print out of discrete probability distribution
# weights_discrete_prob_distribution %>% gt()

# Graph of discrete probability distribution
ggplot(weights_discrete_prob_distribution, aes(x=weights, y=probabilities)) + 
  geom_col(fill = "steelblue", color = "black") + # Use geom_col() for bar plots of pre-summarized data
  labs(title = "Discrete Probability Distribution of Penguin Weights",
       x = "Weight (body_mass_g)",
       y = "Probability") +
  theme_minimal() + # Cleaner theme
  theme(plot.title = element_text(hjust = 0.5)) # Center the plot title

# Cleaner density plot visualization
ggplot(df, aes(x = body_mass_g)) + 
  geom_density(fill = "blue", alpha = 0.5) +
  scale_y_continuous(labels = scales::comma) +
  xlab("Body Mass (g)") + 
  ylab("Density") +
  ggtitle("Density Plot of Penguin Body Weight in Grams")


####Binomial Probability Distribution  for Species

#Find the probability a penguin is species Adelie (one trial)
p <- sum(df$species == "Adelie")/ length(df$species)

#Find the probability a penguin is not species Adelie (one trial)
q <- sum(df$species != "Adelie")/ length(df$species)

#Check that  p + q = 1
p + q

#Find binomial probabilities that if n penguins are selected at random,
# exactly x of them will be Adelie species

x <- 1:10
n <- 10
binomial_probabilities <- round(dbinom(x,n,p),4)

#Construct binomial probability distribution
species_binomial_prob_distribution <- data.frame(x, binomial_probabilities) 

#Nice print our of binomial probability distribution
# species_binomial_prob_distribution %>% gt() 

breaks <- c(0:n)
ggplot(species_binomial_prob_distribution, aes(x, y=binomial_probabilities)) + 
  geom_bar(stat = "identity", fill = "blue") + 
  scale_x_continuous(breaks = breaks) +
  ggtitle("Binomial Probability Distribution for Species Adelie, n=10")

# Make new Excel and RDS files of Week 6 dataset (no changes were made)

df <- readRDS("penguins_clean_w5.rds") 

str(df)

write.csv(df, "penguins_clean_w6.csv") #does not preserve structure of variables

write_rds(df, "penguins_clean_w6.rds") #preserves structure of variables


#Check updated Week 6 dataset. 

newdf <- read_rds("penguins_clean_w6.rds")
str(newdf)
