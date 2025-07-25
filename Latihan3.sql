CREATE DATABASE Session3Lab;

USE Session3Lab;

-- Import File

INSERT INTO transactiondetail (
    TransactionID, 
    ProductID, 
    Quantity
) VALUES 
    ("TR001", "PR014", 27), 
    ("TR001", "PR010", 2), 
    ("TR005", "PR005", 26), 
    ("TR005", "PR002", 21);

INSERT INTO msproduct (
    ProductID, 
    CategoryID, 
    ProductName, 
    ProductPrice, 
    ProductStock
) VALUES (
    "PR047", 
    "CT004", 
    "Wagyu Saikoro", 
    12.99, 
    ROUND((RAND() * 40) + 10, 2)
);

ALTER TABLE mscustomer
ADD CustomerPhone VARCHAR(50) NOT NULL;

ALTER TABLE mscustomer
ADD CONSTRAINT check_phonenumber 
CHECK (
    CustomerPhone REGEXP '^[0-9]*$'
);

DELETE FROM transactionheader 
WHERE 
    TransactionID = 'TR001' OR 
    TransactionID = 'TR003' OR 
    TransactionID = 'TR005';

UPDATE msproduct 
SET 
    ProductPrice = ProductPrice - 2
WHERE 
    ProductPrice > 10;

UPDATE mscustomer 
SET 
    CustomerName = CONCAT('Mrs.', CustomerName),
    CustomerEmail = INSERT(
        CustomerEmail,
        LOCATE('@', CustomerEmail),
        0,
        'lady'
    )
WHERE 
    CustomerGender = 'Female' AND 
    TIMESTAMPDIFF(YEAR, CustomerDOB, CURDATE()) > 20;

SELECT 
    ProductID, 
    ProductName, 
    CONCAT('$', ProductPrice) as ProductPrice, 
    CategoryName
FROM msproduct
JOIN mscategory ON msproduct.CategoryID = mscategory.CategoryID 
WHERE 
    CategoryName = 'Dairy' OR
    CategoryName = 'Meat';

SELECT DISTINCT 
    EmployeeName,
    EmployeeAddress
FROM transactionheader
JOIN msemployee ON transactionheader.EmployeeID = msemployee.EmployeeID
JOIN mscustomer ON transactionheader.CustomerID = mscustomer.CustomerID
WHERE 
    mscustomer.CustomerGender = 'Female'
    AND MONTH(transactionheader.TransactionDate) = 12;
