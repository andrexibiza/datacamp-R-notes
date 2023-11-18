
/* ... [The initial part of the script remains unchanged] ... */

/* Make sure to insert territories before referencing them in the Salesperson_T table */
INSERT INTO Territory_T (TerritoryID, TerritoryName) VALUES (1, 'SouthEast');
INSERT INTO Territory_T (TerritoryID, TerritoryName) VALUES (2, 'SouthWest');
/* ... [Other territory insert statements] ... */
INSERT INTO Territory_T (TerritoryID, TerritoryName) VALUES (13, 'Colorado');
INSERT INTO Territory_T (TerritoryID, TerritoryName) VALUES (15, 'Arizona');

/* Insert salesperson records, ensuring that the referenced TerritoryID exists in the Territory_T table */
INSERT INTO Salesperson_T (SalespersonID, SalespersonName, SalespersonTelephone, SalesTerritoryID) VALUES (1, 'Doug Henny', '8134445555', 2);
/* ... [Other salesperson insert statements] ... */

/* ... [Rest of the insert statements for other tables] ... */

/* Using MySQL's STR_TO_DATE function to handle date strings */
INSERT INTO Order_T (OrderID, OrderDate, CustomerID, SalespersonID) VALUES (1, STR_TO_DATE('08/09/2017', '%d/%m/%Y'), 4, 3);

/* ... [Other insert statements for the Order_T table using STR_TO_DATE] ... */

/* Commit changes if not auto-committing */
COMMIT;

/* ... [Queries to verify data] ... */
