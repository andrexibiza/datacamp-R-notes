/* script name: CREATEBIGPV_MDM_13E.SQL                  */
/* purpose:     Builds Oracle tables for Big PVFCMDBM13e */
/* date:        10 Jan 2018                              */
/* updated:     2023-11-06 by Andrex Ibiza for MySQL     */
/*                                                       */
/* comment:  These tables have the same names as the     */
/*           Book PVFC database, so if you run these     */
/*           script files after you have created the     */
/*           Book database files, you will wipe out      */
/*           the data in the earlier database            */
/*                                                       */
/* comment:  The Photo column in the PRODUCT table       */
/*           is not included in the Oracle version of    */
/*           this database                               */
/*                                                       */
/* comment:  Table and column names are defined in       */
/*           U/L case without embedded underscores.      */
/*           They will be displayed by Oracle, however,  */
/*           in ALL CAPS; use an alias to override       */
/*           the ALL CAPS display.                       */
/*                                                       */
/*                                                       */

/*     set up session settings                           */

-- SET LINESIZE 120  -- this command has no effect in MySQL
-- SET PAGESIZE 80 -- this command has no effect in MySQL

-- Commented out because these tables do not exist.
-- /* Drop all tables before creating tables                */
-- DROP TABLE Supplies_T 			CASCADE CONSTRAINTS ;
-- DROP TABLE Uses_T 		        	CASCADE CONSTRAINTS ;
-- DROP TABLE RawMaterial_T 	        	CASCADE CONSTRAINTS ;
-- DROP TABLE Vendor_T 		        	CASCADE CONSTRAINTS ;
-- DROP TABLE Shipped_T              		CASCADE CONSTRAINTS ;
-- DROP TABLE PaymentType_T          		CASCADE CONSTRAINTS ;
-- DROP TABLE Payment_T              		CASCADE CONSTRAINTS ;
-- DROP TABLE OrderLine_T 	        	CASCADE CONSTRAINTS ;
-- DROP TABLE Order_T 		        	CASCADE CONSTRAINTS ;
-- DROP TABLE CustomerShipAddress_T  		CASCADE CONSTRAINTS ;
-- DROP TABLE ProducedIn_T           		CASCADE CONSTRAINTS ;
-- DROP TABLE Product_T 			CASCADE CONSTRAINTS ;
-- DROP TABLE ProductLine_T 	        	CASCADE CONSTRAINTS ;
-- DROP TABLE WorksIn_T 			CASCADE CONSTRAINTS ;
-- DROP TABLE WorkCenter_T 	        	CASCADE CONSTRAINTS ;
-- DROP TABLE EmployeeSkills_T 	    		CASCADE CONSTRAINTS ;
-- DROP TABLE Employee_T 			CASCADE CONSTRAINTS ;
-- DROP TABLE Skill_T 			 	CASCADE CONSTRAINTS ;
-- DROP TABLE Salesperson_T 	        	CASCADE CONSTRAINTS ;
-- DROP TABLE DoesBusinessIn_T 		    	CASCADE CONSTRAINTS ;
-- DROP TABLE Territory_T 			CASCADE CONSTRAINTS ;
-- DROP TABLE Customer_T 			CASCADE CONSTRAINTS ;



/* Create all PVFC Big Database Tables (23)              	*/

-- Initialize new schema PVFC
CREATE SCHEMA IF NOT EXISTS PVFC;
USE PVFC;

/* A.I. 2023-11-06: The original query was formatted for Oracle, not MySQL, 
So, all references to `NUMBER` data types have been switched to `NUMERIC()`. 
Table code reformatted for clarity and aesthetics. 

Code written for students should be thoroughly commented for clarity. 
This script was not.*/

-- Create Customer_T table

CREATE TABLE Customer_T (
	CustomerID				NUMERIC(12) NOT NULL,
	CustomerName				VARCHAR(25),
	CustomerAddress   			VARCHAR(30),
	CustomerCity				VARCHAR(20),              
	CustomerState				CHAR(2),
	CustomerPostalCode 			VARCHAR(10),
	CONSTRAINT Customer_PK 			PRIMARY KEY (CustomerID));

-- Create Territory_T table

CREATE TABLE Territory_T (
	TerritoryID				NUMERIC(12) NOT NULL,
	TerritoryName				VARCHAR(50),
	CONSTRAINT Territory_PK 		PRIMARY KEY (TerritoryID));

-- Create DoesBusinessIn_T table

CREATE TABLE DoesBusinessIn_T (
    CustomerID NUMERIC(12) NOT NULL,
    TerritoryID NUMERIC(12) NOT NULL,
    CONSTRAINT DoesBusinessIn_PK PRIMARY KEY (CustomerID, TerritoryID),
    CONSTRAINT DoesBusinessIn_FK1 FOREIGN KEY (CustomerID) 
        REFERENCES Customer_T(CustomerID),
    CONSTRAINT DoesBusinessIn_FK2 FOREIGN KEY (TerritoryID) 
        REFERENCES Territory_T(TerritoryID)
);

-- Create Salesperson_T table

CREATE TABLE Salesperson_T (
	SalespersonID				NUMERIC(12) PRIMARY KEY NOT NULL,              
	SalespersonName 			VARCHAR(25), /* Fixed */
	SalespersonTelephone			VARCHAR(50),
	SalespersonFax				VARCHAR(50),
	SalespersonAddress			VARCHAR(30),
	SalespersonCity     			VARCHAR(20),
	SalespersonState    			CHAR(2),
	SalespersonZip				VARCHAR(20),
	SalesTerritoryID			NUMERIC(4));

-- Create Skill_T table

CREATE TABLE Skill_T (
	SkillID            			VARCHAR(12) NOT NULL,
	SkillDescription   			VARCHAR(30),              
CONSTRAINT Skill_PK PRIMARY KEY (SkillID));

-- Create Employee_T table

CREATE TABLE Employee_T (
	EmployeeID         			VARCHAR(10) NOT NULL,
	EmployeeName       			VARCHAR(25),
	EmployeeAddress    			VARCHAR(30),
	EmployeeCity       			VARCHAR(20),
	EmployeeState      			CHAR(2),
	EmployeeZip			        VARCHAR(10),
	EmployeeBirthDate  			DATE,
	EmployeeDateHired  			DATE,
	EmployeeSupervisor 			VARCHAR(10),
	CONSTRAINT Employee_PK 			PRIMARY KEY (EmployeeID));

-- Create table employee skills

CREATE TABLE EmployeeSkills_T (
	EmployeeID			        VARCHAR(10) NOT NULL,
	SkillID            			VARCHAR(12) NOT NULL,
	QualifyDate 	    			DATE,
	CONSTRAINT EmployeeSkills_PK 		PRIMARY KEY (EmployeeID, SkillID),
	CONSTRAINT EmployeeSkills_FK1 		FOREIGN KEY (EmployeeID) 
		REFERENCES Employee_T(EmployeeID),
	CONSTRAINT EmployeeSkills_FK2 		FOREIGN KEY (SkillID) 
		REFERENCES Skill_T(SkillID));

-- Create table WorkCenter_T

CREATE TABLE WorkCenter_T (
	WorkCenterID       			VARCHAR(12) NOT NULL,
	WorkCenterLocation  			VARCHAR(30),
	CONSTRAINT WorkCenter_PK 		PRIMARY KEY (WorkCenterID));

-- Create table WorksIn_T

CREATE TABLE WorksIn_T (
	EmployeeID          			VARCHAR(10) NOT NULL,
	WorkCenterID        			VARCHAR(12) NOT NULL,
	CONSTRAINT WorksIn_PK 			PRIMARY KEY (EmployeeID, WorkCenterID),
	CONSTRAINT WorksIn_FK1			FOREIGN KEY (EmployeeID) 
		REFERENCES Employee_T(EmployeeID),
	CONSTRAINT WorksIn_FK2 			FOREIGN KEY (WorkCenterID) 
		REFERENCES WorkCenter_T(WorkCenterID));

-- Create table ProductLine_T

CREATE TABLE ProductLine_T (
	ProductLineID     			NUMERIC(12) NOT NULL,
	ProductLineName    			VARCHAR(50),
	CONSTRAINT ProductLine_PK 		PRIMARY KEY (ProductLineID));

-- Create table Product_T

CREATE TABLE Product_T (
	ProductID            		NUMERIC(12) NOT NULL,
	ProductLineID        		NUMERIC(12),
	ProductDescription   		VARCHAR(50),
	ProductFinish        		VARCHAR(20),
	ProductStandardPrice 		NUMERIC(6,2),
	ProductOnHand	      		NUMERIC(6)      ,
	CONSTRAINT Product_PK 		PRIMARY KEY (ProductID),
	CONSTRAINT Product_FK1 		FOREIGN KEY (ProductLineID) 
		REFERENCES ProductLine_T(ProductLineID));

-- Create table ProducedIn_T

CREATE TABLE ProducedIn_T (
	ProductID	  		NUMERIC(12) NOT NULL,
	WorkCenterID     		VARCHAR(12) NOT NULL,
	CONSTRAINT ProducedInPK 	PRIMARY KEY (ProductID, WorkCenterID),
	CONSTRAINT ProducedInFK1 	FOREIGN KEY (ProductID) 
		REFERENCES Product_T(ProductID),
	CONSTRAINT ProducedInFK2 	FOREIGN KEY (WorkCenterID) 
		REFERENCES WorkCenter_T(WorkCenterID));

-- Create table CustomerShipAddress_T

CREATE TABLE CustomerShipAddress_T (
	ShipAddressID			NUMERIC(12) NOT NULL,
	CustomerID			NUMERIC(12) NOT NULL,
	TerritoryID			NUMERIC(12) NOT NULL,
	ShipAddress			VARCHAR(30),
	ShipCity			VARCHAR(20),
	ShipState			CHAR(2),
	ShipZip				VARCHAR(10),
	ShipDirections			VARCHAR(100),
	CONSTRAINT CSA_PK 		PRIMARY KEY (ShipAddressID),
	CONSTRAINT CSA_FK1 		FOREIGN KEY (CustomerID)
		REFERENCES Customer_T(CustomerID),
	CONSTRAINT CSA_FK2 		FOREIGN KEY (TerritoryID)
		REFERENCES Territory_T(TerritoryID));

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

-- Create table OrderLine_T

CREATE TABLE OrderLine_T (
	OrderLineID	    		NUMERIC(12) NOT NULL,
	OrderID 	           	NUMERIC(12) NOT NULL,
	ProductID   		    NUMERIC(12) NOT NULL,
	OrderedQuantity  		NUMERIC(10),
	CONSTRAINT OrderLine_PK 	PRIMARY KEY (OrderLineID),
	CONSTRAINT OrderLine_FK1 	FOREIGN KEY (OrderID) 
		REFERENCES Order_T(OrderID),
	CONSTRAINT OrderLine_FK2 	FOREIGN KEY (ProductID) 
		REFERENCES Product_T(ProductID));

-- Create table PaymentType_T

CREATE TABLE PaymentType_T (
  	PaymentTypeID  			VARCHAR(50) NOT NULL,
  	TypeDescription 		VARCHAR(50) NOT NULL,
	CONSTRAINT PaymentType_PK  	PRIMARY KEY (PaymentTypeID));
  

-- Create table Payment_T

CREATE TABLE Payment_T (
	PaymentID      			NUMERIC(12) NOT NULL,
	OrderID        			NUMERIC(12) NOT NULL,
	PaymentTypeID  			VARCHAR(50) NOT NULL,
	PaymentDate    			DATE,
	PaymentAmount  			NUMERIC(6,2),
	PaymentComment 			VARCHAR(255), 
	CONSTRAINT  Payment_PK  	PRIMARY KEY (PaymentID),
	CONSTRAINT  Payment_FK1 	FOREIGN KEY (OrderID)
    		REFERENCES Order_T(OrderID),
	CONSTRAINT  Payment_FK2 	FOREIGN KEY (PaymentTypeID)
    		REFERENCES PaymentType_T(PaymentTypeID));
    
-- Create table Shipped_T

CREATE TABLE Shipped_T (
	OrderLineId  			NUMERIC(12) NOT NULL,
	ShippedQuantity     		NUMERIC(10) NOT NULL,
	ShippedDate         		DATE,
	CONSTRAINT Shipped_PK 		PRIMARY KEY (OrderLineId),
  	CONSTRAINT Shipped_FK1  	FOREIGN KEY (OrderLineId)
    		REFERENCES OrderLine_T(OrderLineID));

-- Create table Vendor_T

CREATE TABLE Vendor_T (
	VendorID			NUMERIC(12) NOT NULL,
	VendorName     			VARCHAR(25),
    	VendorAddress      		VARCHAR(30),
    	VendorCity        		VARCHAR(20),
    	VendorState        		CHAR(2),
	VendorZipcode      		VARCHAR(50),
	VendorPhone        		VARCHAR(12),
	VendorFax          		VARCHAR(12),              
	VendorContact      		VARCHAR(50),
    	VendorTaxIdNumber  		VARCHAR(50),
	CONSTRAINT Vendor_PK 		PRIMARY KEY (VendorID));

-- Create table RawMaterial_T

CREATE TABLE RawMaterial_T (
	MaterialID             		VARCHAR(12) NOT NULL,
	MaterialName           		VARCHAR(30),
	Thickness			VARCHAR(50),
	Width				VARCHAR(50),
	MatSize				VARCHAR(50),  /*Fixed*/
	Material			VARCHAR(15),
    	MaterialStandardPrice  		NUMERIC(6,2),
	UnitOfMeasure          		VARCHAR(15),
	MaterialType			VARCHAR(50),
	CONSTRAINT RawMaterial_PK 	PRIMARY KEY (MaterialID)); /*Fixed*/

-- Create table Uses_T

CREATE TABLE Uses_T (
	MaterialID         		VARCHAR(12) NOT NULL,
	ProductID	      		NUMERIC(12) NOT NULL,
	QuantityRequired  		NUMERIC(5),
	CONSTRAINT Uses_PK 		PRIMARY KEY (ProductID, MaterialID),  /*Fixed*/
	CONSTRAINT Uses_FK1 		FOREIGN KEY (ProductID) 
		REFERENCES Product_T(ProductID),
	CONSTRAINT Uses_FK2 FOREIGN KEY (MaterialID) 
		REFERENCES RawMaterial_T(MaterialID));

-- Create table Supplies_T

CREATE TABLE Supplies_T (
	VendorID           		NUMERIC(12) NOT NULL,
	MaterialID         		VARCHAR(12) NOT NULL,
	SupplyUnitPrice    		NUMERIC(6,2),              
	CONSTRAINT Supplies_PK 		PRIMARY KEY (VendorID, MaterialID),
	CONSTRAINT Supplies_FK1 	FOREIGN KEY (MaterialID) 
		REFERENCES RawMaterial_T(MaterialID),
	CONSTRAINT Supplies_FK2 	FOREIGN KEY (VendorID) 
		REFERENCES Vendor_T(VendorID));

/*
SHOW COLUMNS FROM Supplies_T;  -- `describe` is specific to Oracle and is not supported in MySQL. Use SHOW COLUMNS FROM instead.
SHOW COLUMNS FROM Uses_T;
SHOW COLUMNS FROM RawMaterial_T;
SHOW COLUMNS FROM Vendor_T;
SHOW COLUMNS FROM PaymentType_T;
SHOW COLUMNS FROM Payment_T;
SHOW COLUMNS FROM Shipped_T;
SHOW COLUMNS FROM OrderLine_T;
SHOW COLUMNS FROM Order_T;
SHOW COLUMNS FROM CustomerShipAddress_T;
SHOW COLUMNS FROM ProducedIn_T;
SHOW COLUMNS FROM Product_T;
SHOW COLUMNS FROM ProductLine_T;
SHOW COLUMNS FROM WorksIn_T;
SHOW COLUMNS FROM WorkCenter_T;
SHOW COLUMNS FROM EmployeeSkills_T;
SHOW COLUMNS FROM Employee_T;
SHOW COLUMNS FROM Skill_T;
SHOW COLUMNS FROM Salesperson_T;
SHOW COLUMNS FROM DoesBusinessIn_T;
SHOW COLUMNS FROM Territory_T;
SHOW COLUMNS FROM Customer_T;
*/

/* show constraints by table for the PVFC schema in MySql */
-- SELECT 
--     TABLE_NAME, 
--     CONSTRAINT_NAME, 
--     CONSTRAINT_TYPE 
-- FROM 
--     INFORMATION_SCHEMA.TABLE_CONSTRAINTS 
-- WHERE 
--     CONSTRAINT_SCHEMA = 'PVFC';\

/* Begin Loading Data! This is the section from Script1 */
/* Revamped entirely for MySQL by Andrex Ibiza 2023-11-06 */

INSERT INTO Territory_T  (TerritoryID, TerritoryName) VALUES  (1, 'SouthEast');
INSERT INTO Territory_T  (TerritoryID, TerritoryName) VALUES  (2, 'SouthWest');
INSERT INTO Territory_T  (TerritoryID, TerritoryName) VALUES  (3, 'NorthEast');
INSERT INTO Territory_T  (TerritoryID, TerritoryName) VALUES  (4, 'NorthWest');
INSERT INTO Territory_T  (TerritoryID, TerritoryName) VALUES  (5, 'Central');
INSERT INTO Territory_T  (TerritoryID, TerritoryName) VALUES  (6, 'Alaska');
INSERT INTO Territory_T  (TerritoryID, TerritoryName) VALUES  (12, 'Hawaii');
INSERT INTO Territory_T  (TerritoryID, TerritoryName) VALUES  (13, 'Colorado');
INSERT INTO Territory_T  (TerritoryID, TerritoryName) VALUES  (15, 'Arizona');

INSERT INTO Customer_T (CustomerID,CustomerName,CustomerAddress,CustomerCity,CustomerState,CustomerPostalCode) VALUES (1,'Contemporary Casuals','1355 S Hines Blvd','Gainesville','FL','32601-2871');
INSERT INTO  Customer_T (CustomerID,CustomerName,CustomerAddress,CustomerCity,CustomerState,CustomerPostalCode) VALUES (2,'Value Furnitures','15145 S.W. 17th St.','Plano','TX','75094-7743');
INSERT INTO  Customer_T (CustomerID,CustomerName,CustomerAddress,CustomerCity,CustomerState,CustomerPostalCode) VALUES (3,'Home Furnishings','1900 Allard Ave','Albany','NY','12209-1125');
INSERT INTO  Customer_T (CustomerID,CustomerName,CustomerAddress,CustomerCity,CustomerState,CustomerPostalCode) VALUES (4,'Eastern Furniture','1925 Beltline Rd.','Carteret','NJ','07008-3188');
INSERT INTO  Customer_T (CustomerID,CustomerName,CustomerAddress,CustomerCity,CustomerState,CustomerPostalCode) VALUES (5,'Impressions','5585 Westcott Ct.','Sacramento','CA','94206-4056');
INSERT INTO  Customer_T (CustomerID,CustomerName,CustomerAddress,CustomerCity,CustomerState,CustomerPostalCode) VALUES (6,'Furniture Gallery','325 Flatiron Dr.','Boulder','CO','80514-4432');
INSERT INTO  Customer_T (CustomerID,CustomerName,CustomerAddress,CustomerCity,CustomerState,CustomerPostalCode) VALUES (7,'New Furniture','Palace Ave','Farmington','NM',null);
INSERT INTO  Customer_T (CustomerID,CustomerName,CustomerAddress,CustomerCity,CustomerState,CustomerPostalCode) VALUES (8,'Dunkins Furniture','7700 Main St','Syracuse','NY','31590');
INSERT INTO  Customer_T (CustomerID,CustomerName,CustomerAddress,CustomerCity,CustomerState,CustomerPostalCode) VALUES (9,'A Carpet','434 Abe Dr','Rome','NY','13440');
INSERT INTO  Customer_T (CustomerID,CustomerName,CustomerAddress,CustomerCity,CustomerState,CustomerPostalCode) VALUES (12,'Flanigan Furniture','Snow Flake Rd','Ft Walton Beach','FL','32548');
INSERT INTO  Customer_T (CustomerID,CustomerName,CustomerAddress,CustomerCity,CustomerState,CustomerPostalCode) VALUES (13,'Ikards','1011 S. Main St','Las Cruces','NM','88001');
INSERT INTO  Customer_T (CustomerID,CustomerName,CustomerAddress,CustomerCity,CustomerState,CustomerPostalCode) VALUES (14,'Wild Bills','Four Horse Rd','Oak Brook','Il','60522');
INSERT INTO  Customer_T (CustomerID,CustomerName,CustomerAddress,CustomerCity,CustomerState,CustomerPostalCode) VALUES (15,'Janet''s Collection','Janet Lane','Virginia Beach','VA','10012');
INSERT INTO  Customer_T (CustomerID,CustomerName,CustomerAddress,CustomerCity,CustomerState,CustomerPostalCode) VALUES (16,'ABC Furniture Co.','152 Geramino Drive','Rome','NY','13440');

INSERT INTO DoesBusinessIn_T  (CustomerID, TerritoryID) VALUES  (1, 1);
INSERT INTO DoesBusinessIn_T  (CustomerID, TerritoryID)	VALUES  (2, 2);
INSERT INTO DoesBusinessIn_T  (CustomerID, TerritoryID)	VALUES  (3, 3);
INSERT INTO DoesBusinessIn_T  (CustomerID, TerritoryID)	VALUES  (4, 4);
INSERT INTO DoesBusinessIn_T  (CustomerID, TerritoryID)	VALUES  (5, 5);
INSERT INTO DoesBusinessIn_T  (CustomerID, TerritoryID)	VALUES  (6, 6);
INSERT INTO DoesBusinessIn_T  (CustomerID, TerritoryID)	VALUES  (7, 1);

INSERT INTO Salesperson_T (SalespersonID,SalespersonName,SalespersonTelephone,SalespersonFax,SalesTerritoryID,SalespersonAddress,SalespersonCity,SalespersonState,SalespersonZip) VALUES (1,'Doug Henny','8134445555',null,2,null,null,null,null);
INSERT INTO Salesperson_T (SalespersonID,SalespersonName,SalespersonTelephone,SalespersonFax,SalesTerritoryID,SalespersonAddress,SalespersonCity,SalespersonState,SalespersonZip) VALUES (2,'Robert Lewis','8139264006',null,13,'124 Deerfield','Lutz','FL','33549');
INSERT INTO Salesperson_T (SalespersonID,SalespersonName,SalespersonTelephone,SalespersonFax,SalesTerritoryID,SalespersonAddress,SalespersonCity,SalespersonState,SalespersonZip) VALUES (3,'William Strong','3153821212',null,3,'787 Syracuse Lane','Syracuse','NY','33240');
INSERT INTO Salesperson_T (SalespersonID,SalespersonName,SalespersonTelephone,SalespersonFax,SalesTerritoryID,SalespersonAddress,SalespersonCity,SalespersonState,SalespersonZip) VALUES (4,'Julie Dawson','4355346677',null,4,null,null,null,null);
INSERT INTO Salesperson_T (SalespersonID,SalespersonName,SalespersonTelephone,SalespersonFax,SalesTerritoryID,SalespersonAddress,SalespersonCity,SalespersonState,SalespersonZip) VALUES (5,'Jacob Winslow','2238973498',null,5,null,null,null,null);
INSERT INTO Salesperson_T (SalespersonID,SalespersonName,SalespersonTelephone,SalespersonFax,SalesTerritoryID,SalespersonAddress,SalespersonCity,SalespersonState,SalespersonZip) VALUES (6,'Pepe Lepue',null,null,13,null,'Platsburg','NY',null);
INSERT INTO Salesperson_T (SalespersonID,SalespersonName,SalespersonTelephone,SalespersonFax,SalesTerritoryID,SalespersonAddress,SalespersonCity,SalespersonState,SalespersonZip) VALUES (8,'Fred Flinstone',null,null,2,'1 Rock Lane','Bedrock','Ca','99999');
INSERT INTO Salesperson_T (SalespersonID,SalespersonName,SalespersonTelephone,SalespersonFax,SalesTerritoryID,SalespersonAddress,SalespersonCity,SalespersonState,SalespersonZip) VALUES (9,'Mary James','3035555454',null,4,'9 Red Line','Denver','CO','55555');
INSERT INTO Salesperson_T (SalespersonID,SalespersonName,SalespersonTelephone,SalespersonFax,SalesTerritoryID,SalespersonAddress,SalespersonCity,SalespersonState,SalespersonZip) VALUES (10,'Mary Smithson','4075555555',null,15,'4585 Maple Dr','Orlando','FL','32826');

INSERT INTO Skill_T  (SkillID, SkillDescription) VALUES  ('BS12', '12in Band Saw');
INSERT INTO Skill_T  (SkillID, SkillDescription) VALUES  ('QC1', 'Quality Control');
INSERT INTO Skill_T  (SkillID, SkillDescription) VALUES  ('RT1', 'Router');
INSERT INTO Skill_T  (SkillID, SkillDescription) VALUES  ('SO1', 'Sander-Orbital');
INSERT INTO Skill_T  (SkillID, SkillDescription) VALUES  ('SB1', 'Sander-Belt');
INSERT INTO Skill_T  (SkillID, SkillDescription) VALUES  ('TS10', '10in Table Saw');
INSERT INTO Skill_T  (SkillID, SkillDescription) VALUES  ('TS12', '12in Table Saw');
INSERT INTO Skill_T  (SkillID, SkillDescription) VALUES  ('UC1', 'Upholstery Cutter');
INSERT INTO Skill_T  (SkillID, SkillDescription) VALUES  ('US1', 'Upholstery Sewer');
INSERT INTO Skill_T  (SkillID, SkillDescription) VALUES  ('UT1', 'Upholstery Tacker');

INSERT INTO Employee_T (EmployeeID, EmployeeName, EmployeeAddress, EmployeeCity, EmployeeState, EmployeeZip, EmployeeDateHired, EmployeeBirthDate, EmployeeSupervisor) VALUES ('123-44-345', 'Phil Morris', '2134 Hilltop Rd', 'Knoxville', 'TN', '55555', STR_TO_DATE('12-JUN-04', '%d-%b-%y'), STR_TO_DATE('05-JAN-77', '%d-%b-%y'), '454-56-768');
INSERT INTO Employee_T (EmployeeID, EmployeeName, EmployeeAddress, EmployeeCity, EmployeeState, EmployeeZip, EmployeeDateHired, EmployeeBirthDate, EmployeeSupervisor) VALUES ('332445667', 'Lawrence Haley', '5970 Spring Crest Rd', 'Nashville', 'TN', '54545', STR_TO_DATE('05-JAN-04', '%d-%b-%y'), STR_TO_DATE('15-AUG-83', '%d-%b-%y'), '454-56-768');
INSERT INTO Employee_T (EmployeeID, EmployeeName, EmployeeAddress, EmployeeCity, EmployeeState, EmployeeZip, EmployeeDateHired, EmployeeBirthDate, EmployeeSupervisor) VALUES ('454-56-768', 'Robert Lewis', '17834 Deerfield Ln', 'Knoxville', 'TN', '55555', STR_TO_DATE('01-JAN-03', '%d-%b-%y'), STR_TO_DATE('25-AUG-84', '%d-%b-%y'), '123-44-345');
INSERT INTO Employee_T (EmployeeID, EmployeeName, EmployeeAddress, EmployeeCity, EmployeeState, EmployeeZip, EmployeeDateHired, EmployeeBirthDate, EmployeeSupervisor) VALUES ('555955585', 'Mary Smith', '75 Jane Lane', 'Clearwater', 'FL', '33879', STR_TO_DATE('15-AUG-05', '%d-%b-%y'), STR_TO_DATE('06-MAY-69', '%d-%b-%y'), '332445667');
INSERT INTO Employee_T (EmployeeID, EmployeeName, EmployeeAddress, EmployeeCity, EmployeeState, EmployeeZip, EmployeeDateHired, EmployeeBirthDate, EmployeeSupervisor) VALUES ('374-34-223', 'Laura Ellenburg', '5342 Picklied Trout Lane', 'Nashville', 'TN', '38010', STR_TO_DATE('22-FEB-2018', '%d-%b-%Y'), NULL, '454-56-768');

INSERT INTO EmployeeSkills_T (EmployeeID, SkillID, QualifyDate) VALUES ('123-44-345', 'BS12', NULL);
INSERT INTO EmployeeSkills_T (EmployeeID, SkillID, QualifyDate) VALUES ('123-44-345', 'RT1', NULL);
INSERT INTO EmployeeSkills_T (EmployeeID, SkillID, QualifyDate) VALUES ('123-44-345', 'QC1', STR_TO_DATE('01-JAN-11', '%d-%b-%y'));
INSERT INTO EmployeeSkills_T (EmployeeID, SkillID, QualifyDate) VALUES ('123-44-345', 'TS10', STR_TO_DATE('24-FEB-11', '%d-%b-%y'));
INSERT INTO EmployeeSkills_T (EmployeeID, SkillID, QualifyDate) VALUES ('332445667', 'BS12', STR_TO_DATE('20-JAN-09', '%d-%b-%y'));
INSERT INTO EmployeeSkills_T (EmployeeID, SkillID, QualifyDate) VALUES ('332445667', 'TS10', STR_TO_DATE('20-JAN-09', '%d-%b-%y'));
INSERT INTO EmployeeSkills_T (EmployeeID, SkillID, QualifyDate) VALUES ('454-56-768', 'BS12', STR_TO_DATE('25-FEB-11', '%d-%b-%y'));
INSERT INTO EmployeeSkills_T (EmployeeID, SkillID, QualifyDate) VALUES ('454-56-768', 'RT1', STR_TO_DATE('10-MAR-11', '%d-%b-%y'));
INSERT INTO EmployeeSkills_T (EmployeeID, SkillID, QualifyDate) VALUES ('454-56-768', 'TS10', STR_TO_DATE('10-MAR-11', '%d-%b-%y'));
INSERT INTO EmployeeSkills_T (EmployeeID, SkillID, QualifyDate) VALUES ('374-34-223', 'UC1', STR_TO_DATE('22-FEB-18', '%d-%b-%y'));
INSERT INTO EmployeeSkills_T (EmployeeID, SkillID, QualifyDate) VALUES ('374-34-223', 'US1', STR_TO_DATE('22-FEB-18', '%d-%b-%y'));
INSERT INTO EmployeeSkills_T (EmployeeID, SkillID, QualifyDate) VALUES ('374-34-223', 'UT1', STR_TO_DATE('22-FEB-18', '%d-%b-%y'));

INSERT INTO WorkCenter_T  (WorkCenterID, WorkCenterLocation) VALUES ('SM1', 'Main Saw Mill');
INSERT INTO WorkCenter_T  (WorkCenterID, WorkCenterLocation) VALUES  ('WR1', 'Warehouse and Receiving');
INSERT INTO WorkCenter_T  (WorkCenterID, WorkCenterLocation) VALUES  ('Tampa1', 'Tampa Warehouse');

INSERT INTO WorksIn_T (EmployeeID, WorkCenterID) VALUES ('123-44-345', 'SM1');
INSERT INTO WorksIn_T (EmployeeID, WorkCenterID) VALUES ('454-56-768', 'Tampa1');

INSERT INTO ProductLine_T  (ProductLineID, ProductLineName) VALUES  (1, 'Basic');
INSERT INTO ProductLine_T  (ProductLineID, ProductLineName) VALUES  (2, 'Antique');
INSERT INTO ProductLine_T  (ProductLineID, ProductLineName) VALUES  (3, 'Modern');
INSERT INTO ProductLine_T  (ProductLineID, ProductLineName) VALUES  (4, 'Classical');
INSERT INTO ProductLine_T  (ProductLineID, ProductLineName) VALUES  (5, 'Futuristic');
INSERT INTO ProductLine_T  (ProductLineID, ProductLineName) VALUES  (6, 'Spanish Style');
INSERT INTO ProductLine_T  (ProductLineID, ProductLineName) VALUES  (7, 'Gothic');

INSERT INTO Product_T (ProductID,ProductDescription,ProductFinish,ProductStandardPrice,ProductOnHand,ProductLineID) VALUES (1,'Cherry End Table','Cherry',175.00,0,1);
INSERT INTO Product_T (ProductID,ProductDescription,ProductFinish,ProductStandardPrice,ProductOnHand,ProductLineID) VALUES (2,'Birch Coffee Tables','Birch',200.00,0,1);
INSERT INTO Product_T (ProductID,ProductDescription,ProductFinish,ProductStandardPrice,ProductOnHand,ProductLineID) VALUES (3,'Oak Computer Desk','Oak',750.00,0,1);
INSERT INTO Product_T (ProductID,ProductDescription,ProductFinish,ProductStandardPrice,ProductOnHand,ProductLineID) VALUES (4,'Entertainment Center','Cherry',1650.00,0,1);
INSERT INTO Product_T (ProductID,ProductDescription,ProductFinish,ProductStandardPrice,ProductOnHand,ProductLineID) VALUES (5,'Writer''s Desk','Oak',325.00,0,2);
INSERT INTO Product_T (ProductID,ProductDescription,ProductFinish,ProductStandardPrice,ProductOnHand,ProductLineID) VALUES (6,'8-Drawer Dresser','Birch',750.00,0,1);
INSERT INTO Product_T (ProductID,ProductDescription,ProductFinish,ProductStandardPrice,ProductOnHand,ProductLineID) VALUES (7,'48 Bookcase','Walnut',150.00,0,3);
INSERT INTO Product_T (ProductID,ProductDescription,ProductFinish,ProductStandardPrice,ProductOnHand,ProductLineID) VALUES (8,'48 Bookcase','Oak',175.00,0,3);
INSERT INTO Product_T (ProductID,ProductDescription,ProductFinish,ProductStandardPrice,ProductOnHand,ProductLineID) VALUES (9,'96 Bookcase','Walnut',225.00,0,3);
INSERT INTO Product_T (ProductID,ProductDescription,ProductFinish,ProductStandardPrice,ProductOnHand,ProductLineID) VALUES (10,'96 Bookcase','Oak',200.00,0,3);
INSERT INTO Product_T (ProductID,ProductDescription,ProductFinish,ProductStandardPrice,ProductOnHand,ProductLineID) VALUES (11,'4-Drawer Dresser','Oak',500.00,0,1);
INSERT INTO Product_T (ProductID,ProductDescription,ProductFinish,ProductStandardPrice,ProductOnHand,ProductLineID) VALUES (12,'8-Drawer Dresser','Oak',800.00,0,1);
INSERT INTO Product_T (ProductID,ProductDescription,ProductFinish,ProductStandardPrice,ProductOnHand,ProductLineID) VALUES (13,'Nightstand','Cherry',150.00,0,1);
INSERT INTO Product_T (ProductID,ProductDescription,ProductFinish,ProductStandardPrice,ProductOnHand,ProductLineID) VALUES (14,'Writer''s Desk','Birch',300.00,0,2);
INSERT INTO Product_T (ProductID,ProductDescription,ProductFinish,ProductStandardPrice,ProductOnHand,ProductLineID) VALUES (17,'High Back Leather Chair','Leather',362.00,0,3);
INSERT INTO Product_T (ProductID,ProductDescription,ProductFinish,ProductStandardPrice,ProductOnHand,ProductLineID) VALUES (18,'6'' Grandfather Clock','Oak',890.00,0,4);
INSERT INTO Product_T (ProductID,ProductDescription,ProductFinish,ProductStandardPrice,ProductOnHand,ProductLineID) VALUES (19,'7'' Grandfather Clock','Oak',1100.00,0,4);
INSERT INTO Product_T (ProductID,ProductDescription,ProductFinish,ProductStandardPrice,ProductOnHand,ProductLineID) VALUES (20,'Amoire','Walnut',1200.00,0,2);
INSERT INTO Product_T (ProductID,ProductDescription,ProductFinish,ProductStandardPrice,ProductOnHand,ProductLineID) VALUES (21,'Pine End Table','Pine',256.00,0,1);
INSERT INTO Product_T (ProductID,ProductDescription,ProductFinish,ProductStandardPrice,ProductOnHand,ProductLineID) VALUES (26,'Red Kitchen Chair','Steel',145.00,0,5);
INSERT INTO Product_T (ProductID,ProductDescription,ProductFinish,ProductStandardPrice,ProductOnHand,ProductLineID) VALUES (27,'Black Steel End Table','Steel',185.00,0,5);

INSERT INTO ProducedIn_T (ProductID, WorkCenterID) VALUES (1, 'Tampa1');
INSERT INTO ProducedIn_T (ProductID, WorkCenterID) VALUES (2, 'Tampa1');
INSERT INTO ProducedIn_T (ProductID, WorkCenterID) VALUES (3, 'Tampa1');
INSERT INTO ProducedIn_T (ProductID, WorkCenterID) VALUES (4, 'Tampa1');
INSERT INTO ProducedIn_T (ProductID, WorkCenterID) VALUES (5, 'Tampa1');
INSERT INTO ProducedIn_T (ProductID, WorkCenterID) VALUES (6, 'Tampa1');
INSERT INTO ProducedIn_T (ProductID, WorkCenterID) VALUES (7, 'Tampa1');
INSERT INTO ProducedIn_T (ProductID, WorkCenterID) VALUES (8, 'Tampa1');
INSERT INTO ProducedIn_T (ProductID, WorkCenterID) VALUES (9, 'Tampa1');
INSERT INTO ProducedIn_T (ProductID, WorkCenterID) VALUES (10, 'Tampa1');
INSERT INTO ProducedIn_T (ProductID, WorkCenterID) VALUES (11, 'Tampa1');
INSERT INTO ProducedIn_T (ProductID, WorkCenterID) VALUES (12, 'Tampa1');
INSERT INTO ProducedIn_T (ProductID, WorkCenterID) VALUES (13, 'Tampa1');
INSERT INTO ProducedIn_T (ProductID, WorkCenterID) VALUES (14, 'Tampa1');

INSERT INTO CustomerShipAddress_T (ShipAddressID,CustomerID,TerritoryID,ShipAddress,ShipCity,ShipState,ShipZip,ShipDirections) VALUES (1,4,13,'35456 Trifly Road','Lutz','FL','33549',null);
INSERT INTO CustomerShipAddress_T (ShipAddressID,CustomerID,TerritoryID,ShipAddress,ShipCity,ShipState,ShipZip,ShipDirections) VALUES (2,4,13,'1925 Beltline Rd.','Carteret','NJ',null,null);
INSERT INTO CustomerShipAddress_T (ShipAddressID,CustomerID,TerritoryID,ShipAddress,ShipCity,ShipState,ShipZip,ShipDirections) VALUES (3,1,6,'321 Butterfly Terr','Columbus','OH',null,null);
INSERT INTO CustomerShipAddress_T (ShipAddressID,CustomerID,TerritoryID,ShipAddress,ShipCity,ShipState,ShipZip,ShipDirections) VALUES (4,1,6,'7744 121 Street','Colubus','OH',null,null);
INSERT INTO CustomerShipAddress_T (ShipAddressID,CustomerID,TerritoryID,ShipAddress,ShipCity,ShipState,ShipZip,ShipDirections) VALUES (9,8,15,'US Embassy','Mexico City','Me',null,null);
INSERT INTO CustomerShipAddress_T (ShipAddressID,CustomerID,TerritoryID,ShipAddress,ShipCity,ShipState,ShipZip,ShipDirections) VALUES (10,16,4,'1256 One Lane','San Diego','CA','55555-',null);
INSERT INTO CustomerShipAddress_T (ShipAddressID,CustomerID,TerritoryID,ShipAddress,ShipCity,ShipState,ShipZip,ShipDirections) VALUES (11,9,1,'17832 Rt 92','Mobil','AL','39889-',null);
INSERT INTO CustomerShipAddress_T (ShipAddressID,CustomerID,TerritoryID,ShipAddress,ShipCity,ShipState,ShipZip,ShipDirections) VALUES (13,14,5,'303 Drakes Landing','Manhattan','KS','66502-',null);
INSERT INTO CustomerShipAddress_T (ShipAddressID,CustomerID,TerritoryID,ShipAddress,ShipCity,ShipState,ShipZip,ShipDirections) VALUES (14,13,2,'3400 Amador Ave','Las Cruces','NM','88001-',null);
INSERT INTO CustomerShipAddress_T (ShipAddressID,CustomerID,TerritoryID,ShipAddress,ShipCity,ShipState,ShipZip,ShipDirections) VALUES (15,4,6,'657 10th st','Kodiak','AK','99878-',null);
INSERT INTO CustomerShipAddress_T (ShipAddressID,CustomerID,TerritoryID,ShipAddress,ShipCity,ShipState,ShipZip,ShipDirections) VALUES (17,9,5,'100 E. Fletch','Pocahatas','OH','39877-',null);
INSERT INTO CustomerShipAddress_T (ShipAddressID,CustomerID,TerritoryID,ShipAddress,ShipCity,ShipState,ShipZip,ShipDirections) VALUES (19,4,13,'655 Rocky Point','Denver','CO',null,null);

INSERT INTO Order_T (OrderID, OrderDate, CustomerID, FulfillmentDate, SalespersonID, ShipAdrsID) VALUES (1, STR_TO_DATE('08/Sep/17', '%d/%b/%y'), 4, STR_TO_DATE('25/Nov/17', '%d/%b/%y'), 3, NULL);
INSERT INTO Order_T (OrderID, OrderDate, CustomerID, FulfillmentDate, SalespersonID, ShipAdrsID) VALUES (2, STR_TO_DATE('04/Oct/17', '%d/%b/%y'), 3, NULL, 3, NULL);
INSERT INTO Order_T (OrderID, OrderDate, CustomerID, FulfillmentDate, SalespersonID, ShipAdrsID) VALUES (3, STR_TO_DATE('19/Jul/17', '%d/%b/%y'), 1, NULL, 2, NULL);
INSERT INTO Order_T (OrderID, OrderDate, CustomerID, FulfillmentDate, SalespersonID, ShipAdrsID) VALUES (4, STR_TO_DATE('01/Nov/17', '%d/%b/%y'), 6, NULL, 5, NULL);
INSERT INTO Order_T (OrderID, OrderDate, CustomerID, FulfillmentDate, SalespersonID, ShipAdrsID) VALUES (5, STR_TO_DATE('28/Jul/17', '%d/%b/%y'), 4, NULL, 3, NULL);
INSERT INTO Order_T (OrderID, OrderDate, CustomerID, FulfillmentDate, SalespersonID, ShipAdrsID) VALUES (6, STR_TO_DATE('27/Aug/17', '%d/%b/%y'), 4, NULL, 3, NULL);
INSERT INTO Order_T (OrderID, OrderDate, CustomerID, FulfillmentDate, SalespersonID, ShipAdrsID) VALUES (7, STR_TO_DATE('16/Sep/17', '%d/%b/%y'), 1, NULL, 2, NULL);
INSERT INTO Order_T (OrderID, OrderDate, CustomerID, FulfillmentDate, SalespersonID, ShipAdrsID) VALUES (8, STR_TO_DATE('16/Sep/17', '%d/%b/%y'), 4, NULL, 3, NULL);
INSERT INTO Order_T (OrderID, OrderDate, CustomerID, FulfillmentDate, SalespersonID, ShipAdrsID) VALUES (9, STR_TO_DATE('16/Sep/17', '%d/%b/%y'), 6, NULL, 5, NULL);
INSERT INTO Order_T (OrderID, OrderDate, CustomerID, FulfillmentDate, SalespersonID, ShipAdrsID) VALUES (19, STR_TO_DATE('05/Mar/18', '%d/%b/%y'), 4, NULL, 3, NULL);
INSERT INTO Order_T (OrderID, OrderDate, CustomerID, FulfillmentDate, SalespersonID, ShipAdrsID) VALUES (20, STR_TO_DATE('06/Mar/18', '%d/%b/%y'), 4, NULL, 3, NULL);
INSERT INTO Order_T (OrderID, OrderDate, CustomerID, FulfillmentDate, SalespersonID, ShipAdrsID) VALUES (21, STR_TO_DATE('06/Mar/18', '%d/%b/%y'), 4, NULL, 3, NULL);
INSERT INTO Order_T (OrderID, OrderDate, CustomerID, FulfillmentDate, SalespersonID, ShipAdrsID) VALUES (22, STR_TO_DATE('06/Mar/18', '%d/%b/%y'), 4, NULL, 3, NULL);
INSERT INTO Order_T (OrderID, OrderDate, CustomerID, FulfillmentDate, SalespersonID, ShipAdrsID) VALUES (23, STR_TO_DATE('06/Mar/18', '%d/%b/%y'), 4, NULL, 3, NULL);
INSERT INTO Order_T (OrderID, OrderDate, CustomerID, FulfillmentDate, SalespersonID, ShipAdrsID) VALUES (24, STR_TO_DATE('10/Mar/18', '%d/%b/%y'), 1, NULL, 2, NULL);
INSERT INTO Order_T (OrderID, OrderDate, CustomerID, FulfillmentDate, SalespersonID, ShipAdrsID) VALUES (25, STR_TO_DATE('10/Mar/18', '%d/%b/%y'), 4, NULL, 3, NULL);
INSERT INTO Order_T (OrderID, OrderDate, CustomerID, FulfillmentDate, SalespersonID, ShipAdrsID) VALUES (26, STR_TO_DATE('10/Mar/18', '%d/%b/%y'), 4, NULL, 3, NULL);
INSERT INTO Order_T (OrderID, OrderDate, CustomerID, FulfillmentDate, SalespersonID, ShipAdrsID) VALUES (27, STR_TO_DATE('10/Mar/18', '%d/%b/%y'), 4, NULL, 3, NULL);
INSERT INTO Order_T (OrderID, OrderDate, CustomerID, FulfillmentDate, SalespersonID, ShipAdrsID) VALUES (28, STR_TO_DATE('10/Mar/18', '%d/%b/%y'), 4, NULL, 3, NULL);
INSERT INTO Order_T (OrderID, OrderDate, CustomerID, FulfillmentDate, SalespersonID, ShipAdrsID) VALUES (29, STR_TO_DATE('11/Mar/18', '%d/%b/%y'), 4, NULL, 3, NULL);
INSERT INTO Order_T (OrderID, OrderDate, CustomerID, FulfillmentDate, SalespersonID, ShipAdrsID) VALUES (30, STR_TO_DATE('11/Mar/18', '%d/%b/%y'), 4, NULL, 3, 4);
INSERT INTO Order_T (OrderID, OrderDate, CustomerID, FulfillmentDate, SalespersonID, ShipAdrsID) VALUES (31, STR_TO_DATE('11/Mar/18', '%d/%b/%y'), 15, NULL, 4, NULL);
INSERT INTO Order_T (OrderID, OrderDate, CustomerID, FulfillmentDate, SalespersonID, ShipAdrsID) VALUES (32, STR_TO_DATE('11/Mar/18', '%d/%b/%y'), 15, NULL, 4, NULL);
INSERT INTO Order_T (OrderID, OrderDate, CustomerID, FulfillmentDate, SalespersonID, ShipAdrsID) VALUES (34, STR_TO_DATE('11/Mar/18', '%d/%b/%y'), 15, NULL, 4, NULL);
INSERT INTO Order_T (OrderID, OrderDate, CustomerID, FulfillmentDate, SalespersonID, ShipAdrsID) VALUES (35, STR_TO_DATE('11/Mar/18', '%d/%b/%y'), 8, NULL, 5, NULL);
INSERT INTO Order_T (OrderID, OrderDate, CustomerID, FulfillmentDate, SalespersonID, ShipAdrsID) VALUES (36, STR_TO_DATE('11/Mar/18', '%d/%b/%y'), 4, NULL, 3, 1);
INSERT INTO Order_T (OrderID, OrderDate, CustomerID, FulfillmentDate, SalespersonID, ShipAdrsID) VALUES (37, STR_TO_DATE('11/Mar/18', '%d/%b/%y'), 4, NULL, 3, NULL);
INSERT INTO Order_T (OrderID, OrderDate, CustomerID, FulfillmentDate, SalespersonID, ShipAdrsID) VALUES (38, STR_TO_DATE('11/Mar/18', '%d/%b/%y'), 4, NULL, 3, 1);
INSERT INTO Order_T (OrderID, OrderDate, CustomerID, FulfillmentDate, SalespersonID, ShipAdrsID) VALUES (39, STR_TO_DATE('11/Mar/18', '%d/%b/%y'), 4, NULL, 3, 1);
INSERT INTO Order_T (OrderID, OrderDate, CustomerID, FulfillmentDate, SalespersonID, ShipAdrsID) VALUES (40, STR_TO_DATE('11/Mar/18', '%d/%b/%y'), 4, NULL, 3, NULL);
INSERT INTO Order_T (OrderID, OrderDate, CustomerID, FulfillmentDate, SalespersonID, ShipAdrsID) VALUES (41, STR_TO_DATE('11/Mar/18', '%d/%b/%y'), 12, NULL, 6, NULL);
INSERT INTO Order_T (OrderID, OrderDate, CustomerID, FulfillmentDate, SalespersonID, ShipAdrsID) VALUES (42, STR_TO_DATE('11/Mar/18', '%d/%b/%y'), 4, NULL, 3, NULL);
INSERT INTO Order_T (OrderID, OrderDate, CustomerID, FulfillmentDate, SalespersonID, ShipAdrsID) VALUES (43, STR_TO_DATE('11/Mar/18', '%d/%b/%y'), 12, NULL, 6, NULL);
INSERT INTO Order_T (OrderID, OrderDate, CustomerID, FulfillmentDate, SalespersonID, ShipAdrsID) VALUES (44, STR_TO_DATE('11/Mar/18', '%d/%b/%y'), 6, NULL, 9, NULL);
INSERT INTO Order_T (OrderID, OrderDate, CustomerID, FulfillmentDate, SalespersonID, ShipAdrsID) VALUES (45, STR_TO_DATE('11/Mar/18', '%d/%b/%y'), 12, NULL, 6, NULL);
INSERT INTO Order_T (OrderID, OrderDate, CustomerID, FulfillmentDate, SalespersonID, ShipAdrsID) VALUES (46, STR_TO_DATE('11/Mar/18', '%d/%b/%y'), 1, NULL, 2, NULL);
INSERT INTO Order_T (OrderID, OrderDate, CustomerID, FulfillmentDate, SalespersonID, ShipAdrsID) VALUES (47, STR_TO_DATE('11/Mar/18', '%d/%b/%y'), 12, NULL, 6, NULL);
INSERT INTO Order_T (OrderID, OrderDate, CustomerID, FulfillmentDate, SalespersonID, ShipAdrsID) VALUES (48, STR_TO_DATE('11/Mar/18', '%d/%b/%y'), 1, NULL, 2, 3);
INSERT INTO Order_T (OrderID, OrderDate, CustomerID, FulfillmentDate, SalespersonID, ShipAdrsID) VALUES (49, STR_TO_DATE('11/Mar/18', '%d/%b/%y'), 4, NULL, 3, 2);
INSERT INTO Order_T (OrderID, OrderDate, CustomerID, FulfillmentDate, SalespersonID, ShipAdrsID) VALUES (50, STR_TO_DATE('11/Mar/18', '%d/%b/%y'), 8, NULL, NULL, 9);
INSERT INTO Order_T (OrderID, OrderDate, CustomerID, FulfillmentDate, SalespersonID, ShipAdrsID) VALUES (51, STR_TO_DATE('11/Mar/18', '%d/%b/%y'), 16, NULL, NULL, NULL);
INSERT INTO Order_T (OrderID, OrderDate, CustomerID, FulfillmentDate, SalespersonID, ShipAdrsID) VALUES (52, STR_TO_DATE('11/Mar/18', '%d/%b/%y'), 16, NULL, NULL, NULL);
INSERT INTO Order_T (OrderID, OrderDate, CustomerID, FulfillmentDate, SalespersonID, ShipAdrsID) VALUES (53, STR_TO_DATE('11/Mar/18', '%d/%b/%y'), 16, NULL, NULL, NULL);
INSERT INTO Order_T (OrderID, OrderDate, CustomerID, FulfillmentDate, SalespersonID, ShipAdrsID) VALUES (54, STR_TO_DATE('11/Mar/18', '%d/%b/%y'), 16, NULL, 9, 10);
INSERT INTO Order_T (OrderID, OrderDate, CustomerID, FulfillmentDate, SalespersonID, ShipAdrsID) VALUES (55, STR_TO_DATE('11/Mar/18', '%d/%b/%y'), 16, NULL, NULL, NULL);
INSERT INTO Order_T (OrderID, OrderDate, CustomerID, FulfillmentDate, SalespersonID, ShipAdrsID) VALUES (56, STR_TO_DATE('11/Mar/18', '%d/%b/%y'), 9, NULL, 2, 11);
INSERT INTO Order_T (OrderID, OrderDate, CustomerID, FulfillmentDate, SalespersonID, ShipAdrsID) VALUES (57, STR_TO_DATE('11/Mar/18', '%d/%b/%y'), 9, NULL, NULL, NULL);
INSERT INTO Order_T (OrderID, OrderDate, CustomerID, FulfillmentDate, SalespersonID, ShipAdrsID) VALUES (58, STR_TO_DATE('11/Mar/18', '%d/%b/%y'), 14, NULL, 5, 13);
INSERT INTO Order_T (OrderID, OrderDate, CustomerID, FulfillmentDate, SalespersonID, ShipAdrsID) VALUES (59, STR_TO_DATE('11/Mar/18', '%d/%b/%y'), 13, NULL, 8, 14);
INSERT INTO Order_T (OrderID, OrderDate, CustomerID, FulfillmentDate, SalespersonID, ShipAdrsID) VALUES (63, STR_TO_DATE('11/Mar/18', '%d/%b/%y'), 4, NULL, 6, 15);
INSERT INTO Order_T (OrderID, OrderDate, CustomerID, FulfillmentDate, SalespersonID, ShipAdrsID) VALUES (64, STR_TO_DATE('11/Mar/18', '%d/%b/%y'), 4, NULL, 6, 2);
INSERT INTO Order_T (OrderID, OrderDate, CustomerID, FulfillmentDate, SalespersonID, ShipAdrsID) VALUES (65, STR_TO_DATE('11/Mar/18', '%d/%b/%y'), 4, NULL, 6, 1);
INSERT INTO Order_T (OrderID, OrderDate, CustomerID, FulfillmentDate, SalespersonID, ShipAdrsID) VALUES (66, STR_TO_DATE('11/Mar/18', '%d/%b/%y'), 9, NULL, 5, 17);
INSERT INTO Order_T (OrderID, OrderDate, CustomerID, FulfillmentDate, SalespersonID, ShipAdrsID) VALUES (69, STR_TO_DATE('11/Mar/18', '%d/%b/%y'), 4, NULL, 2, 2);
INSERT INTO Order_T (OrderID, OrderDate, CustomerID, FulfillmentDate, SalespersonID, ShipAdrsID) VALUES (71, STR_TO_DATE('08/Sep/18', '%d/%b/%y'), 4, NULL, NULL, NULL);
INSERT INTO Order_T (OrderID, OrderDate, CustomerID, FulfillmentDate, SalespersonID, ShipAdrsID) VALUES (73, STR_TO_DATE('08/Sep/18', '%d/%b/%y'), 12, NULL, NULL, NULL);
INSERT INTO Order_T (OrderID, OrderDate, CustomerID, FulfillmentDate, SalespersonID, ShipAdrsID) VALUES (75, STR_TO_DATE('08/Sep/18', '%d/%b/%y'), 1, NULL, NULL, 3);
INSERT INTO Order_T (OrderID, OrderDate, CustomerID, FulfillmentDate, SalespersonID, ShipAdrsID) VALUES (76, STR_TO_DATE('15/Sep/18', '%d/%b/%y'), 4, NULL, NULL, NULL);

INSERT INTO OrderLine_T (OrderLineID,OrderID,ProductID,OrderedQuantity) VALUES (1,1,2,18);
INSERT INTO OrderLine_T (OrderLineID,OrderID,ProductID,OrderedQuantity) VALUES (31,1,6,2);
INSERT INTO OrderLine_T (OrderLineID,OrderID,ProductID,OrderedQuantity) VALUES (2,1,10,9);
INSERT INTO OrderLine_T (OrderLineID,OrderID,ProductID,OrderedQuantity) VALUES (3,2,3,12);
INSERT INTO OrderLine_T (OrderLineID,OrderID,ProductID,OrderedQuantity) VALUES (4,2,8,2);
INSERT INTO OrderLine_T (OrderLineID,OrderID,ProductID,OrderedQuantity) VALUES (5,2,14,2);
INSERT INTO OrderLine_T (OrderLineID,OrderID,ProductID,OrderedQuantity) VALUES (17,3,2,2);
INSERT INTO OrderLine_T (OrderLineID,OrderID,ProductID,OrderedQuantity) VALUES (7,4,3,1);
INSERT INTO OrderLine_T (OrderLineID,OrderID,ProductID,OrderedQuantity) VALUES (15,4,4,0);
INSERT INTO OrderLine_T (OrderLineID,OrderID,ProductID,OrderedQuantity) VALUES (8,4,5,3);
INSERT INTO OrderLine_T (OrderLineID,OrderID,ProductID,OrderedQuantity) VALUES (16,4,6,3);
INSERT INTO OrderLine_T (OrderLineID,OrderID,ProductID,OrderedQuantity) VALUES (29,5,1,1);
INSERT INTO OrderLine_T (OrderLineID,OrderID,ProductID,OrderedQuantity) VALUES (9,5,6,2);
INSERT INTO OrderLine_T (OrderLineID,OrderID,ProductID,OrderedQuantity) VALUES (37,24,1,0);
INSERT INTO OrderLine_T (OrderLineID,OrderID,ProductID,OrderedQuantity) VALUES (39,25,2,5);
INSERT INTO OrderLine_T (OrderLineID,OrderID,ProductID,OrderedQuantity) VALUES (40,26,1,5);
INSERT INTO OrderLine_T (OrderLineID,OrderID,ProductID,OrderedQuantity) VALUES (41,28,1,2);
INSERT INTO OrderLine_T (OrderLineID,OrderID,ProductID,OrderedQuantity) VALUES (42,32,5,10);
INSERT INTO OrderLine_T (OrderLineID,OrderID,ProductID,OrderedQuantity) VALUES (43,32,14,10);
INSERT INTO OrderLine_T (OrderLineID,OrderID,ProductID,OrderedQuantity) VALUES (46,39,2,3);
INSERT INTO OrderLine_T (OrderLineID,OrderID,ProductID,OrderedQuantity) VALUES (51,48,17,5);
INSERT INTO OrderLine_T (OrderLineID,OrderID,ProductID,OrderedQuantity) VALUES (54,49,1,1);
INSERT INTO OrderLine_T (OrderLineID,OrderID,ProductID,OrderedQuantity) VALUES (53,50,20,1);
INSERT INTO OrderLine_T (OrderLineID,OrderID,ProductID,OrderedQuantity) VALUES (55,51,3,2);
INSERT INTO OrderLine_T (OrderLineID,OrderID,ProductID,OrderedQuantity) VALUES (56,51,4,1);
INSERT INTO OrderLine_T (OrderLineID,OrderID,ProductID,OrderedQuantity) VALUES (57,52,1,2);
INSERT INTO OrderLine_T (OrderLineID,OrderID,ProductID,OrderedQuantity) VALUES (58,52,4,1);
INSERT INTO OrderLine_T (OrderLineID,OrderID,ProductID,OrderedQuantity) VALUES (59,54,2,2);
INSERT INTO OrderLine_T (OrderLineID,OrderID,ProductID,OrderedQuantity) VALUES (60,54,3,3);
INSERT INTO OrderLine_T (OrderLineID,OrderID,ProductID,OrderedQuantity) VALUES (61,55,1,1);
INSERT INTO OrderLine_T (OrderLineID,OrderID,ProductID,OrderedQuantity) VALUES (62,55,4,2);
INSERT INTO OrderLine_T (OrderLineID,OrderID,ProductID,OrderedQuantity) VALUES (63,56,4,1);
INSERT INTO OrderLine_T (OrderLineID,OrderID,ProductID,OrderedQuantity) VALUES (64,58,3,1);
INSERT INTO OrderLine_T (OrderLineID,OrderID,ProductID,OrderedQuantity) VALUES (65,59,13,2);
INSERT INTO OrderLine_T (OrderLineID,OrderID,ProductID,OrderedQuantity) VALUES (66,63,3,5);
INSERT INTO OrderLine_T (OrderLineID,OrderID,ProductID,OrderedQuantity) VALUES (67,65,4,0);
INSERT INTO OrderLine_T (OrderLineID,OrderID,ProductID,OrderedQuantity) VALUES (68,66,4,1);
INSERT INTO OrderLine_T (OrderLineID,OrderID,ProductID,OrderedQuantity) VALUES (69,69,7,4);
INSERT INTO OrderLine_T (OrderLineID,OrderID,ProductID,OrderedQuantity) VALUES (70,71,3,0);

INSERT INTO Shipped_T (OrderLineID, ShippedQuantity, ShippedDate) VALUES (1, 1, STR_TO_DATE('16/Sep/18', '%d/%b/%y'));
INSERT INTO Shipped_T (OrderLineID, ShippedQuantity, ShippedDate) VALUES (2, 0, NULL);
INSERT INTO Shipped_T (OrderLineID, ShippedQuantity, ShippedDate) VALUES (3, 1, STR_TO_DATE('16/Sep/18', '%d/%b/%y'));
INSERT INTO Shipped_T (OrderLineID, ShippedQuantity, ShippedDate) VALUES (5, 2, STR_TO_DATE('16/Sep/18', '%d/%b/%y'));

INSERT INTO PaymentType_T (PaymentTypeID, TypeDescription) VALUES ('D', 'Deposit');
INSERT INTO PaymentType_T (PaymentTypeID, TypeDescription) VALUES ('R', 'Refund');
INSERT INTO PaymentType_T (PaymentTypeID, TypeDescription) VALUES ('T', 'Transfer');

INSERT INTO Payment_T (PaymentID, OrderID, PaymentDate, PaymentTypeID, PaymentAmount, PaymentComment) VALUES (1, 1, STR_TO_DATE('01/Mar/18', '%d/%b/%y'), 'D', 1000.0, 'chk101');
INSERT INTO Payment_T (PaymentID, OrderID, PaymentDate, PaymentTypeID, PaymentAmount, PaymentComment) VALUES (2, 24, STR_TO_DATE('10/Mar/18', '%d/%b/%y'), 'D', 25.0, 'cash');
INSERT INTO Payment_T (PaymentID, OrderID, PaymentDate, PaymentTypeID, PaymentAmount, PaymentComment) VALUES (3, 26, STR_TO_DATE('10/Mar/18', '%d/%b/%y'), 'D', 222.0, 'cash');
INSERT INTO Payment_T (PaymentID, OrderID, PaymentDate, PaymentTypeID, PaymentAmount, PaymentComment) VALUES (4, 28, STR_TO_DATE('10/Mar/18', '%d/%b/%y'), 'D', 25.0, 'cash');
INSERT INTO Payment_T (PaymentID, OrderID, PaymentDate, PaymentTypeID, PaymentAmount, PaymentComment) VALUES (5, 32, STR_TO_DATE('11/Mar/18', '%d/%b/%y'), 'D', 3000.0, 'Cashiers Check');
INSERT INTO Payment_T (PaymentID, OrderID, PaymentDate, PaymentTypeID, PaymentAmount, PaymentComment) VALUES (6, 34, STR_TO_DATE('11/Mar/18', '%d/%b/%y'), 'D', 575.0, 'Chk1201');
INSERT INTO Payment_T (PaymentID, OrderID, PaymentDate, PaymentTypeID, PaymentAmount, PaymentComment) VALUES (7, 39, STR_TO_DATE('11/Mar/18', '%d/%b/%y'), 'D', 600.0, 'chk 1003');
INSERT INTO Payment_T (PaymentID, OrderID, PaymentDate, PaymentTypeID, PaymentAmount, PaymentComment) VALUES (8, 48, STR_TO_DATE('11/Mar/18', '%d/%b/%y'), 'D', 1000.0, 'chk2301');
INSERT INTO Payment_T (PaymentID, OrderID, PaymentDate, PaymentTypeID, PaymentAmount, PaymentComment) VALUES (9, 51, STR_TO_DATE('11/Mar/18', '%d/%b/%y'), 'D', 150.0, 'cash');
INSERT INTO Payment_T (PaymentID, OrderID, PaymentDate, PaymentTypeID, PaymentAmount, PaymentComment) VALUES (10, 54, STR_TO_DATE('11/Mar/18', '%d/%b/%y'), 'D', 2650.0, 'Check # 343');
INSERT INTO Payment_T (PaymentID, OrderID, PaymentDate, PaymentTypeID, PaymentAmount, PaymentComment) VALUES (11, 69, STR_TO_DATE('11/Mar/18', '%d/%b/%y'), 'D', 200.0, 'chk3001');

INSERT INTO Vendor_T (VendorID, VendorName, VendorAddress, VendorCity, VendorState, VendorZipcode, VendorPhone, VendorFax, VendorContact, VendorTaxIDNumber) VALUES (1, 'Robert''s Lumber Yard', '1234 Wooded Lane', 'Forest Hill', 'TN', '33333-', '333-333-3333', '', 'Robert', '123456789');
INSERT INTO Vendor_T (VendorID, VendorName, VendorAddress, VendorCity, VendorState, VendorZipcode, VendorPhone, VendorFax, VendorContact, VendorTaxIDNumber) VALUES (2, 'Southern Lumber', '8768 Durgee Rd', 'Jacksonville', 'FL', '25998-', '444-444-4444', '', '', '');
INSERT INTO Vendor_T (VendorID, VendorName, VendorAddress, VendorCity, VendorState, VendorZipcode, VendorPhone, VendorFax, VendorContact, VendorTaxIDNumber) VALUES (3, 'Pebbles Hardware', '2323 Hardrock Rd', 'Bedrock', 'TX', '77777-', '555-555-5555', '', '', '');


/* run basic queries over every table to verify data               */

/*
SELECT * FROM Vendor_T;
SELECT * FROM Payment_T;
SELECT * FROM PaymentType_T;
SELECT * FROM Shipped_T;
SELECT * FROM OrderLine_T;
SELECT * FROM Order_T;
SELECT * FROM CustomerShipAddress_T;
SELECT * FROM ProducedIn_T;
SELECT * FROM Product_T;
SELECT * FROM ProductLine_T;
SELECT * FROM WorksIn_T;
SELECT * FROM WorkCenter_T;
SELECT * FROM EmployeeSkills_T;
SELECT * FROM Employee_T;
SELECT * FROM Skill_T;
SELECT * FROM Salesperson_T;
SELECT * FROM DoesBusinessIn_T;
SELECT * FROM Territory_T;
SELECT * FROM Customer_T;
*/



