-- -- Customer Analysis

-- -- Who are the top 10 customers by sales volume?
-- SELECT
--   c.CustomerID,
--   c.FirstName,
--   c.LastName,
--   ROUND(SUM(s.TotalPrice), 2) AS TotalSalesVolume
-- FROM `data-management-term-project.term_project_data.sales` AS s
-- JOIN `data-management-term-project.term_project_data.customers` AS c 
--   ON s.CustomerID = c.CustomerID
-- GROUP BY c.CustomerID, c.FirstName, c.LastName
-- ORDER BY TotalSalesVolume DESC
-- LIMIT 10;


-- -- What are the purchasing patterns of customers from different cities or countries?
-- -- Purchasing Frequency:  Top 20 markets by purchase frequency
-- SELECT
--   ci.CityName,
--   co.CountryName,
--   COUNT(s.SalesID) AS NumberOfPurchases
-- FROM `data-management-term-project.term_project_data.customers` AS c
-- INNER JOIN `data-management-term-project.term_project_data.cities` AS ci 
--   ON c.CityID = ci.CityID
-- INNER JOIN `data-management-term-project.term_project_data.countries` AS co 
--   ON ci.CountryID = co.CountryID
-- INNER JOIN `data-management-term-project.term_project_data.sales` AS s 
--   ON c.CustomerID = s.CustomerID
-- GROUP BY 
--   ci.CityName, 
--   co.CountryName
-- ORDER BY NumberOfPurchases DESC
-- LIMIT 20;

-- -- Average Sale Amount: Top 20 markets by average sale amount
-- SELECT
--   ci.CityName,
--   co.CountryName,
--   ROUND(AVG(s.TotalPrice), 2) AS AverageSaleAmount
-- FROM `data-management-term-project.term_project_data.customers` AS c
-- INNER JOIN `data-management-term-project.term_project_data.cities` AS ci 
--   ON c.CityID = ci.CityID
-- INNER JOIN `data-management-term-project.term_project_data.countries` AS co 
--   ON ci.CountryID = co.CountryID
-- INNER JOIN `data-management-term-project.term_project_data.sales` AS s 
--   ON c.CustomerID = s.CustomerID
-- GROUP BY 
--   ci.CityName, 
--   co.CountryName
-- ORDER BY 
--   AverageSaleAmount DESC
-- LIMIT 20;

--   -- Most Popular Products: Identify which products are most popular among customers in each city or country.
--   SELECT
--   ci.CityName,
--   co.CountryName,
--   p.ProductName,
--   COUNT(s.ProductID) AS QuantitySold
-- FROM
--   `data-management-term-project.term_project_data.sales` AS s
--   INNER JOIN `data-management-term-project.term_project_data.products` AS p ON s.ProductID = p.ProductID
--   INNER JOIN `data-management-term-project.term_project_data.customers` AS c ON s.CustomerID = c.CustomerID
--   INNER JOIN `data-management-term-project.term_project_data.cities` AS ci ON c.CityID = ci.CityID
--   INNER JOIN `data-management-term-project.term_project_data.countries` AS co ON ci.CountryID = co.CountryID
-- GROUP BY
--   ci.CityName,
--   co.CountryName,
--   p.ProductName
-- ORDER BY
--   co.CountryName,
--   ci.CityName,
--   QuantitySold DESC;

--   -- Seasonal Trends: Look for seasonal trends in purchasing by city or country.
--   SELECT
--   ci.CityName,
--   co.CountryName,
--   EXTRACT(MONTH FROM s.SalesDate) AS SaleMonth,
--   ROUND(SUM(s.TotalPrice), 2) AS TotalSales
-- FROM
--   `data-management-term-project.term_project_data.sales` AS s
--   INNER JOIN `data-management-term-project.term_project_data.customers` AS c ON s.CustomerID = c.CustomerID
--   INNER JOIN `data-management-term-project.term_project_data.cities` AS ci ON c.CityID = ci.CityID
--   INNER JOIN `data-management-term-project.term_project_data.countries` AS co ON ci.CountryID = co.CountryID
-- GROUP BY
--   ci.CityName,
--   co.CountryName,
--   SaleMonth
-- ORDER BY
--   TotalSales DESC;

--   -- Purchase Size: Compare the size of the purchases (number of items and total price) by customers from each city or country.
--   SELECT
--   ci.CityName,
--   co.CountryName,
--   ROUND(AVG(s.Quantity),2) AS AverageQuantity,
--   ROUND(AVG(s.TotalPrice), 2) AS AverageTotalPrice
-- FROM
--   `data-management-term-project.term_project_data.sales` AS s
--   INNER JOIN `data-management-term-project.term_project_data.customers` AS c ON s.CustomerID = c.CustomerID
--   INNER JOIN `data-management-term-project.term_project_data.cities` AS ci ON c.CityID = ci.CityID
--   INNER JOIN `data-management-term-project.term_project_data.countries` AS co ON ci.CountryID = co.CountryID
-- GROUP BY
--   ci.CityName,
--   co.CountryName
-- ORDER BY
--   co.CountryName,
--   ci.CityName;

--   -- Can we identify any customer segments based on purchasing behavior?
--   SELECT
--   c.CustomerID,
--   COUNT(s.SalesID) AS PurchaseFrequency,
--   ROUND(SUM(s.TotalPrice),2) AS TotalSpent,
--   ROUND(AVG(s.TotalPrice), 2) AS AveragePurchaseValue,
--   MAX(s.SalesDate) AS LastPurchaseDate,
--   CASE
--     WHEN SUM(s.TotalPrice) > 1000 THEN 'High Spender'
--     WHEN SUM(s.TotalPrice) BETWEEN 500 AND 1000 THEN 'Medium Spender'
--     ELSE 'Low Spender'
--   END AS SpendingCategory,
--   CASE
--     WHEN COUNT(s.SalesID) > 10 THEN 'Frequent Buyer'
--     WHEN COUNT(s.SalesID) BETWEEN 5 AND 10 THEN 'Occasional Buyer'
--     ELSE 'Infrequent Buyer'
--   END AS FrequencyCategory
-- FROM
--   `data-management-term-project.term_project_data.sales` AS s
--   INNER JOIN `data-management-term-project.term_project_data.customers` AS c 
--     ON s.CustomerID = c.CustomerID
-- GROUP BY
--   c.CustomerID
-- ORDER BY
--   TotalSpent DESC, PurchaseFrequency DESC;

--   -- What is the average number of transactions per customer?
SELECT
  ROUND(AVG(CustomerTransactionCount),1) AS AverageTransactionsPerCustomer
FROM (
  SELECT
    CustomerID,
    COUNT(*) AS CustomerTransactionCount
  FROM `data-management-term-project.term_project_data.sales`
  GROUP BY CustomerID
) AS CustomerTransactions;


