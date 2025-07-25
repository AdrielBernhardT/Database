CREATE DATABASE hehe_groceries;

USE hehe_groceries;

-- Tabel MsCustomer
CREATE TABLE MsCustomer (
    CustomerID CHAR(5) PRIMARY KEY CHECK (
        CustomerID REGEXP '^CU[0-9]{3}$'
    ),
    CustomerName VARCHAR(50) NOT NULL,
    CustomerGender VARCHAR(10) NOT NULL,
    CustomerAddress VARCHAR(50) NOT NULL,
    CustomerEmail VARCHAR(50) NOT NULL,
    CustomerDOB DATE NOT NULL
);

-- Tabel MsEmployee
CREATE TABLE MsEmployee (
    EmployeeID CHAR(5) PRIMARY KEY CHECK (
        EmployeeID REGEXP '^EM[0-9]{3}$'
    ),
    EmployeeName VARCHAR(50) NOT NULL,
    EmployeeGender VARCHAR(10) NOT NULL,
    EmployeeAddress VARCHAR(50) NOT NULL
);

-- Tabel MsCategory
CREATE TABLE MsCategory (
    CategoryID CHAR(5) PRIMARY KEY CHECK (
        CategoryID REGEXP '^CT[0-9]{3}$'
    ),
    CategoryName VARCHAR(50) NOT NULL
);

-- Tabel MsProduct
CREATE TABLE MsProduct (
    ProductID CHAR(5) PRIMARY KEY CHECK (
        ProductID REGEXP '^PR[0-9]{3}$'
    ),
    CategoryID CHAR(5),
    ProductName VARCHAR(50) NOT NULL,
    ProductPrice INT NOT NULL,
    FOREIGN KEY (CategoryID) REFERENCES MsCategory(CategoryID)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

-- Tabel TransactionHeader
CREATE TABLE TransactionHeader (
    TransactionID CHAR(5) PRIMARY KEY CHECK (
        TransactionID REGEXP '^TR[0-9]{3}$'
    ),
    EmployeeID CHAR(5),
    CustomerID CHAR(5),
    TransactionDate DATE NOT NULL,
    FOREIGN KEY (EmployeeID) REFERENCES MsEmployee(EmployeeID)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    FOREIGN KEY (CustomerID) REFERENCES MsCustomer(CustomerID)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

-- Tabel TransactionDetail
CREATE TABLE TransactionDetail (
    TransactionID CHAR(5),
    ProductID CHAR(5), 
    Quantity INT NOT NULL CHECK (Quantity > 0),
    FOREIGN KEY (TransactionID) REFERENCES TransactionHeader(TransactionID)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    FOREIGN KEY (ProductID) REFERENCES MsProduct(ProductID)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

-- Tabel MsBrand
CREATE TABLE MsBrand (
    BrandID CHAR(5) PRIMARY KEY CHECK (
        BrandID REGEXP '^BR[0-9]{3}$'
    ),
    BrandName VARCHAR(50) NOT NULL
);

-- Drop table MsBrand (jika tidak dibutuhkan)
DROP TABLE MsBrand;

-- Insert ke MsCustomer
INSERT INTO MsCustomer (
    CustomerID, 
    CustomerName, 
    CustomerGender, 
    CustomerAddress, 
    CustomerEmail, 
    CustomerDOB
) VALUES (
    "CU001", 
    "Dirk Titterel", 
    "Male", 
    "74 Melvin Point", 
    "Dtitterel0@yellowpages.com", 
    "2003-10-29"
);

-- Insert ke MsEmployee
INSERT INTO MsEmployee (
    EmployeeID, 
    EmployeeName, 
    EmployeeGender, 
    EmployeeAddress
) VALUES 
    ("EM001", "Clem", "Male", "0975 Forest Dale Trail"),
    ("EM002", "Dene", "Male", "2 Grayhawk Parkway"),
    ("EM003", "Lethia", "Female", "905 Goodland Lane"),
    ("EM004", "Tyrone", "Male", "51745 Bowman Hill"),
    ("EM005", "Shanda", "Male", "848 New Castle Center");

-- Query data MsEmployee
SELECT * FROM MsEmployee;

-- Query customer dengan nama tertentu
SELECT * FROM MsCustomer 
WHERE CustomerName LIKE "Dirk Titterel";