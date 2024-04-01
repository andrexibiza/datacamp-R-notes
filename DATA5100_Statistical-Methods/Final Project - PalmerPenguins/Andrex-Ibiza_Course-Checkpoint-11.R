#https://www.rdocumentation.org/packages/stats/versions/3.6.2/topics/aov

library(tidyverse)

#Read in Week 10 dataset
df <- readRDS("penguins_clean_w10.rds") 
str(df)

#Analysis of variance on penguin weights by species
#Weights are generally normally distributed.
#Population variances should be equal.

#Assume dataset is population

table(df$species) # Adelie 152, Chinstrap 68, Gentoo 124.

Adelie_weights_df <- df %>%
  filter(!is.na(weight),           # drop NA values
         species == 'Adelie') %>%  # Adelie species
  select(weight)
Adelie_weights <- Adelie_weights_df$weight # initialize Adelie weights vector

Chinstrap_weights_df <- df %>%
  filter(!is.na(weight),              # drop NA values
         species == 'Chinstrap') %>%  # Chinstrap species
  select(weight)
Chinstrap_weights <- Chinstrap_weights_df$weight # initialize Chinstrap weights vector

Gentoo_weights_df <- df %>%
  filter(!is.na(weight),              # drop NA values
         species == 'Gentoo') %>%     # Gentoo species
  select(weight) 
Gentoo_weights <- Gentoo_weights_df$weight # initialize Gentoo weights vector

mu_Adelie <- mean(Adelie_weights)
mu_Chinstrap <- mean(Chinstrap_weights)
mu_Gentoo <- mean(Gentoo_weights)
mu <- mean(df$weight)

cat('The population mean of Adelie penguin weights is:', mu_Adelie, '.')
cat('The population mean of Chinstrap penguin weights is:', mu_Chinstrap, '.')
cat('The population mean of Gentoo penguin weights is:', mu_Gentoo, '.')
cat('The population mean of all penguin weights is:', mu, '.')

sigma_squared_Adelie <- sd(Adelie_weights)^2
sigma_squared_Chinstrap <- sd(Chinstrap_weights)^2
sigma_squared_Gentoo <- sd(Gentoo_weights)
sigma_squared <- sd(df$weight)^2


cat('The population variance of penguin weights is:', sigma_squared, '.')
cat('The population variances of penguin weights for species Adelie, Chinstrap, and Gentoo, respectively, are:', sigma_squared_Adelie, sigma_squared_Chinstrap, sigma_squared_Gentoo '.')
cat('The population variances of penguin heights are close.') 
#Could use F test to test population variances


#Take samples of size 20 from each penguin species

n <- 20 #sample size
sample_heights_ <- sample(Midwest_heights,n)
sample_heights_Northeast <- sample(Northeast_heights,n)
sample_heights_South <- sample(South_heights,n)


#Find mean and variance of each sample

xbar_Midwest_sample <- mean(sample_heights_Midwest)
xbar_Northeast_sample <- mean(sample_heights_Northeast)
xbar_South_sample <- mean(sample_heights_South)
xbar_West_sample <- mean(sample_heights_West)

s_squared_Midwest_sample <- sd(sample_heights_Midwest)^2
s_squared_Northeast_sample <- sd(sample_heights_Northeast)^2
s_squared_South_sample <- sd(sample_heights_South)^2
s_squared_West_sample <- sd(sample_heights_West)^2

#Hypothesis Test

#Step 1
#H0: mu_MW = mu_NE = mu_S = mu_E
#HA: At least one mean is different from the others.
claim <- "H0"

#Step 2
#n = 20
N <- 4*n #already used n for sample size
k <- 4
alpha <- 0.05
df_N <- k-1
df_D <- N-k
fc <- qf(1-0.05,df_N,df_D)

#Step 3
sample_heights <- c(sample_heights_Midwest,sample_heights_Northeast,sample_heights_South,sample_heights_West)
x_double_bar <- sum(sample_heights)/length(sample_heights)

SSB <- n*(xbar_Midwest_sample-x_double_bar)^2 + n*(xbar_Northeast_sample-x_double_bar)^2 + n*(xbar_South_sample-x_double_bar)^2 + n*(xbar_West_sample-x_double_bar)^2
MSB <- SSB/df_N

SSW <- (n-1)*s_squared_Midwest_sample + (n-1)*s_squared_Northeast_sample + (n-1)*s_squared_South_sample + (n-1)*s_squared_West_sample
MSW <- SSW/df_D

F <- MSB/MSW 


#Step 4: 
if (F < fc){
  cat('Since F < fc: do not reject H0.')
  rejectH0 <- FALSE
} else {
  cat('Since F > fc: reject H0.') 
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

#ANOVA Summary Table
tab <- as.table(rbind(c(SSB, df_N, MSB,F), c(SSW, df_D, MSW,"NA")))
dimnames(tab) <- list(c("Between", "Within"),c("Sum of Squares", "df", "Mean Square", "F"))
print(tab) 

#Check results with R function aov

heights <- sample_heights
groups <- c(replicate(n,'Midwest'),replicate(n,'Northeast'),replicate(n,'North'),replicate(n,'West')) 

x <- data.frame(heights, groups)

m <- aov(heights ~ groups, x) 

summary(m)

###################################################################
# Make new Excel and RDS files of Week 9 dataset (no changes were made)

#df <- readRDS("players_clean_w10.rds") 

str(df)

write.csv(df, "players_clean_w11.csv") #does not preserve structure of variables

write_rds(df, "players_clean_w11.rds") #preserves structure of variables


#Check updated Week 8 dataset. 

newdf <- read_rds("players_clean_w10.rds")
str(newdf)



