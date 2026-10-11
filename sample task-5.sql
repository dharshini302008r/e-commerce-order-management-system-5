
CREATE DATABASE PaymentDB;
USE PaymentDB;

CREATE TABLE Orders (
    Order_ID INT PRIMARY KEY,
    Customer_Name VARCHAR(100) NOT NULL
);

CREATE TABLE Payment (
    Payment_ID INT PRIMARY KEY,
    Order_ID INT UNIQUE,
    Payment_Mode VARCHAR(30) NOT NULL,
    Transaction_Amount DECIMAL(10,2),
    Payment_Status VARCHAR(20) NOT NULL,
    FOREIGN KEY (Order_ID) REFERENCES Orders(Order_ID),
    CHECK (Transaction_Amount > 0)
);

INSERT INTO Orders VALUES
(101, 'Arun'),
(102, 'Priya'),
(103, 'Kumar'),
(104, 'Divya'),
(105, 'Ravi');

INSERT INTO Payment VALUES
(1, 101, 'UPI', 1500.00, 'Success'),
(2, 102, 'Credit Card', 2500.00, 'Failed'),
(3, 103, 'Debit Card', 1800.00, 'Success'),
(4, 104, 'Net Banking', 3200.00, 'Pending'),
(5, 105, 'Cash on Delivery', 900.00, 'Success');

SELECT * FROM Payment;

SELECT * FROM Payment
WHERE Payment_Status = 'Success';

SELECT * FROM Payment
WHERE Payment_Status = 'Failed';

SELECT Payment_Status, COUNT(*) AS Total
FROM Payment
GROUP BY Payment_Status;

UPDATE Payment
SET Payment_Status = 'Success'
WHERE Payment_ID = 2;

SELECT * FROM Payment;

SELECT COUNT(*) AS UPI_Count
FROM Payment
WHERE Payment_Mode = 'UPI';

SELECT Payment_Mode, COUNT(*) AS Total
FROM Payment
GROUP BY Payment_Mode
ORDER BY Total DESC
LIMIT 1;

SELECT SUM(Transaction_Amount) AS Total_Revenue
FROM Payment
WHERE Payment_Status = 'Success';



SELECT Payment_Mode,
SUM(Transaction_Amount) AS Revenue
FROM Payment
WHERE Payment_Status = 'Success'
GROUP BY Payment_Mode;


SELECT AVG(Transaction_Amount) AS Average_Amount
FROM Payment;

SELECT
    O.Customer_Name,
    P.Order_ID,
    P.Payment_Mode,
    P.Transaction_Amount,
    P.Payment_Status
FROM Orders O
JOIN Payment P
ON O.Order_ID = P.Order_ID;

