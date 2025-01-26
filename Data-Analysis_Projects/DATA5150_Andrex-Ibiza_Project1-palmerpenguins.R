###### `palmerpenguins` analysis project - Andrex Ibiza - 2023-03-31
###### DATA5150 - Data Mining - Johnson & Wales University

# The `palmerpenguins` package in R presents a comprehensive collection of 
# biometric data from three penguin species (Adelie, Chinstrap, and Gentoo) 
# inhabiting the Palmer Archipelago in Antarctica. This dataset, with dimensions 
# indicating over 300 individual observations, provides a rich source of variables such 
# as species type, island location, bill dimensions (length and depth), flipper length, 
# body mass, gender, and the year of data collection.

# The package includes two datafranes - `penguins` and `penguins_raw`. For the 
# purposes of ML, we are interested in the fully-featured `penguins_raw` data.

# install.packages("palmerpenguins")

# Load packages
library(palmerpenguins) # data source
library(tidyverse)
library(naniar) # working with missing data
library(ggplot2) # visualization
library(caret) # cross-validation
  

##### Step 1) Explore dataset
df <- penguins_raw

# Print the first 5 rows of the data set
head(df, 5)

# Print the last 5 rows of the data set
tail(df, 5)

# Find the dimensions of the data set
dim(df) # 344 x 17

# Determine the names of the variables in the data set
colnames(df)
# [1] "studyName"           "Sample Number"       "Species"             "Region"             
# [5] "Island"              "Stage"               "Individual ID"       "Clutch Completion"  
# [9] "Date Egg"            "Culmen Length (mm)"  "Culmen Depth (mm)"   "Flipper Length (mm)"
# [13] "Body Mass (g)"       "Sex"                 "Delta 15 N (o/oo)"   "Delta 13 C (o/oo)"  
# [17] "Comments"   

# Determine the structure of the variables in the data set
str(df)


##### Step 2) Data Cleaning


# Reformat all column names
colnames(df)[1] <- "study_name"
colnames(df)[2] <- "sample_number"
colnames(df)[3] <- "species"
colnames(df)[4] <- "region"
colnames(df)[5] <- "island"
colnames(df)[6] <- "stage"
colnames(df)[7] <- "individual_id"
colnames(df)[8] <- "clutch_completion"
colnames(df)[9] <- "date_egg"
colnames(df)[10] <- "culmen_length_mm"
colnames(df)[11] <- "culmen_depth_mm"
colnames(df)[12] <- "flipper_length_mm"
colnames(df)[13] <- "weight"
colnames(df)[14] <- "sex"
colnames(df)[15] <- "delta_15_n"
colnames(df)[16] <- "delta_13_c"
colnames(df)[17] <- "comments"

# Recheck column names
colnames(df) # column re-naming successful!

# Check for missing data
miss_var_summary(df)

# variable          n_miss pct_miss
# <chr>              <int>    <num>
#   1 comments             290   84.3  
# 2 delta_15_n            14    4.07 
# 3 delta_13_c            13    3.78 
# 4 sex                   11    3.20 
# 5 culmen_length_mm       2    0.581
# 6 culmen_depth_mm        2    0.581
# 7 flipper_length_mm      2    0.581
# 8 weight                 2    0.581

# Visualize missing data
vis_miss(df)

# View columns manually to ensure missing data is listed as NA
df$comments # all are NA
df$delta_15_n # all are NA
df$delta_13_c # all are NA
df$sex # all are NA
df$culmen_length_mm # all are NA
df$culmen_depth_mm # all are NA
df$flipper_length_mm # all are NA
df$weight # all are NA

# Check that the sum of the number of good data values and the number of missing 
# data values is equal to the total number of data values for the columns
sum(is.na(df$comments)) + sum(!is.na(df$comments)) - nrow(df) # 0
sum(is.na(df$delta_15_n)) + sum(!is.na(df$delta_15_n)) - nrow(df) # 0
sum(is.na(df$delta_13_c)) + sum(!is.na(df$delta_13_c)) - nrow(df) # 0
sum(is.na(df$sex)) + sum(!is.na(df$sex)) - nrow(df) # 0
sum(is.na(df$culmen_length_mm)) + sum(!is.na(df$culmen_length_mm)) - nrow(df) # 0
sum(is.na(df$culmen_depth_mm)) + sum(!is.na(df$culmen_depth_mm)) - nrow(df) # 0
sum(is.na(df$flipper_length_mm)) + sum(!is.na(df$flipper_length_mm)) - nrow(df) # 0
sum(is.na(df$weight)) + sum(!is.na(df$weight)) - nrow(df) # 0

# Determine the structure of the variables in the data set
str(df)

# Output
#   ..   studyName = col_character(),           # good
#   ..   `Sample Number` = col_double(),        # should be integer - as.integer
#   ..   Species = col_character(),             # should be factor
#   ..   Region = col_character(),              # should be factor
#   ..   Island = col_character(),              # should be factor
#   ..   Stage = col_character(),               # should be factor
#   ..   `Individual ID` = col_character(),     # good
#   ..   `Clutch Completion` = col_character(), # should be binary factor
#   ..   `Date Egg` = col_date(format = ""),    # good
#   ..   `Culmen Length (mm)` = col_double(),   # good
#   ..   `Culmen Depth (mm)` = col_double(),    # good
#   ..   `Flipper Length (mm)` = col_double(),  # good
#   ..   `Body Mass (g)` = col_double(),        # good
#   ..   Sex = col_character(),                 # should be factor
#   ..   `Delta 15 N (o/oo)` = col_double(),    # good
#   ..   `Delta 13 C (o/oo)` = col_double(),    # good
#   ..   Comments = col_character()             # good

# Convert sample_number to an integer
df$sample_number <- as.integer(df$sample_number)
class(df$sample_number)

# Convert species, region, island, stage, clutch_completion, and sex to factors
df$species <- as.factor(df$species)
class(df$species)
### Simplify species factor labeling
df$species <- factor(df$species, 
                                 labels = c("Adelie", 
                                            "Chinstrap", 
                                            "Gentoo"))
df$region <- as.factor(df$region)
class(df$region)

df$island <- as.factor(df$island)
class(df$island)

df$stage <- as.factor(df$stage)
class(df$stage)

df$clutch_completion <- as.factor(df$clutch_completion)
class(df$clutch_completion)

df$sex <- as.factor(df$sex)
class(df$sex)

# Recheck the structure of the variables in the data set
str(df)

# Make new dataframe
penguins_clean <- df

# Inspect factor levels
levels(penguins_clean$species)
levels(penguins_clean$region)
levels(penguins_clean$island)
levels(penguins_clean$stage)
levels(penguins_clean$clutch_completion)
levels(penguins_clean$sex)

# Inspect dimensions of cleansed data
dim(penguins_clean)

##### Step 3) Exploratory Data Visualization
# Scatter plot culmen_length_mm x culmen_depth_mm color by species
posn_j <- position_jitter(0.1,
                          seed = 666)
ggplot(penguins_clean,
       aes(x = culmen_length_mm,
           y = culmen_depth_mm,
           color = species)) +
  geom_point(position = posn_j, alpha = 0.7, size = 5) +
  labs(title="Culmen Length (mm) vs. Culmen Length (mm) by species",
       x = "Culmen Length (mm)",
       y = "Culmen Depth (mm)") +
  scale_color_discrete("Species") +
  theme_classic()

# Boxplot of weight by species
ggplot(penguins_clean, 
       aes(x=species, 
           y=weight, 
           fill=species)) +
  geom_boxplot() +
  labs(title = "Weight by Species", 
       x = "Species", 
       y = "Weight (g)") +
  theme_classic()

# Stacked density plots of weight colored by species
ggplot(penguins_clean, aes(x=weight, fill=species)) +
  geom_density(alpha = 0.5) +
  labs(title = "Stacked Density Plots of Weight by Species", x = "Weight (g)", y = "Density") +
  theme_classic() +
  scale_y_continuous(labels = scales::comma)

# Stacked density plots of culmen_length_mm colored by species
ggplot(penguins_clean, aes(x=culmen_length_mm, fill=species)) +
  geom_density(alpha = 0.5) +
  labs(title = "Stacked Density Plots of Culmen Length (mm) by Species", x = "Culmen Length (mm)", y = "Density") +
  theme_classic() +
  scale_y_continuous(labels = scales::comma)

# Stacked density plots of culmen_depth_mm colored by species
ggplot(penguins_clean, aes(x=culmen_depth_mm, fill=species)) +
  geom_density(alpha = 0.5) +
  labs(title = "Stacked Density Plots of Culmen Depth (mm) by Species", x = "Culmen Depth (mm)", y = "Density") +
  theme_classic() +
  scale_y_continuous(labels = scales::comma)

# Segmented bar plot of species by island
ggplot(penguins_clean, aes(x = island, fill = species)) +
  geom_bar(position = "stack") +
  labs(title = "Segmented Bar Plot of Species Counts by Island", x = "Island", y = "Count") +
  theme_classic()

##### Outlier Detection Using Z-scores

# To determine if there are any outliers in the dataset, we can calculate the 
# z-scores for each numerical variable in the `penguins_clean` dataset. 
# A z-score indicates how many standard deviations an element is from the mean. 
# A common threshold for identifying outliers is a z-score of 
# greater than 3 or less than -3. 
df <- penguins_clean

# Calculate z-score for flipper_length_mm
df$z_flipper_length_mm <- (df$flipper_length_mm - mean(df$flipper_length_mm))/sd(df$flipper_length_mm)
zdf_flipper_length_mm <- df %>% filter(z_flipper_length_mm > 3 | z_flipper_length_mm < -3)
outliers_flipper_length_mm <- zdf_flipper_length_mm$flipper_length_mm
outliers_flipper_length_mm
## There are no outliers in flipper_length_mm.

# Calculate z-scores for 'culmen_depth_mm'
df$z_culmen_depth_mm <- (df$culmen_depth_mm - mean(df$culmen_depth_mm)) / sd(df$culmen_depth_mm)
zdf_culmen_depth_mm <- df %>% filter(z_culmen_depth_mm > 3 | z_culmen_depth_mm < -3)
outliers_culmen_depth_mm <- zdf_culmen_depth_mm$culmen_depth_mm
outliers_culmen_depth_mm
## There are no outliers for culmen_depth_mm

# Calculate Z-score for weight
df$z_weight <- (df$weight - mean(df$weight)) / sd(df$weight)
zdf_weight <- df %>% filter(z_weight > 3 | z_weight < -3)
outliers_weight <- zdf_weight$weight
outliers_weight
## There are no outliers for weight

##### Cross-Validation

# The following R code demonstrates the implementation of cross-validation 
# on the penguins_raw dataset, provided by the palmerpenguins package, to evaluate 
# the robustness of a linear regression model. The model predicts penguin weight 
# based on flipper length, a biologically relevant predictor in avian studies. 

# We employ a 10-fold cross-validation approach, facilitated by the caret package, 
# to partition the dataset into ten unique training and validation subsets. 
# This method provides a rigorous assessment of the model's predictive performance, 
# allowing us to estimate the accuracy of predictions on new, unseen data. 
# The process not only guards against overfitting but also yields insights into 
# the generalization ability of the model beyond the sampled data.

# str(df) - sanity check to make sure data still loaded properly

# Assume 'df' is the pre-loaded penguins data
# First, convert flipper length from mm to cm
df$flipper_length_cm <- df$flipper_length_mm / 10

# Preprocess the dataset: remove NA values and select variables of interest
df_processed <- na.omit(df[, c("flipper_length_cm", "weight")])

# Rename the columns for simplicity
names(df_processed) <- c("flip_len", "wt")

# Set up cross-validation control with 10-folds
train_control <- trainControl(method = "repeatedcv", 
                              number = 10,
                              repeats = 5)

# Train the linear model using cross-validation
model_cv <- train(wt ~ flip_len,
                  data = df_processed,
                  method = "lm",
                  trControl = train_control)

# Print out the results of the cross-validation
print(model_cv)

# The 10-fold CV for linear regression yields 
         # an RMSE of 392.6113, 
         # R-squared of 0.7677, 
        # and MAE of 314.6119, 
# indicating a strong model fit and good predictive accuracy.









