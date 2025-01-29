#https://www.rdocumentation.org/packages/stats/versions/3.6.2/topics/aov

library(tidyverse)
library(multcomp)
library(car)  # for Levene's test
library(MASS) # for Box-Cox transformation

#Read in Week 10 dataset
df <- readRDS("penguins_clean_w10.rds") 
str(df)

# Remove rows with missing values in the variables of interest
penguins_complete <- na.omit(df[, c("species", "weight")])

# Perform Levene's test for equal variances
leveneTest(weight ~ species, data = penguins_complete)

### Levene's test shows that the variances are definitely
### not equal, so a standard ANOVA test should not be used.

###### Alternative 1: Welch's ANOVA
anova_results <- oneway.test(weight ~ species, data = penguins_complete, var.equal = FALSE)

# Output the results of Welch's ANOVA
anova_results

###### Alternative 2: Box-Cox Transformation

# Apply the Box-Cox transformation
bc <- boxcox(weight ~ species, data = penguins_complete)

# Find the lambda that maximizes the log-likelihood
best_lambda <- bc$x[which.max(bc$y)]

# Transform the data using the best lambda
penguins_complete$weight_transformed <- (penguins_complete$weight^best_lambda - 1) / best_lambda

# Diagnostic plot to assess normality of transformed data
hist(penguins_complete$weight_transformed, main = "Histogram of Transformed Body Mass", xlab = "Transformed Body Mass")
qqnorm(penguins_complete$weight_transformed)
qqline(penguins_complete$body_mass_g_transformed)

# The plot should be a straight line. It's not.

###### Alternative 3: Log Transformation of weight
# Apply log transformation
penguins_complete$weight_log <- log(penguins_complete$weight)

# We can now proceed with the analysis using the transformed data
# The following example performs a simple linear model (ANOVA) on the transformed data
anova_log <- aov(weight_log ~ species, data = penguins_complete)

# Output the summary of the ANOVA
summary(anova_log)

##### All three alternatives reach the same conclusion: 
##### The null hypothesis that the population means are
##### equal should be rejected.

m <- aov(weight ~ species, df)
summary(m)

# Perform Tukey's HSD test
tukey_results <- TukeyHSD(m, conf.level = 0.95)

# Print the results of Tukey's HSD test
print(tukey_results)

# diff       lwr       upr     p adj
# Chinstrap-Adelie   32.42598 -126.5002  191.3522 0.8806666
# Gentoo-Adelie    1375.35401 1243.1786 1507.5294 0.0000000
# Gentoo-Chinstrap 1342.92802 1178.4810 1507.3750 0.0000000


###################################################################
# Make new Excel and RDS files of Week 10 dataset (no changes were made)

#df <- readRDS("players_clean_w10.rds") 

# str(df)

write.csv(df, "penguins_clean_w11.csv") #does not preserve structure of variables
write_rds(df, "penguins_clean_w11.rds") #preserves structure of variables


#Check updated Week 8 dataset. 

#newdf <- read_rds("players_clean_w10.rds")
#str(newdf)



