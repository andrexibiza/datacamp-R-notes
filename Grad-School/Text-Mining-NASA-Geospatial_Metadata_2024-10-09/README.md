# NASA Geospatial Metadata Text Mining

## Overview

This project involves text mining and analysis of NASA's geospatial metadata. The analysis focuses on extracting and visualizing patterns from metadata titles, descriptions, and keywords to understand the thematic structure and relationships within the data.

## Project Structure

- **Ibiza_Project3.R**: R script containing the data processing, analysis, and visualization steps for the project.

## Key Findings

- **Common Keywords**: Identification of frequently occurring keywords in NASA's metadata.
- **Word Co-occurrences**: Analysis of word pairs in titles and descriptions to uncover thematic connections.
- **Topic Modeling**: Application of topic modeling to categorize metadata into distinct themes.

## Required Packages

Ensure you have R and the following packages installed for the project:

```r
install.packages("dplyr")      # For data manipulation
install.packages("ggraph")     # For graph visualization
install.packages("ggplot2")    # For data visualization
install.packages("igraph")     # For network analysis
install.packages("jsonlite")   # For JSON data handling
install.packages("tidyr")      # For tidying data
install.packages("tidytext")   # For text mining
install.packages("topicmodels")# For topic modeling
install.packages("widyr")      # For pairwise operations
```

## Setup Instructions

1. **Install Required Packages**: Use the commands above to install the necessary packages.

2. **Load Data**: The script automatically imports JSON metadata from NASA's data portal.

3. **Run the Analysis**: Execute the R script `Ibiza_Project3.R` to perform the analysis and generate insights.

## Usage

- **Data Exploration**: Explore common keywords and word co-occurrences in metadata.
- **Text Mining**: Analyze word frequency, co-occurrences, and thematic structures.
- **Visualization**: Use visualizations to illustrate findings and support analysis.

## Recommendations

- **Further Research**: Explore additional text mining techniques or datasets to enhance understanding.
- **Model Refinement**: Refine analysis based on findings to improve insights.

## Conclusion

This project demonstrates the application of text mining techniques to analyze NASA's geospatial metadata, providing valuable insights into the thematic structure and relationships within the data.

## Author

- **Axl Ibiza, MBA**

## Date

- **2024-10-08**

## Contact

For any questions or further information, please contact Axl Ibiza at [andrexibiza@gmail.com]. 