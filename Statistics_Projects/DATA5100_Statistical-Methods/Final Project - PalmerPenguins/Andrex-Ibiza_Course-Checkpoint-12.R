#https://stats.stackexchange.com/questions/183225/confidence-interval-from-rs-prop-test-differs-from-hand-calculation-and-resul

#install.packages("binom") 
#install.packages("stats") 
library(binom)
library(tidyverse)
library(dplyr)
library(stats)

#Read in Week 10 dataset
df <- readRDS("penguins_clean_w11.rds") 
str(df)

# Assuming the proportion of Adelie penguins in the dataset 
# is our population proportion
p_population <- mean(df$species == "Adelie")

# Take a random sample of size 100 from the dataset
set.seed(666) # For reproducibility
sample_data <- df[sample(nrow(df), 100), ]

# Calculate the sample proportion of Adelie penguins
p_sample <- mean(sample_data$species == "Adelie")

# Construct a 95% confidence interval for the population proportion
conf_interval <- binom.confint(x = sum(sample_data$species == "Adelie"), 
                               n = 100, 
                               conf.level = 0.95, 
                               methods = "exact")

# Extract lower and upper confidence limits
lower_bound <- conf_interval$lower
upper_bound <- conf_interval$upper

# Conduct a z hypothesis test
z_test <- prop.test(x = sum(sample_data$species == "Adelie"), 
                    n = 100, 
                    p = p_population, 
                    alternative = "two.sided", 
                    conf.level = 0.95)

# Print the results
print(conf_interval)
print(z_test)

cat('The population proportion of Adelie penguins is ',p_population) 
cat('The 95% confidence interval for the population proportion of Adelie penguins is (', 
    lower_bound, ', ', upper_bound, ')', sep = '')

# TWO TAILED HYPOTHESIS TEST

# Step 1: Null and Alternative Hypotheses
# H0: p = 0.44, HA: p != 0.44
population_p <- 0.44 
claim <- "H0"

# Step 2: Define alpha level and critical z value
alpha <- 0.05
zc <- qnorm(1 - alpha/2) # critical value for two-tailed test

# Step 3: Calculate sample proportion and z statistic
phat <- mean(df$species == "Adelie") # sample proportion of Adelie penguins
n <- length(df$species) # sample size
se <- sqrt(population_p * (1 - population_p) / n) # standard error
z <- (phat - population_p) / se # z statistic

# Calculate p-value
p_value <- 2 * (1 - pnorm(abs(z))) # two-tailed p-value

# Print z statistic and p-value
cat("Z-statistic:", z, "\nP-value:", p_value)

# Step 4: Decision rule
rejectH0 <- FALSE
if (p_value < alpha) {
  cat('Since p < alpha: reject H0.\n') 
  rejectH0 <- TRUE
} else {
  cat('Since p >= alpha: do not reject H0.\n')
}

# Step 5: Conclusion based on the claim
if (claim == "H0" && rejectH0 == TRUE) {
  cat('There is enough evidence to reject the claim.\n')
} else if (claim == "H0" && rejectH0 == FALSE) {
  cat('There is not enough evidence to reject the claim.\n')
} else if (claim == "HA" && rejectH0 == TRUE) {
  cat('There is enough evidence to support the claim.\n')
} else {
  cat('There is not enough evidence to support the claim.\n')
}

# Confirm CI with binom.confint
num_adelie <- sum(df$species == "Adelie")

# Asymptotic (Wald) confidence interval
conf_int <- binom.confint(x = num_adelie, n = n, method = "asymptotic", conf.level = 1 - alpha)

# Print the confidence interval
cat('The 95% confidence interval for the population proportion of Adelie penguins is (', 
    conf_int$lower, ', ', conf_int$upper, ')\n', sep = '')



# One-sample test for the proportion of Adélie penguins
# Testing against the null hypothesis that the proportion is 0.44
num_adelie <- sum(df$species == "Adelie")
n <- length(df$species) # Total number of observations in the sample

# Perform the test
one_prop_test <- prop.test(x = num_adelie, n = n, p = population_p, alternative = "two.sided", conf.level = 0.95)

# Print the results
print(one_prop_test)

# No dataset changes this week
write.csv(df, "penguins_clean_w12.csv") #does not preserve structure of variables
write_rds(df, "penguins_clean_w12.rds") #preserves structure of variables



