### Week 14 - Multinomial Logistic Regression on the Palmer Penguins dataset
### Andrex Ibiza, MBA
### DATA5100 - Statistical Analysis - Johnson & Wales University

# Load the necessary libraries
library(tidyverse)
library(nnet)
library(caret)

# Load Week 13 dataset
df <- readRDS(file = "penguins_clean_w13.rds")
str(df)

# Remove NA values
df %>% drop_na()

# Fit the multinomial logistic regression model
multinom_model <- multinom(species ~ culmen_length_mm + culmen_depth_mm + flipper_length_mm + weight, data = df)

# Print the model summary
summary(multinom_model)

# Call:
#   multinom(formula = species ~ culmen_length_mm + culmen_depth_mm + 
#              flipper_length_mm + weight, data = df)
# 
# Coefficients:
#   (Intercept) culmen_length_mm culmen_depth_mm flipper_length_mm
# Chinstrap  -34.806703         56.16797       -80.32042         -2.546743
# Gentoo      -4.446499         38.97704       -87.02802         -1.281737
# weight
# Chinstrap -0.12676681
# Gentoo     0.02163804
# 
# Std. Errors:
#   (Intercept) culmen_length_mm culmen_depth_mm flipper_length_mm
# Chinstrap 3.330608e+00     53.187991536    3.848396e+01      11.539675662
# Gentoo    3.951616e-05      0.001697574    7.008909e-04       0.007754504
# weight
# Chinstrap 0.2522008
# Gentoo    0.1856241
# 
# Residual Deviance: 0.001556389 
# AIC: 20.00156 


# Predict the training data
df$pred <- predict(multinom_model, newdata = df, type = "class")

# Calculate accuracy
confusionMatrix(df$pred, df$species)

# Confusion Matrix and Statistics
# 
# Reference
# Prediction  Adelie Chinstrap Gentoo
# Adelie       151         0      0
# Chinstrap      0        68      0
# Gentoo         0         0    123
# 
# Overall Statistics
# 
# Accuracy : 1          
# 95% CI : (0.9893, 1)
# No Information Rate : 0.4415     
# P-Value [Acc > NIR] : < 2.2e-16  
# 
# Kappa : 1          
# 
# Mcnemar's Test P-Value : NA         
# 
# Statistics by Class:
# 
#                      Class: Adelie Class: Chinstrap Class: Gentoo
# Sensitivity                 1.0000           1.0000        1.0000
# Specificity                 1.0000           1.0000        1.0000
# Pos Pred Value              1.0000           1.0000        1.0000
# Neg Pred Value              1.0000           1.0000        1.0000
# Prevalence                  0.4415           0.1988        0.3596
# Detection Rate              0.4415           0.1988        0.3596
# Detection Prevalence        0.4415           0.1988        0.3596
# Balanced Accuracy           1.0000           1.0000        1.0000

# Write new csv and rds files
write.csv(df, "penguins_clean_w14.csv") # does not preserve variable structure
write_rds(df, "penguins_clean_w14.rds") # preserves variable structure
