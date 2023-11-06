
/* script name: CREATEBIGPV_MDM_13E.SQL */
/* purpose: Builds Oracle tables for Big PVFCMDBM13e */
/* date: 10 Jan 2018 */
/* updated: 2023-11-06 by Andrex Ibiza for MySQL */
/* ... [Initial comments and session settings] ... */

/* Initialize new schema PVFC */
CREATE SCHEMA IF NOT EXISTS PVFC;
USE PVFC;

/* ... [Table creation statements before Order_T] ... */


-- Create table Order_T
CREATE TABLE Order_T (
	OrderID NUMERIC(12) NOT NULL,
	CustomerID NUMERIC(12),
	OrderDate DATE,
	FulfillmentDate DATE,
	SalespersonID NUMERIC(12),
	ShipAdrsID NUMERIC(12),
	CONSTRAINT Order_PK PRIMARY KEY (OrderID),
	CONSTRAINT Order_FK1 FOREIGN KEY (CustomerID) REFERENCES Customer_T(CustomerID),
	CONSTRAINT Order_FK2 FOREIGN KEY (SalespersonID) REFERENCES Salesperson_T(SalespersonID),
	CONSTRAINT Order_FK3 FOREIGN KEY (ShipAdrsID) REFERENCES CustomerShipAddress_T(ShipAddressID)
);

/* ... [Rest of the table creation statements] ... */

SHOW COLUMNS FROM Customer_T;
SHOW COLUMNS FROM Territory_T;
/* ... [Other SHOW COLUMNS commands] ... */

SELECT 
    TABLE_NAME, 
    CONSTRAINT_NAME, 
    CONSTRAINT_TYPE 
FROM 
    INFORMATION_SCHEMA.TABLE_CONSTRAINTS 
WHERE 
    CONSTRAINT_SCHEMA = 'PVFC';
