library(tidyverse)
setwd("//wdmycloudex4100/Axl-Ibiza/Andrex_Ibiza/Grad-School/Grocery-Sales-Analysis_Data-Management_Final-Databases-Term-Project_2023-10-30/1-Input")


products <- read.csv(
  "products.csv",
  sep = ";",
  na.strings = c("NULL", "NA", "N/A", "NaN", ""),
  )
head(products, 10)

sales <- read.csv(
  "sales.csv",
  sep = ";",
  na.strings = c("NULL", "NA", "N/A", "NaN", ""),
  )

str(sales)

# 2. Rename the columns to remove periods and have valid names

names(sales) <- c(
  "SalesID",
  "SalesPersonID",
  "CustomerID",
  "ProductID",
  "Quantity",
  "Discount",
  "TotalPrice",
  "SalesDate",
  "TransactionNumber"
)

# 3. Convert SalesDate to a proper date/time format (important!)
sales$SalesDate <- as.POSIXct(sales$SalesDate, format = "%Y-%m-%d %H:%M:%S", tz = "UTC")

# 4. Inspect the structure and the first few rows to confirm the fix
str(sales)
head(sales$TotalPrice, 5)