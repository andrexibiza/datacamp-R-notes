#https://www.rdocumentation.org/packages/stats/versions/3.6.2/topics/t.test

library(tidyverse)
library(dplyr)

#Read in Week 9 dataset
df <- readRDS("penguins_clean_w9.rds") 
str(df)

#For this checkpoint, I am assuming my dataset is a sample.

#If your dataset is a population take a sample of size greater than 30 and
#find the sample mean and standard deviation of the variable you are studying

#n <- 100
#sample_heights <- sample(df$height,n)
#xbar <- mean(sample_heights) #sample mean 
#s <- sd(sample_heights) #sample sd


#If your dataset is a sample, find sample mean and standard deviation 
#of the variable you are studying.

# Calculate sample mean and standard deviation
xbar <- mean(df$weight, na.rm = TRUE) # Sample mean
s <- sd(df$weight, na.rm = TRUE) # Sample standard deviation
n <- nrow(df) # Sample size

cat('The sample mean penguin weight is:',xbar,'with sample standard deviation',s) 


#CONFIDENCE INTERVAL

#Construct 95% CI for weights based on your sample
tc <- qt(0.975,n-1) 
se <- s/sqrt(n) 
E <- tc*se
lower_bound_CI <- xbar - E
upper_bound_CI <- xbar + E

cat('95% confidence interval for population mean: (',lower_bound_CI,',',upper_bound_CI,')') 


# Bootstrap estimation for population mean weight in grams

# 1. Ensure the 'weight' column is numeric, in case it's not
df$weight <- as.numeric(as.character(df$weight))

# 2. Bootstrap Function
bootstrap_mean <- function(df, n_bootstrap) {
  bootstrap_means <- numeric(n_bootstrap)
  for (i in 1:n_bootstrap) {
    sample_indices <- sample(1:length(df), replace = TRUE)
    sample_data <- df[sample_indices]
    bootstrap_means[i] <- mean(sample_data, na.rm = TRUE)
  }
  return(bootstrap_means)
}

# 3. Generate Bootstrap Distribution
# Assuming we want to perform 1000 bootstrap resamples
n_bootstrap <- 15000
bootstrap_distribution <- bootstrap_mean(df$weight, n_bootstrap)

# 4. Estimate Mean and Confidence Interval
estimated_mean <- mean(bootstrap_distribution)
conf_interval <- quantile(bootstrap_distribution, probs = c(0.025, 0.975))

# Print the results
print(paste("Estimated Mean:", estimated_mean))
print(paste("95% Confidence Interval:", conf_interval[1], "-", conf_interval[2]))

# TWO TAILED HYPOTHESIS TEST

# Define hypotheses
# Null hypothesis (HO): mu = 4202
# Alternative hypothesis (HA): mu != 4202

# Step 1: Significance level
alpha <- 0.05

# Step 2: Calculate test statistic
mu_0 <- 4202 # Hypothesized population mean
se <- s / sqrt(n) # Standard error
t <- (xbar - mu_0) / se # Test statistic

# Step 3: Calculate p-value for two-tailed test
p <- 2 * (1 - pt(abs(t), n - 1))

cat('Test statistic:', t, '\n')
cat('P-value:', p, '\n')

# Step 4: Decision rule
if (p > alpha) {
  cat('Since p > alpha: do not reject H0.\n')
  rejectH0 <- FALSE
} else {
  cat('Since p <= alpha: reject H0.\n')
  rejectH0 <- TRUE
}

# Step 5: Conclusion
if (!rejectH0) {
  cat('There is not enough evidence to reject the null hypothesis (HO).\n')
} else {
  cat('There is enough evidence to reject the null hypothesis (HO).\n')
}

#Confirm CI and hypothesis test with z.test function

result <- t.test(df$weight, mu = 4202) #for sample data set
#result <- t.test(sample_heights, mu = 78) #for populations data set

result

#z.test(sample_heights, mu = mu, sigma.x = sigma, conf.level = 0.95)  


###################################################################
# Make new Excel and RDS files of Week 9 dataset (no changes were made)

df <- readRDS("penguins_clean_w9.rds") 

str(df)

write.csv(df, "penguins_clean_w10.csv") #does not preserve structure of variables

write_rds(df, "penguins_clean_w10.rds") #preserves structure of variables


#Check updated Week 8 dataset. 

newdf <- read_rds("penguins_clean_w10.rds")
str(newdf)



