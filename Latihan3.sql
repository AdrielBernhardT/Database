CREATE DATABASE Session3Lab;

USE Session3Lab;

-- Import File

-- Kalau ga urut parameter
INSERT INTO TransactionDetail (TransactionID, ProductID, Quantity) 
VALUES ("TR001", "PR014", 27), ("TR001", "PR010", 2), ("TR005", "PR005", 26), ("TR005", "PR002", 21); 
-- -- Kalau urut parameter
-- INSERT INTO TransactionDetail VALUES ("TR001", "PR014", 27);
-- INSERT INTO TransactionDetail VALUES ("TR001", "PR010", 2);
-- INSERT INTO TransactionDetail VALUES ("TR005", "PR005", 26);
-- INSERT INTO TransactionDetail VALUES ("TR005", "PR002", 21);


INSERT INTO MsProduct (TransactionID, ProductID, ProductName, ProductPrice, ProductStock) 
VALUES ("PR047", "CT004", "Wagyu Saikoro", 12.99, ROUND((RAND()*40)+10, 2));

ALTER TABLE MsCustomer
ADD CustomerPhone VARCHAR(50) NOT NULL;

ALTER TABLE MsCustomer
ADD CONSTRAINT check_phonenumber CHECK (CustomerPhone REGEXP '^[0-9]+$');