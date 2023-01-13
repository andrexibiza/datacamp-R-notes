# Lesson 3 - Cleaning Data

## Background for this activity

# In this activity, you’ll review a scenario, and focus on
# cleaning real data in R. You will learn more about data
# cleaning functions and perform basic calculations to gain
# initial insights into your data.
# 
# Throughout this activity, you will also have the opportunity 
# to practice writing your own code by making changes to the 
# code chunks yourself. If you encounter an error or get stuck,
# you can always check the Lesson2_Clean_Solutions .rmd file 
# in the Solutions folder under Week 3 for the complete, 
# correct code. 

## The scenario

# In this scenario, you are a junior data analyst working for 
# a hotel booking company. You have been asked to clean a 
# .csv file that was created after querying a database to 
# combine  two different tables from different hotels. 
# 
# To learn more about this data, you are going to need to use 
# functions to preview the data's structure, including its 
# columns and rows. You will also need to use basic cleaning 
# functions to prepare this data for analysis.  

## Step 1: Load packages

library(tidyverse)
library(skimr)
library(janitor)

## Step 2: Import data

# The data you have been asked to clean is currently an 
# external .csv file. In order to view and clean it in `R`, 
# you will need to import it. The `tidyverse` library `readr` 
# package has a number of functions for "reading in" or 
# importing data, including .csv files. 
# 
# In the chunk below, you will use the `read_csv()` function 
# to import data from a .csv file in the project folder 
# called "hotel_bookings.csv" and save it as a data frame 
# called `bookings_df`:

setwd("C:/Users/andre/OneDrive/Documents/GitHub/Andrex_Ibiza/R Scripts")
bookings_df <- read_csv("hotel_bookings_V1.0_20230112.csv")

## Step 3: Getting to know your data

head(bookings_df)
str(bookings_df)
glimpse(bookings_df)
colnames(bookings_df)
skim_without_charts(bookings_df)

## Step 4: Cleaning your data

# Based on the functions you have used so far, how would you describe your data 
# in a brief to your stakeholder? Now, let's say you are primarily interested in 
# the following variables: 'hotel', 'is_canceled', and 'lead_time'. Create a new 
# data frame with just those columns, calling it `trimmed_df`.

# You might notice that some of the column names aren't very intuitive, so you 
# will want to rename them to make them easier to understand. You might want to 
# create the same exact data frame as above, but rename the variable 'hotel' to 
# be named 'hotel_type' to be crystal clear on what the data is about

trimmed_df %>% 
  select(hotel, is_canceled, lead_time) %>% 
  rename(hotel_type = hotel)

# Another common task is to either split or combine data in different columns. 
# In this example, you can combine the arrival month and year into one column 
# using the unite() function:
  
example_df <- bookings_df %>%
  select(arrival_date_year, arrival_date_month) %>% 
  unite(arrival_month_year, 
        c("arrival_date_month", "arrival_date_year"), 
        sep = " ")

## Step 5: Another way of doing things

# You can also use the`mutate()` function to make changes to your columns. 
# Let's say you wanted to create a new column that summed up all the adults, 
# children, and babies on a reservation for the total number of people. 
# Modify the code chunk below to create that new column:  

example_df <- bookings_df %>%
  mutate(guests = adults + children + babies)

head(example_df)

# Great. Now it's time to calculate some summary statistics! Calculate the total 
# number of canceled bookings and the average lead time for booking - you'll want 
# to start your code after the %>% symbol. Make a column called 'number_canceled' 
# to represent the total number of canceled bookings. Then, make a column called 
# 'average_lead_time' to represent the average lead time. Use the `summarize()` 
# function to do this in the code chunk below:

head(bookings_df)
example_df <- bookings_df %>%
  summarize(number_canceled = sum(is_canceled),
            average_lead_time = mean(lead_time))

head(example_df)
example_df

# ## Activity Wrap Up
# Now you have some experience cleaning and analyzing data in `R`; you used 
# basic cleaning functions like `rename()` and `clean_names()` and performed 
# basic calculations on real data. You can continue to practice these skills by 
# modifying the code chunks in the rmd file, or use this code as a starting point 
# in your own project console. One of the reasons `R` is such a powerful tool for 
# data analysis is because you can perform so many different tasks in one place. 
# With the functions you have been learning in this course, you can import data, 
# create and view data frames, and even clean data without leaving your console.  









