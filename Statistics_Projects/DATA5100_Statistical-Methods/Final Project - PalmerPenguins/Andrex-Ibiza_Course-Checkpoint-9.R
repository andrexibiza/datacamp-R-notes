# https://www.rdocumentation.org/packages/BSDA/versions/1.2.2/topics/z.test
# install.packages('BSDA')

library(BSDA)
library(tidyverse)
library(dplyr)

# Read in Week 8 Dataset
df <- readRDS("penguins_clean_w8.rds")
#colnames(df)

#Find population mean and standard deviation
mu <- mean(df$weight, na.rm = TRUE) #population mean 
sigma <- sd(df$weight, na.rm = TRUE) #population sd

cat('The population mean penguin weight is:',mu,'with population standard deviation',sigma)

#Take random sample of size greater than 30 with replacement. 
n <- 100
sample_weights <- sample(df$weight, n, replace = TRUE) # Added replace = TRUE for sampling with replacement

#CONFIDENCE INTERVAL

#Construct 95% CI for weights based on sample
xbar <- mean(sample_weights, na.rm = TRUE) #sample mean
s <- sd(sample_weights, na.rm = TRUE) #sample sd
zc <- qnorm(0.975) # Corrected to only calculate once for the upper tail
se <- s/sqrt(n) # Changed to use sample standard deviation 's' instead of population 'sigma'
E <- zc*se
lower_bound_CI <- xbar - E
upper_bound_CI <- xbar + E

cat('95% confidence interval for population mean: (',lower_bound_CI,',',upper_bound_CI,')') 

#TWO TAILED HYPOTHESIS TEST
#Step 1: HO: mu = mean(weights),  HA: mu != mean(weights)
claim <- "H0"


#Step 2: 
alpha <- 0.05
zc <- qnorm(1 - alpha/2) # Corrected to find the critical value for both tails

#Step 3: 
xbar <- mean(sample_weights, na.rm = TRUE)
mu_xbar = mu
se <- sigma/sqrt(n) 
z = (xbar-mu_xbar)/se
if (!is.na(z)) { # Added check to ensure z is not NA before proceeding
  if (z > 0) {
    p <- (1- pnorm(z,0,1))*2
  } else {
    p <- pnorm(z,0,1)*2 
  }
  z
  p
  
  #Step 4: 
  if (p > 0.05){
    cat('Since p > 0.05: do not reject H0.')
    rejectH0 <- FALSE
  } else {
    cat('Since p < 0.05: reject H0.') 
    rejectH0 <- TRUE
  }
  
  #Step 5
  if (claim == "H0" & rejectH0 == TRUE){
    cat('There is enough evidence to reject the claim.')
  } else if (claim == "H0" & rejectH0 == FALSE) {
    cat('There is not enough evidence to reject the claim.')
  } else if (claim == "HA" & rejectH0 == TRUE) {
    cat('There is enough evidence to support the claim.')
  } else {
    cat('There is not enough evidence to support the claim.')
  }
}

#Confirm CI and hypothesis test with z.test function

z.test(sample_weights, mu = mu, sigma.x = sigma, conf.level = 0.95)  


###################################################################
# Make new Excel and RDS files of Week 9 dataset (no changes were made)

#df <- readRDS("players_clean_w8.rds") 

#str(df)

write.csv(df, "penguins_clean_w9.csv") #does not preserve structure of variables

write_rds(df, "penguins_clean_w9.rds") #preserves structure of variables


#Check updated Week 8 dataset. 

newdf <- read_rds("penguins_clean_w9.rds")
str(newdf)