# Load packages
library(palmerpenguins) # data source
library(tidyverse)
library(dplyr)
library(naniar) # working with missing data
df <- penguins_raw

# Print the first 10 rows of the data set
head(df, 10)

# Print the last 10 rows of the data set
tail(df, 10)

# Find the dimensions of the data set
dim(df)

# Determine the names of the variables in the data set
colnames(df)

# Determine the structure of the variables in the data set
str(df)

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
colnames(df)[13] <- "body_mass_g"
colnames(df)[14] <- "sex"
colnames(df)[15] <- "delta_15_n"
colnames(df)[16] <- "delta_13_c"
colnames(df)[17] <- "comments"

# Recheck column names
colnames(df) # column re-naming successful!

# Check for missing data
miss_var_summary(df)

## There is missing data in: "comments" (84.3% miss.), "delta_15_n" (4.07%), 
## "delta_13_c" (3.78%), "sex" (3.20%), "culmen_length_mm" (0.581%),
## "culmen_depth_mm" (0.581%), flipper_length_mm" (0.581%), "body_mass_g" (0.581%)

# Visualize missing data
vis_miss(df)

# View columns listed above to ensure missing data is listed as NA
df$comments # all are NA
df$delta_15_n # all are NA
df$delta_13_c # all are NA
df$sex # all are NA
df$culmen_length_mm # all are NA
df$culmen_depth_mm # all are NA
df$flipper_length_mm # all are NA
df$body_mass_g # all are NA

# Check that the sum of the number of good data values and the number of missing 
# data values is equal to the total number of data values for the columns
sum(is.na(df$comments)) + sum(!is.na(df$comments)) - nrow(df) # 0
sum(is.na(df$delta_15_n)) + sum(!is.na(df$delta_15_n)) - nrow(df) # 0
sum(is.na(df$delta_13_c)) + sum(!is.na(df$delta_13_c)) - nrow(df) # 0
sum(is.na(df$sex)) + sum(!is.na(df$sex)) - nrow(df) # 0
sum(is.na(df$culmen_length_mm)) + sum(!is.na(df$culmen_length_mm)) - nrow(df) # 0
sum(is.na(df$culmen_depth_mm)) + sum(!is.na(df$culmen_depth_mm)) - nrow(df) # 0
sum(is.na(df$flipper_length_mm)) + sum(!is.na(df$flipper_length_mm)) - nrow(df) # 0
sum(is.na(df$body_mass_g)) + sum(!is.na(df$body_mass_g)) - nrow(df) # 0

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

# Write new csv and rds files
write.csv(penguins_clean, "penguins_clean.csv") # does not preserve variable structure
write_rds(penguins_clean, "penguins_clean.rds") # preserves variable structure

# Inspect factor levels for preparation of summary report
levels(penguins_clean$species)
levels(penguins_clean$region)
levels(penguins_clean$island)
levels(penguins_clean$stage)
levels(penguins_clean$clutch_completion)
levels(penguins_clean$sex)

# Inspect dimensions of cleansed data for summary report
dim(penguins_clean)
