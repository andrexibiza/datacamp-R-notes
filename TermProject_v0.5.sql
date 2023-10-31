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
    TransactionNumber VARCHAR(255));
CREATE TABLE IF NOT EXISTS categories (
	CategoryID INT PRIMARY KEY,
    CategoryName VARCHAR(45));
CREATE TABLE IF NOT EXISTS cities(
	CityID INT PRIMARY KEY,
    CityName VARCHAR(45),
    Zipcode NUMERIC(5),
    CountryID INTEGER REFERENCES countries (CountryID) ON DELETE RESTRICT);
CREATE TABLE IF NOT EXISTS countries(
	CountryID INT PRIMARY KEY,
    CountryName VARCHAR(45),
    CountryCode VARCHAR(2));
CREATE TABLE IF NOT EXISTS customers(
	CustomerID INT PRIMARY KEY,
    FirstName VARCHAR(45),
    MiddleInitial VARCHAR(1),
    LastName VARCHAR(45),
    CityID INT REFERENCES cities (CityID) ON DELETE RESTRICT,
    Address VARCHAR(90));
CREATE TABLE IF NOT EXISTS employees(
	EmployeeID INT PRIMARY KEY,
    FirstName VARCHAR(45),
    MiddleInitial VARCHAR(1),
    LastName VARCHAR(45),
    BirthDate DATE,
    Gender VARCHAR(1),
    CityID INT REFERENCES Cities (CityID) ON DELETE RESTRICT,
    HireDate DATE);
CREATE TABLE IF NOT EXISTS products(
	ProductID INT PRIMARY KEY,
	ProductName VARCHAR(45),
    Price NUMERIC,
    CategoryID INT REFERENCES categories (category_id) ON DELETE RESTRICT,
    Class VARCHAR(45),
    ModifyDate DATE,
    Resistant VARCHAR(45),
    IsAllergic CHAR(5) CHECK (IsAllergic IN ('True','False')),
    VitalityDays NUMERIC(3));
CREATE TABLE IF NOT EXISTS sales(
	SalesID INT PRIMARY KEY,
    SalesPersonID INT REFERENCES employees (EmployeeID) ON DELETE RESTRICT,
    CustomerID INT REFERENCES customers (CustomerID) ON DELETE RESTRICT,
    ProductID INT REFERENCES products (ProductID) ON DELETE RESTRICT,
    Quantity INT,
    Discount NUMERIC,
    TotalPrice NUMERIC,
    SalesDate DATE,
    TransactionNumber VARCHAR(90));