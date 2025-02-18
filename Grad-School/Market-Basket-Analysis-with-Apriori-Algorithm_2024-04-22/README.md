# Market Basket Analysis Using the Apriori Algorithm

## Overview

This project involves performing a market basket analysis using the Apriori algorithm to uncover patterns in customer purchasing behavior. The analysis is conducted on an online retail dataset, focusing on identifying frequent itemsets and association rules.

## Project Structure

- **DATA5150_Week7_Project3_Market-Basket-Analysis-Using-Apriori-Algorithm.Rmd**: R Markdown file containing the data processing, analysis, and visualization steps for the project.

## Key Findings

- Frequent itemsets include popular home decor and baking-related products.
- Strong associations were found among teacup and saucer sets, as well as specific bag styles.

## Required Packages

Ensure you have R and the following packages installed for the project:

```r
install.packages("tidyverse")  # For data manipulation and visualization
install.packages("arules")     # For association rule mining
install.packages("arulesViz")  # For visualizing association rules
install.packages("plotly")     # For interactive visualizations
```

## Setup Instructions

1. **Install Required Packages**: Use the commands above to install the necessary packages.

2. **Load Data**: Ensure the dataset `online_retail.csv` is placed in the project directory.

3. **Run the Analysis**: Execute the R Markdown file `DATA5150_Week7_Project3_Market-Basket-Analysis-Using-Apriori-Algorithm.Rmd` to perform the analysis and generate the report.

## Usage

- **Data Preprocessing**: Clean and preprocess the data to remove cancellations and missing descriptions.
- **Market Basket Analysis**: Use the Apriori algorithm to identify frequent itemsets and association rules.
- **Visualization**: Explore interactive visualizations of the association rules.

## Recommendations

- **Product Placement**: Optimize product placement based on frequent itemsets.
- **Cross-Selling Strategies**: Develop cross-selling strategies using identified association rules.
- **Promotional Offers**: Tailor promotional offers to leverage strong item associations.

## Conclusion

This project demonstrates the application of the Apriori algorithm in market basket analysis, providing insights into customer purchasing behavior. The findings can guide retailers in optimizing their sales strategies and enhancing customer experience.

## Author

- **Andrex Ibiza, MBA**

## Date

- **2024-04-22**

## Contact

For any questions or further information, please contact Andrex Ibiza at [andrexibiza@gmail.com]. 