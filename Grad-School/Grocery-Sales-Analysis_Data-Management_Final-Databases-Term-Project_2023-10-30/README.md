## [Link to this dataset on Kaggle]()

## Overview

The Grocery Sales Database is a structured relational dataset designed for analyzing sales transactions, customer demographics, product details, employee records, and geographical information across multiple cities and countries. From the lived experience of wrangling these files, there are some insights to be gained, but they are shallow due to the limited four month time scope of the data. It is not possible to do any kind of seasonality analysis or forecasting from this dataset. Primarily, it's good practice for beginners in data management. The data types listed below are all SQL data types; adapt them to R as needed.

## Database Schema

The dataset consists of seven interconnected tables:

| File Name | Description |
|------------------|------------------------------------------------------|
| `categories.csv` | Defines the categories of the products. |
| `cities.csv` | Contains city-level geographic data. |
| `countries.csv` | Stores country-related metadata. |
| `customers.csv` | Contains information about the customers who make purchases. |
| `employees.csv` | Stores details of employees handling sales transactions. |
| `products.csv` | Stores details about the products being sold. |
| `sales.csv` | Contains transactional data for each sale. |

## Table Descriptions

### 1. categories

| Key | Column Name | Data Type | Description |
|-------------|-------------|-------------|----------------------------------|
| PK | `CategoryID` | `INT` | Unique identifier for each product category. |
|  | `CategoryName` | `VARCHAR(45)` | Name of the product category. |

### 2. cities

| Key | Column Name | Data Type      | Description                             |
|-----|-------------|----------------|-----------------------------------------|
| PK  | `CityID`    | `INT`          | Unique identifier for each city.        |
|     | `CityName`  | `VARCHAR(45)`  | Name of the city.                       |
|     | `Zipcode`   | `DECIMAL(5,0)` | Population of the city.                 |
| FK  | `CountryID` | `INT`          | Reference to the corresponding country. |

### 3. countries

| Key | Column Name   | Data Type     | Description                         |
|-----|---------------|---------------|-------------------------------------|
| PK  | `CountryID`   | `INT`         | Unique identifier for each country. |
|     | `CountryName` | `VARCHAR(45)` | Name of the country.                |
|     | `CountryCode` | `VARCHAR(2)`  | Two-letter country code.            |

### 4. customers

| Key | Column Name     | Data Type     | Description                          |
|-----|-----------------|---------------|--------------------------------------|
| PK  | `CustomerID`    | `INT`         | Unique identifier for each customer. |
|     | `FirstName`     | `VARCHAR(45)` | First name of the customer.          |
|     | `MiddleInitial` | `VARCHAR(1)`  | Middle initial of the customer.      |
|     | `LastName`      | `VARCHAR(45)` | Last name of the customer.           |
| FK  | `cityID`        | `INT`         | City of the customer.                |
|     | `Address`       | `VARCHAR(90)` | Residential address of the customer. |

### 5. employees

| Key | Column Name     | Data Type     | Description                          |
|-----|-----------------|---------------|--------------------------------------|
| PK  | `EmployeeID`    | `INT`         | Unique identifier for each employee. |
|     | `FirstName`     | `VARCHAR(45)` | First name of the employee.          |
|     | `MiddleInitial` | `VARCHAR(1)`  | Middle initial of the employee.      |
|     | `LastName`      | `VARCHAR(45)` | Last name of the employee.           |
|     | `BirthDate`     | `DATE`        | Date of birth of the employee.       |
|     | `Gender`        | `VARCHAR(10)` | Gender of the employee.              |
| FK  | `CityID`        | `INT`         | unique identifier for city           |
|     | `HireDate`      | `DATE`        | Date when the employee was hired.    |

### 6. products

| Key | Column Name    | Data Type      | Description                               |
|-------------|---------------------------|-------------|--------------------|
| PK  | `ProductID`    | `INT`          | Unique identifier for each product.       |
|     | `ProductName`  | `VARCHAR(45)`  | Name of the product.                      |
|     | `Price`        | `DECIMAL(4,0)` | Price per unit of the product.            |
|     | `CategoryID`   | `INT`          | unique category identifier                |
|     | `Class`        | `VARCHAR(15)`  | Classification of the product.            |
|     | `ModifyDate`   | `DATE`         | Last modified date.                       |
|     | `Resistant`    | `VARCHAR(15)`  | Product resistance category.              |
|     | `IsAllergic`   | `VARCHAR`      | indicates whether the item is an allergen |
|     | `VitalityDays` | `DECIMAL(3,0)` | Product vital type classification.        |

### 7. sales

| Key | Column Name | Data Type | Description |
|-------------|---------------------|-------------|--------------------------|
| PK | `SalesID` | `INT` | Unique identifier for each sale. |
| FK | `SalesPersonID` | `INT` | Employee responsible for the sale. |
| FK | `CustomerID` | `INT` | Customer making the purchase. |
| FK | `ProductID` | `INT` | Product being sold. |
|  | `Quantity` | `INT` | Number of units sold. |
|  | `Discount` | `DECIMAL(10,2)` | Discount applied to the sale. |
|  | `TotalPrice` | `DECIMAL(10,2)` | Final sale price after discounts. |
|  | `SalesDate` | `DATETIME` | Date and time of the sale. |
|  | `TransactionNumber` | `VARCHAR(25)` | Unique identifier for the transaction. |