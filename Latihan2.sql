CREATE DATABASE Session2Lab;

USE Session2Lab;

-- IMPORT FILE

SELECT * FROM mscategory WHERE CategoryName LIKE '%a%';

SELECT CONCAT('Mr.', CustomerName) as CustomerName, CustomerGender, CustomerAddress FROM mscustomer WHERE CustomerGender LIKE 'Male';

SELECT REPLACE(TransactionID, 'TR', 'Transaction ') as 'Transaction Number', CustomerID, TransactionDate FROM transactionheader WHERE TransactionDate BETWEEN DATE_SUB('2023-01-31', interval 31 year) AND '2023-01-31';

SELECT ProductName, CONCAT('Price: $', ROUND(ProductPrice*1/2, 2), ' just for today!') FROM msproduct WHERE ProductName LIKE '% Cheese';

SELECT CustomerName, RIGHT(CustomerAddress, POSITION(' ' in REVERSE(CustomerAddress)) - 1) as AddressType FROM mscustomer WHERE CustomerGender LIKE 'Female';

SELECT 
TransactionID, 
DAYNAME(TransactionDate) as Day,
UPPER(CustomerName) as CustomerName,
INSERT(
    CustomerEmail,
    POSITION('@' in CustomerEmail),
    length(CustomerEmail)-POSITION('@' in CustomerEmail) + 1,
    'gmail.com'
) as Email
FROM transactionheader JOIN mscustomer on transactionheader.CustomerID = mscustomer.CustomerID
WHERE MONTH(TransactionDate) = 11 AND LENGTH(CustomerName) < 12;

SELECT 
distinct ransactionID,
GROUP_CONCAT(distinct ProductName order by ProductName asc separator ', ') as ProductBought, 
DATE_FORMAT(TransactionDate, '%e %M %Y') as TransactionDate

FROM transactiondetail 
JOIN msproduct on transactiondetail.ProductID=msproduct.ProductID
JOIN transactionheader on transactiondetail.TransactionID=transactionheader.TransactionID
WHERE MONTH(transactionheader.TransactionDate)=8 GROUP BY transactiondetail.TransactionID;
