# Text Mining 2016 Election Tweets

## Overview

This project involves text mining and analysis of Twitter data from the 2016 U.S. Presidential Election. The analysis focuses on tweets from Hillary Clinton and Donald Trump, examining tweet frequency, word usage, and engagement metrics such as retweets and favorites.

## Project Structure

- **tweets.Rmd**: R Markdown file containing the data processing, analysis, and visualization steps for the project.
- **tweets_final.R**: R script with the final analysis and visualizations.

## Key Findings

- **Tweet Frequency**: Trump maintained a consistent tweet volume, while Clinton's activity surged during key campaign events.
- **Word Usage**: Analysis of word frequency and usage differences between the candidates.
- **Engagement**: Examination of retweets and favorites to measure message resonance.

## Required Packages

Ensure you have R and the following packages installed for the project:

```r
install.packages("broom")     # For converting statistical analysis objects into tidy data frames
install.packages("dplyr")     # For data manipulation
install.packages("ggplot2")   # For data visualization
install.packages("lubridate") # For date and time manipulation
install.packages("readr")     # For reading data
install.packages("scales")    # For scaling functions used in visualization
install.packages("stringr")   # For string manipulation
install.packages("purrr")     # For functional programming tools
install.packages("tidyr")     # For tidying data
install.packages("tidytext")  # For text mining
```

## Setup Instructions

1. **Install Required Packages**: Use the commands above to install the necessary packages.

2. **Load Data**: Ensure the `tweets.csv` dataset is available in the project directory.

3. **Run the Analysis**: Open and execute the R Markdown file `tweets.Rmd` or the R script `tweets_final.R` to perform the analysis and generate insights.

## Usage

- **Data Exploration**: Explore tweet frequency and word usage patterns.
- **Text Mining**: Analyze word frequency, usage differences, and engagement metrics.
- **Visualization**: Use visualizations to illustrate findings and support analysis.

## Recommendations

- **Further Research**: Explore additional text mining techniques or datasets to enhance understanding.
- **Model Refinement**: Refine analysis based on findings to improve insights.

## Conclusion

This project demonstrates the application of text mining techniques to analyze Twitter data from the 2016 U.S. Presidential Election, providing valuable insights into the candidates' communication strategies and public engagement.

## Author

- **Axl Ibiza**

## Date

- **2024-09-15**

## Contact

For any questions or further information, please contact Axl Ibiza at [andrexibiza@gmail.com]. 