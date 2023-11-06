
/* script name: CREATEBIGPV_MDM_13E.SQL */
/* purpose: Builds Oracle tables for Big PVFCMDBM13e */
/* date: 10 Jan 2018 */
/* updated: 2023-11-06 by Andrex Ibiza for MySQL */

/* ... [Initial comments and session settings] ... */

/* Initialize new schema PVFC */
CREATE SCHEMA IF NOT EXISTS PVFC;
USE PVFC;

/* ... [Table creation statements] ... */

-- Create DoesBusinessIn_T table with corrected data types
CREATE TABLE DoesBusinessIn_T (
    CustomerID INT NOT NULL,
    TerritoryID INT NOT NULL,
    CONSTRAINT DoesBusinessIn_PK PRIMARY KEY (CustomerID, TerritoryID),
    CONSTRAINT DoesBusinessIn_FK1 FOREIGN KEY (CustomerID) 
        REFERENCES Customer_T(CustomerID),
    CONSTRAINT DoesBusinessIn_FK2 FOREIGN KEY (TerritoryID) 
        REFERENCES Territory_T(TerritoryID)
);

/* ... [Rest of the table creation statements] ... */

/* Replace describe commands with SHOW COLUMNS commands */
SHOW COLUMNS FROM Customer_T;
SHOW COLUMNS FROM Territory_T;
/* ... [Other SHOW COLUMNS commands] ... */

/* Show constraints by table for the PVFC schema in MySql */
SELECT 
    TABLE_NAME, 
    CONSTRAINT_NAME, 
    CONSTRAINT_TYPE 
FROM 
    INFORMATION_SCHEMA.TABLE_CONSTRAINTS 
WHERE 
    CONSTRAINT_SCHEMA = 'PVFC';

/* The COMMIT statement is omitted as it is not required for DDL statements in MySQL. */
