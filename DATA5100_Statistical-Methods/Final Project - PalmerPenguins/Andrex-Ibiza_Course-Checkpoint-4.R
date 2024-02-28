# Week 4 palmerpenguins project checkpoint
# Load packages
library(tidyverse)
library(ggplot2)

df <- readRDS("penguins_clean_w3.rds")

# Which numerical variables have an approximately symmetric distribution?
# Subsetting penguins_clean by only columns with numerical data
penguins_numeric <- df[sapply(df, is.numeric)]
str(penguins_numeric)


# Apply the Empirical Rule to one of the approximately symmetric numerical 
# data values in your data set. If none of your numerical data values are 
# approximately symmetric, state this in your written analysis.

# Reshape the data
penguins_long <- penguins_numeric %>%
  pivot_longer(cols = -sample_number, names_to = "variable", values_to = "value")

# Create faceted histograms for each variable in penguins_numeric
ggplot(penguins_long, aes(x = value)) +
  geom_histogram(bins = 30, fill = 'blue', color = 'black') +
  facet_wrap(~ variable, scales = 'free_x') +
  theme_minimal() +
  labs(title = 'Faceted Histograms for Each Numeric Variable in Penguins Dataset',
       x = 'Value',
       y = 'Frequency')
##### The Empirical Rule does not apply to any of these variables.

# Function to apply Chebyshev's Rule to culmen_length_mm
# Calculate the mean and standard deviation for culmen_length_mm
mean_culmen_length <- mean(penguins_numeric$culmen_length_mm, na.rm = TRUE)
sd_culmen_length <- sd(penguins_numeric$culmen_length_mm, na.rm = TRUE)

# Define k for Chebyshev's inequality (e.g., k = 2 for 75%)
k <- 2

# Calculate the range using Chebyshev's inequality
minus_k_sd <- round(mean_culmen_length - k*sd_culmen_length, 1)
plus_k_sd <- round(mean_culmen_length + k*sd_culmen_length, 1)
percent <- (1 - 1/k^2)*100

cat("By Chebyshev's Rule, at least", percent, "% of the penguins' culmen lengths 
    are between", minus_k_sd, "and", plus_k_sd, ".")

##### Outlier Detection Using Z-scores

# To determine if there are any outliers in the dataset, we can calculate the 
# z-scores for each numerical variable in the `penguins_numeric` dataset. 
# A z-score indicates how many standard deviations an element is from the mean. 
# A common threshold for identifying outliers is a z-score of 
# greater than 3 or less than -3. Let's calculate the z-scores for the 
# numerical variables and identify any outliers.

# Calculate z-score for flipper_length_mm
df$z_flipper_length_mm <- (df$flipper_length_mm - mean(df$flipper_length_mm))/sd(df$flipper_length_mm)
zdf_flipper_length_mm <- df %>% filter(z_flipper_length_mm > 3 | z_flipper_length_mm < -3)
outliers_flipper_length_mm <- zdf_flipper_length_mm$flipper_length_mm
## There are no outliers in flipper_length_mm.

# Calculate z-scores for 'culmen_depth_mm'
df$z_culmen_depth_mm <- (df$culmen_depth_mm - mean(df$culmen_depth_mm)) / sd(df$culmen_depth_mm)
zdf_culmen_depth_mm <- df %>% filter(z_culmen_depth_mm > 3 | z_culmen_depth_mm < -3)
outliers_culmen_depth_mm <- zdf_culmen_depth_mm$culmen_depth_mm
## There are no outliers for culmen_depth_mm

# Calculate Z-score for body_mass_g
df$z_body_mass_g <- (df$body_mass_g - mean(df$body_mass_g)) / sd(df$body_mass_g)
zdf_body_mass_g <- df %>% filter(z_body_mass_g > 3 | z_body_mass_g < -3)
outliers_body_mass_g <- zdf_body_mass_g$body_mass_g
## There are no outliers for body_mass_g


##### Coefficient of Variation Comparison
coefficient_of_variation <- function(x) {
  (sd(x, na.rm = TRUE) / mean(x, na.rm = TRUE)) * 100
}

# Select variables to compare
selected_variables <- c('culmen_length_mm', 'flipper_length_mm', 'body_mass_g')

# Calculate CV for each selected variable
cv_values <- sapply(penguins_numeric[selected_variables], coefficient_of_variation)

# Output the CV values
cv_values

