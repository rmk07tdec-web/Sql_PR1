
CREATE DATABASE Data_Digger;

USE Data_Digger;

CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(100),
    Email VARCHAR(100),
    Address VARCHAR(200)
);
show tables;
-- Insert 5 Customers
INSERT INTO Customers (Name, Email, Address)
VALUES
('Alice', 'alice@gmail.com', 'Surat'),
('Jay', 'jay@gmail.com', 'Ahmedabad'),
('Rahul', 'rahul@gmail.com', 'Vadodara'),
('Priya', 'priya@gmail.com', 'Rajkot'),
('Parth', 'parth@gmail.com', 'Navsari');

-- Retrieve All Customers
SELECT * FROM Customers;
drop table Customers;
-- Update Customer Address
UPDATE Customers
SET Address = 'Mumbai'
WHERE CustomerID = 1;

-- Delete Customer
DELETE FROM Customers
WHERE CustomerID = 5;

-- Display Alice
SELECT * FROM Customers
WHERE Name = 'Alice';



CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    OrderDate DATE,
    TotalAmount DECIMAL(10,2)
);


INSERT INTO Orders (OrderID, CustomerID, OrderDate, TotalAmount)
VALUES
(101, 1, '2026-10-01', 2500.00),
(102, 2, '2026-10-05', 1500.00),
(103, 1, '2026-10-10', 3500.00),
(104, 3, '2026-10-15', 5000.00),
(105, 2, '2026-10-20', 2000.00);

SELECT * FROM Orders
WHERE CustomerID = 1;

UPDATE Orders
SET TotalAmount = 4000.00
WHERE OrderID = 101;

DELETE FROM Orders
WHERE OrderID = 105;

SELECT * FROM Orders
WHERE OrderDate >= CURDATE() - INTERVAL 30 DAY
AND OrderDate <= CURDATE();

SELECT
MAX(TotalAmount) AS Highest_Amount,
MIN(TotalAmount) AS Lowest_Amount,
AVG(TotalAmount) AS Average_Amount
FROM Orders;






CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(100),
    Price DECIMAL(10,2),
    Stock INT
);

INSERT INTO Products VALUES
(1, 'Laptop', 45000, 10),
(2, 'Mobile', 15000, 20),
(3, 'Keyboard', 800, 30),
(4, 'Mouse', 500, 0),
(5, 'Monitor', 12000, 15);

SELECT * FROM Products
ORDER BY Price DESC;

UPDATE Products
SET Price = 50000
WHERE ProductID = 1;

DELETE FROM Products
WHERE Stock = 0;

SELECT * FROM Products
WHERE Price BETWEEN 500 AND 2000;

SELECT
MAX(Price) AS Highest_Price,
MIN(Price) AS Lowest_Price
FROM Products;





CREATE TABLE OrderDetails (
    OrderDetailID INT PRIMARY KEY,
    OrderID INT,
    ProductID INT,
    Quantity INT,
    SubTotal DECIMAL(10,2),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

INSERT INTO OrderDetails VALUES
(1, 1, 1, 2, 90000),
(2, 2, 2, 3, 45000),
(3, 3, 3, 5, 4000),
(4, 4, 4, 2, 1000),
(5, 5, 5, 1, 12000);

SELECT * FROM OrderDetails
WHERE OrderID = 1;

SELECT SUM(SubTotal) AS Total_Revenue
FROM OrderDetails;

SELECT
ProductID,
SUM(Quantity) AS Total_Quantity
FROM OrderDetails
GROUP BY ProductID
ORDER BY Total_Quantity DESC
LIMIT 3;

SELECT
ProductID,
COUNT(*) AS Total_Times_Sold
FROM OrderDetails
WHERE ProductID = 1
GROUP BY ProductID;



