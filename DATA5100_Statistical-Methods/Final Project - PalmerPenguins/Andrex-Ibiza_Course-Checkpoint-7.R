library(tidyverse)
library(dplyr)
library(scales) # for formatting axes

#Read in Week 6 dataset
df <- readRDS("penguins_clean_w6.rds") 
str(df)

### Continuous Probability Distribution for Weights

# Construct a Q-Q plot for body_mass_g
qq_plot <- ggplot(df, aes(sample = body_mass_g)) +
  stat_qq(color = "red") +
  stat_qq_line() +
  ggtitle('Q-Q Plot of Penguin Body Mass') +
  xlab('Theoretical Quantiles') +
  ylab('Sample Quantiles')

# Display the Q-Q plot
print(qq_plot)

# Calculate mean and standard deviation of body_mass_g
body_mass_stats <- df %>%
  summarise(mean_mass = mean(body_mass_g, na.rm = TRUE),
            sd_mass = sd(body_mass_g, na.rm = TRUE))

# Extract the mean and standard deviation
mean_mass <- body_mass_stats$mean_mass
sd_mass <- body_mass_stats$sd_mass

# Density plot with superimposed normal distribution
ggplot(df, aes(x = body_mass_g)) + 
  geom_density(fill = "blue", alpha = 0.5) +
  stat_function(fun = dnorm, args = list(mean = mean_mass, sd = sd_mass), color = "red", linetype = "dashed") +
  scale_y_continuous(labels = scales::comma) +
  xlab("Body Mass (g)") + 
  ylab("Density") +
  ggtitle("Density Plot of Weight in Grams with Normal Distribution")



#Normal Approximation to Binomial Distribution for Species

# Find the probability a penguin is species Adelie (one trial)
p <- sum(df$species == "Adelie") / length(df$species)

# Find the probability a penguin is not species Adelie (one trial)
q <- sum(df$species != "Adelie") / length(df$species)

# Check that p + q = 1
p + q

# Find binomial probabilities that if n penguins are selected at random,
# exactly x of them will be Adelie, where np >= 10 and nq >= 10.
n <- 30
x <- 0:n
np <- n * p
nq <- n * q
cat('np =', np, '>= 10')
cat('nq =', nq, '>= 10')

binomial_probabilities <- round(dbinom(x, n, p), 4)

# Construct binomial probability distribution
species_binomial_prob_distribution <- data.frame(x, binomial_probabilities)

# Superimpose a normal distribution
mean_binom <- n * p
sd_binom <- sqrt(n * p * q)

ggplot(species_binomial_prob_distribution, aes(x, y = binomial_probabilities)) + 
  geom_bar(stat = "identity", fill = "blue") +  # Make it blue
  stat_function(fun = dnorm, args = list(mean = mean_binom, sd = sd_binom), color = "red") +
  scale_x_continuous(breaks = 0:n) +
  ggtitle("Binomial Probability Distribution for Species Adelie with Normal Approximation")

# Find binomial probabilities that if n penguins are selected at random,
# exactly x of them will be Adelie species
x <- 0:10
n <- 10
binomial_probabilities <- round(dbinom(x, n, p), 4)

# Construct binomial probability distribution
species_binomial_prob_distribution <- data.frame(x, binomial_probabilities)


breaks <- c(0:n)
mean_binom <- n * p
sd_binom <- sqrt(n * p * q)

ggplot(species_binomial_prob_distribution, aes(x, y = binomial_probabilities)) + 
  geom_bar(stat = "identity", fill = "blue") + 
  stat_function(fun = dnorm, args = list(mean = mean_binom, sd = sd_binom), color = "red") +
  scale_x_continuous(breaks = breaks) +
  ggtitle("Binomial Probability Distribution for Species Adelie with Normal Approximation")

# Make new Excel and RDS files of Week 7 dataset (no changes were made)

df <- readRDS("penguins_clean_w6.rds") 
str(df)

write.csv(df, "penguins_clean_w7.csv") #does not preserve structure of variables
write_rds(df, "penguins_clean_w7.rds") #preserves structure of variables