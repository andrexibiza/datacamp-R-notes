SET SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES,ONLY_FULL_GROUP_BY';
SET GLOBAL max_allowed_packet = 1073741824;
SELECT @@max_allowed_packet;

CREATE SCHEMA IF NOT EXISTS termproject;
USE termproject;
-- Create the sales table if it doesn't exist
CREATE TABLE IF NOT EXISTS sales (
    SalesID INT PRIMARY KEY,
    SalesPersonID INT,
    CustomerID INT,
    ProductID INT,
    Quantity INT,
    Discount NUMERIC,
    TotalPrice NUMERIC,
    SalesDate DATE,
    TransactionNumber VARCHAR(255))
    
CREATE TABLE IF NOT EXISTS categories (
)
CREATE TABLE IF NOT EXISTS cities(
)
CREATE TABLE IF NOT EXISTS countries(
)
CREATE TABLE IF NOT EXISTS customers(
)
CREATE TABLE IF NOT EXISTS employees(
)
CREATE TABLE IF NOT EXISTS products(
)
CREATE TABLE IF NOT EXISTS sales(