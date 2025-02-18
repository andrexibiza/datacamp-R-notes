# Chicago Transit Authority Red Line Project

This project involves analyzing ridership data for the Chicago Transit Authority's Red Line. The analysis aims to provide insights into ridership patterns, station usage, and other relevant metrics over a specified period.

## Contents

- **CTA_RedLine_Final.R**: R script containing the data processing, analysis, and visualization steps for the project.

## Objectives

- **Data Cleaning and Preparation**: Load, filter, and merge ridership and station information data to prepare for analysis.
- **Summary Statistics**: Calculate and interpret summary statistics for ridership and other categorical variables.
- **Correlation Analysis**: Explore relationships between variables using correlation matrices and visualizations.
- **Regression Modeling**: Fit a multiple linear regression model to understand the impact of various factors on ridership.

## Data Sources
- [Link to Dataset on Kaggle](https://www.kaggle.com/datasets/andrexibiza/chicago-transit-authority-cta-l-ridership-data)
- [Original Source](https://data.cityofchicago.org)
- Data Owner
    - [Chicago Transit Authority](https://www.transitchicago.com/)
    - [List of CTA Datasets](https://data.cityofchicago.org/Transportation/CTA-List-of-CTA-Datasets/pnau-cf66/about_data)

- **CTA_DailyTotals.csv**: Contains daily ridership totals for various stations.
- **CTA_System.csv**: Provides information about the CTA system, including station details.

## Required Packages

Ensure you have R and the following packages installed for the project:

```r
install.packages("corrplot")  # For visualizing correlation matrices
install.packages("dplyr")     # For data manipulation
install.packages("ggplot2")   # For data visualization
install.packages("Hmisc")     # For advanced data analysis and correlation calculations
install.packages("lubridate") # For date and time manipulation
```

## Setup Instructions

1. **Install Required Packages**: Use the commands above to install the necessary packages.

2. **Load Data**: Ensure the datasets `CTA_DailyTotals.csv` and `CTA_System.csv` are placed in the project directory.

3. **Run the Analysis**: Execute the R script `CTA_RedLine_Final.R` to perform the analysis and generate insights.

## Usage

This project is intended for data analysts and researchers interested in public transportation data analysis. The R script can be used as a template for similar analyses.

## Prerequisites

- Basic knowledge of R programming and data analysis.
- Familiarity with libraries such as `ggplot2`, `dplyr`, and `corrplot`.

## Author
- **Andrex Ibiza, MBA**

## Date
- **2024-06-13**

## Contact

For any questions or further information, please contact me via [andrexibiza@gmail.com], via Github Issues, or pull request.

---

Happy Analyzing! 

