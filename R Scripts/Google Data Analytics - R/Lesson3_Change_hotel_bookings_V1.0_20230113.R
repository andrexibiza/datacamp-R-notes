# Lesson 3: Changing Your Data

# ## Background for this activity
# In this activity, you’ll review a scenario, and focus 
# on manipulating and changing real data in R. You will 
# learn more about functions you can use to manipulate 
# your data, use statistical summaries to explore your 
# data, and gain initial insights for your stakeholders. 
# 
# Throughout this activity, you will also have the 
# opportunity to practice writing your own code by 
# making changes to the code chunks yourself. If you 
# encounter an error or get stuck, you can always 
# check the Lesson3_Change_Solutions .rmd file in 
# the Solutions folder under Week 3 for the complete, 
# correct code. 
# 
# ## The Scenario
# 
# In this scenario, you are a junior data analyst 
# working for a hotel booking company. You have been 
# asked to clean a .csv file that was created after 
# querying a database to combine two different tables 
# from different hotels. You have already performed 
# some basic cleaning functions on this data; this 
# activity will focus on using functions to conduct 
# basic data manipulation.

## Step 1: Load packages

library(tidyverse)
library(skimr)
library(janitor)

## Step 2: Import data

hotel_bookings <- read_csv("hotel_bookings_V2.0_20230113.csv")

## Step 3: Getting to know your data

skim_without_charts(hotel_bookings)
glimpse(hotel_bookings)

## Step 4: Manipulating your data

hotel_bookings_v2 <- arrange(
  hotel_bookings, -lead_time)  # Sort DESC
                               # by lead_time

# You can find the max and min lead_time without 
# using the arrange function.
max(hotel_bookings$lead_time)
min(hotel_bookings$lead_time)
mean(hotel_bookings$lead_time)
median(hotel_bookings$lead_time)

# Filter for City Hotels only
hotel_bookings_city <- 
  filter(hotel_bookings, 
         hotel_bookings$hotel=="City Hotel")
skim_without_charts(hotel_bookings_city)
mean(hotel_bookings_city$lead_time)

# R group and summarize
hotel_summary <-
  hotel_bookings %>% 
  group_by(hotel) %>% 
  summarise(average_lead_time = mean(lead_time),
            min_lead_time=min(lead_time),
            max_lead_time=max(lead_time))
head(hotel_summary)

str(hotel_bookings_city)
## Activity Wrap Up
# Being able to manipulate data is a key skill for 
# working in `R`. After this activity, you should be 
# more familiar with functions that allow you to 
# change your data, such as `arrange()`, `group_by()`,
# and `filter()`. You also have some experience using 
# statistical summaries to make insights into your 
# data. You can continue to practice these skills by 
# modifying the code chunks in the rmd file, or use 
# this code as a starting point in your own project 
# console. As you practice, consider how performing 
# tasks is similar and different in `R` compared to 
# other tools you have learned throughout this program. 