# Load necessary libraries
library(ggplot2)
library(dplyr)
library(lubridate)
library(corrplot)

# Load the datasets
ridership_data <- read.csv('CTA_DailyTotals.csv')
station_info <- read.csv('CTA_System.csv')

ridership_data$date <- as.Date(ridership_data$date, format="%m/%d/%Y")

# Convert the date column to Date type
ridership_data$date <- as.Date(ridership_data$date, format="%m/%d/%Y")

# Define the date range
start_date <- as.Date("2018-01-01")
end_date <- as.Date("2023-12-31")

# Filter the ridership data to include only dates within the specified range
filtered_ridership_data <- ridership_data %>%
  filter(date >= start_date & date <= end_date)

# Ensure station_id and STOP_ID are character type to avoid data type mismatch
filtered_ridership_data$station_id <- as.character(filtered_ridership_data$station_id)
station_info$MAP_ID <- as.character(station_info$MAP_ID)

# Remove any leading or trailing whitespace
filtered_ridership_data$station_id <- trimws(filtered_ridership_data$station_id)
station_info$STOP_ID <- trimws(station_info$STOP_ID)

# Perform a left join on station_id
merged_data <- left_join(filtered_ridership_data, station_info, by = c("station_id" = "MAP_ID"))

# Print the first few rows of the merged data to verify
head(merged_data)

# Filter data for only stops on the Red Line
redline_data <- merged_data %>%
  filter(RED == "true")
head(redline_data)

# Write filtered dataframe to csv
# write.csv(redline, "redline.csv", row.names = FALSE)

### Correlations

# Ensure the data types are appropriate
redline_data$daytype <- as.factor(redline_data$daytype)
redline_data$ADA <- as.factor(redline_data$ADA)
redline_data$RED <- as.factor(redline_data$RED)

# Convert categorical variables to numeric for correlation calculation
redline_data$daytype_num <- as.numeric(redline_data$daytype)
redline_data$ADA_num <- as.numeric(redline_data$ADA)
redline_data$RED_num <- as.numeric(redline_data$RED)

# Ensure the rides column is numeric, removing any commas
redline_data$rides <- as.numeric(gsub(",", "", redline_data$rides))

# Select relevant columns for correlation
correlation_data <- redline_data %>%
  select(rides, daytype_num, ADA_num)

# Calculate the correlation matrix
correlation_matrix <- cor(correlation_data, use = "complete.obs")

# Print the correlation matrix
print(correlation_matrix)

# Visualize the correlation matrix
corrplot(correlation_matrix, method = "circle")