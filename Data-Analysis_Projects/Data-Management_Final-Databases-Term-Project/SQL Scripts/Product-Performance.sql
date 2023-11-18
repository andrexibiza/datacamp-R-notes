-- Product Performance

-- What is the average price of products sold? 
SELECT AVG(p.Price) AS AveragePrice
FROM `data-management-term-project.term_project_data.sales` s
INNER JOIN `data-management-term-project.term_project_data.products` p ON s.ProductID = p.ProductID;

-- Are there products that stand out in terms of sales or lack thereof?
----- Highest sales volumes
SELECT
  p.ProductName,
  SUM(s.Quantity) AS TotalQuantitySold
FROM `data-management-term-project.term_project_data.sales` AS s
INNER JOIN `data-management-term-project.term_project_data.products` AS p ON s.ProductID = p.ProductID
GROUP BY p.ProductName
ORDER BY TotalQuantitySold DESC
LIMIT 10;

----- Lowest sales volumes
SELECT
  p.ProductName,
  IFNULL(SUM(s.Quantity), 0) AS TotalQuantitySold
FROM `data-management-term-project.term_project_data.products` AS p
LEFT JOIN `data-management-term-project.term_project_data.sales` AS s ON p.ProductID = s.ProductID
GROUP BY p.ProductName
ORDER BY TotalQuantitySold ASC
LIMIT 10;

-- How often do product prices change (based on ModifyDate)?
SELECT
  ProductName,
  COUNT(DISTINCT ModifyDate) AS PriceChangeCount
FROM `data-management-term-project.term_project_data.products`
GROUP BY ProductName
ORDER BY PriceChangeCount DESC;