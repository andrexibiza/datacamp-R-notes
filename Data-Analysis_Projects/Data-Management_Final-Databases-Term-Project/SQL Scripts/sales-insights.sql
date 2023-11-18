-- Sales Insights

-- What is the total revenue by quarter/year?
SELECT
  EXTRACT(YEAR FROM SalesDate) AS Year,
  EXTRACT(QUARTER FROM SalesDate) AS Quarter,
  SUM(TotalPrice) AS TotalRevenue
FROM `data-management-term-project.term_project_data.sales`
GROUP BY
  Year, Quarter
ORDER BY
  Year, Quarter;

-- Which product has the highest sales volume?
SELECT
  p.ProductName,
  SUM(s.Quantity) AS TotalQuantitySold
FROM `data-management-term-project.term_project_data.sales` AS s
JOIN `data-management-term-project.term_project_data.products` AS p ON s.ProductID = p.ProductID
GROUP BY p.ProductName
ORDER BY TotalQuantitySold DESC
LIMIT 20; -- Adjust the number here to change the total number of top products

-- What is the average discount applied to sales transactions?
SELECT
  AVG(Discount) AS AverageDiscount
FROM `data-management-term-project.term_project_data.sales`;

-- How does the discount level affect the total sales volume?
SELECT
  Discount,
  SUM(Quantity) AS TotalQuantitySold,
  SUM(TotalPrice) AS TotalRevenue
FROM `data-management-term-project.term_project_data.sales`
GROUP BY Discount
ORDER BY Discount;

-- Which salesperson has the highest number of sales?
SELECT
  SalesPersonID,
  COUNT(*) AS NumberOfSales
FROM `data-management-term-project.term_project_data.sales`
GROUP BY SalesPersonID
ORDER BY NumberOfSales DESC
LIMIT 1;
