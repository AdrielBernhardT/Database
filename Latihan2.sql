CREATE DATABASE Session2Lab;

USE Session2Lab;

-- IMPORT FILE

SELECT *
FROM mscategory
WHERE CategoryName LIKE '%a%';

SELECT 
    CONCAT('Mr.', CustomerName) AS CustomerName,
    CustomerGender,
    CustomerAddress
FROM mscustomer
WHERE CustomerGender LIKE 'Male';

SELECT 
    REPLACE(TransactionID, 'TR', 'Transaction ') AS 'Transaction Number',
    CustomerID,
    TransactionDate
FROM transactionheader
WHERE TransactionDate BETWEEN DATE_SUB('2023-01-31', INTERVAL 31 YEAR) AND '2023-01-31';

SELECT 
    ProductName,
    CONCAT('Price: $', ROUND(ProductPrice * 1/2, 2), ' just for today!') AS SpecialPrice
FROM msproduct
WHERE ProductName LIKE '% Cheese';

SELECT 
    CustomerName,
    RIGHT(CustomerAddress, POSITION(' ' IN REVERSE(CustomerAddress)) - 1) AS AddressType
FROM mscustomer
WHERE CustomerGender LIKE 'Female';

SELECT 
    TransactionID,
    DAYNAME(TransactionDate) AS Day,
    UPPER(CustomerName) AS CustomerName,
    INSERT(
        CustomerEmail,
        POSITION('@' IN CustomerEmail),
        LENGTH(CustomerEmail) - POSITION('@' IN CustomerEmail) + 1,
        'gmail.com'
    ) AS Email
FROM transactionheader
JOIN mscustomer ON transactionheader.CustomerID = mscustomer.CustomerID
WHERE MONTH(TransactionDate) = 11
  AND LENGTH(CustomerName) < 12;

SELECT 
    DISTINCT transactiondetail.TransactionID,
    GROUP_CONCAT(DISTINCT ProductName ORDER BY ProductName ASC SEPARATOR ', ') AS ProductBought,
    DATE_FORMAT(TransactionDate, '%e %M %Y') AS TransactionDate
FROM transactiondetail
JOIN msproduct ON transactiondetail.ProductID = msproduct.ProductID
JOIN transactionheader ON transactiondetail.TransactionID = transactionheader.TransactionID
WHERE MONTH(transactionheader.TransactionDate) = 8
GROUP BY transactiondetail.TransactionID;