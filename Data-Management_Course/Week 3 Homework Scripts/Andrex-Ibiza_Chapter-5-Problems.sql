-- 5-60a: How many work centers does Pine Valley have?
SELECT COUNT(*) AS NumberOfWorkCenters
FROM WorkCenter_T;

-- 5-60b: Where are the work centers located?
SELECT WorkCenterID, WorkCenterLocation
FROM WorkCenter_T;

-- 5-62: Which employees were hired during 2005?
SELECT EmployeeID, EmployeeName, EmployeeDateHired
FROM Employee_T
WHERE YEAR(EmployeeDateHired) = 2005;

-- 5-64: List the number of customers living at each state that is included in the Customer_T table
SELECT CustomerState, COUNT(*) AS NumberOfCustomers
FROM Customer_T
GROUP BY CustomerState
ORDER BY NumberOfCustomers DESC;

-- 5-66: List the MaterialID, MaterialName, Material, Material-StandardPrice, and Thickness for all raw materials made of cherry, pine, or walnut. Order the listing by Material, StandardPrice, and Thickness.
SELECT MaterialID, MaterialName, Material, MaterialStandardPrice, Thickness
FROM RawMaterial_T
WHERE Material IN ('cherry', 'pine', 'walnut')
ORDER BY Material, MaterialStandardPrice, Thickness;

-- 5-67: Display the product line ID and the average standard price for all products in each product line.
SELECT ProductLineID, AVG(ProductStandardPrice) AS AvgStandardPrice
FROM Product_T
GROUP BY ProductLineID
ORDER BY ProductLineID;

-- 5-70: For each order, display the Order ID, the number of separate products included in the order, and the total number of product units (for all products) ordered.
SELECT 
    OrderID,
    COUNT(DISTINCT ProductID) AS NumberOfDistinctProducts,
    SUM(OrderedQuantity) AS TotalUnitsOrdered
FROM OrderLine_T
GROUP BY OrderID
ORDER BY TotalUnitsOrdered DESC;

-- 5-75: For each customer, list the customer ID and the total number of orders placed in 2018
SELECT 
    Customer_T.CustomerID, 
    COUNT(Order_T.OrderID) AS TotalOrders2018
FROM Customer_T
LEFT JOIN Order_T 
	ON Customer_T.CustomerID = Order_T.CustomerID
WHERE YEAR(Order_T.OrderDate) = 2018
GROUP BY Customer_T.CustomerID
ORDER BY TotalOrders2018 DESC;

-- 5-76: For each salesperson, list the total number of orders.
SELECT 
    Salesperson_T.SalespersonID, 
    Salesperson_T.SalespersonName,
    COUNT(Order_T.OrderID) AS NumberOfOrders
FROM Salesperson_T
LEFT JOIN Order_T 
	ON Salesperson_T.SalespersonID = Order_T.SalespersonID
GROUP BY Salesperson_T.SalespersonID, Salesperson_T.SalespersonName
ORDER BY NumberOfOrders DESC;