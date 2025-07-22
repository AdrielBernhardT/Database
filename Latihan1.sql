CREATE DATABASE hehe_groceries;

USE hehe_groceries;

CREATE TABLE MsCustomer (
    CustomerID CHAR(5) Primary key CHECK(CustomerID REGEXP '^CU[0-9]{3}$'),
    CustomerName VARCHAR(50) NOT NULL,
    CustomerGender VARCHAR(10) NOT NULL,
    CustomerAddress VARCHAR(50) NOT NULL,
    CustomerEmail VARCHAR(50) NOT NULL,
    CustomerDOB DATE NOT NULL
);

CREATE TABLE MsEmployee (
    EmployeeID CHAR(5) Primary key CHECK(EmployeeID REGEXP '^EM[0-9]{3}$'),
    EmployeeName VARCHAR(50) NOT NULL,
    EmployeeGender VARCHAR(10) NOT NULL,
    EmployeeAddress VARCHAR(50) NOT NULL
);


CREATE TABLE MsCategory (
    CategoryID CHAR(5) Primary key CHECK(CategoryID REGEXP '^CT[0-9]{3}$'),
    CategoryName VARCHAR(50) NOT NULL
);

CREATE TABLE MsProduct (
    ProductID CHAR(5) Primary key CHECK(ProductID REGEXP '^PR[0-9]{3}$'),
    CategoryID CHAR(5),
    ProductName VARCHAR(50) NOT NULL,
    ProductPrice INT NOT NULL,
    Foreign key(CategoryID) references MsCategory(CategoryID) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE TransactionHeader (
    TransactionID CHAR(5) Primary key CHECK(TransactionID REGEXP '^TR[0-9]{3}$'),
    EmployeeID CHAR(5),
    CustomerID CHAR(5),
    TransactionDate DATE NOT NULL,
    Foreign key(EmployeeID) references MsEmployee(EmployeeID) ON DELETE CASCADE ON UPDATE CASCADE,
    Foreign key(CustomerID) references MsCustomer(CustomerID) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE TransactionDetail (
    TransactionID CHAR(5),
    ProductID CHAR(5), 
    Quantity INT NOT NULL CHECK(Quantity > 0),
    Foreign key(TransactionID) references TransactionHeader(TransactionID) ON DELETE CASCADE ON UPDATE CASCADE,
    Foreign key(ProductID) references MsProduct(ProductID) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE MsBrand (
    BrandID CHAR(5) Primary Key CHECK(BrandID REGEXP '^BR[0-9]{3}$'),
    BrandName VARCHAR(50) NOT NULL
);

DROP TABLE MsBrand;

INSERT INTO MsCustomer (CustomerID, CustomerName, CustomerGender, CustomerAddress, CustomerEmail, CustomerDOB)
VALUES ("CU001", "Dirk Titterel", "Male", "74 Melvin Point", "Dtitterel0@yellowpages.com", "2003-10-29");

INSERT INTO MsEmployee (EmployeeID, EmployeeName, EmployeeGender, EmployeeAddress)
VALUES ("EM001", "Clem", "Male", "0975 Forest Dale Trail");
INSERT INTO MsEmployee (EmployeeID, EmployeeName, EmployeeGender, EmployeeAddress)
VALUES ("EM002", "Dene", "Male", "2 Grayhawk Parkway");
INSERT INTO MsEmployee (EmployeeID, EmployeeName, EmployeeGender, EmployeeAddress)
VALUES ("EM003", "Lethia", "Female", "905 Goodland Lane");
INSERT INTO MsEmployee (EmployeeID, EmployeeName, EmployeeGender, EmployeeAddress)
VALUES ("EM004", "Tyrone", "Male", "51745 Bowman Hill");
INSERT INTO MsEmployee (EmployeeID, EmployeeName, EmployeeGender, EmployeeAddress)
VALUES ("EM005", "Shanda", "Male", "848 New Castle Center");

SELECT * FROM MsEmployee;

SELECT * FROM MsCustomer WHERE CustomerName LIKE "Dirk Titterel";   