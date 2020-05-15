--DB LAB

--Q1 Write a query that returns OrderNum and Customer’s name. (Using both APPLY and JOIN operator)

SELECT Customer.CustomerName, Orders.OrderNum FROM Customer INNER JOIN Orders On Orders.CustomerNum = Customer.CustomerNum

SELECT Customer.CustomerName, o.OrderNum FROM Customer CROSS APPLY(SELECT * FROM Orders WHERE Customer.CustomerNum = Orders.CustomerNum) as o

--Q2 Write a query to select all customer information with OrderNum. (Using both APPLY and JOIN operator)
SELECT *, Orders.OrderNum FROM Customer LEFT JOIN Orders on Customer.CustomerNum = Orders.CustomerNum

SELECT *, o.OrderNum FROM Customer OUTER APPLY(SELECT * FROM Orders WHERE Customer.CustomerNum = Orders.CustomerNum) as o

--Q3 List all Order Number of the CustomerNumber greater than 400 that appear in OrderLine (except the Order Number 21617 ) using SET Operation
SELECT OrderNum FROM Orders WHERE CustomerNum > 400 EXCEPT SELECT OrderNum FROM OrderLine WHERE OrderNum = 21617

--DB Homework

--Q1 Write a query to show SlipID that does not request for service.
SELECT SlipID FROM MarinaSlip EXCEPT SELECT SlipID FROM ServiceRequest

--Q2 Write a query to display Distinct Status using SET operation WHERE Status is not "Open“.
SELECT DISTINCT Status FROM ServiceRequest EXCEPT SELECT DISTINCT Status FROM ServiceRequest WHERE Status = 'Open'

--Q3 List all distinct City and State of Owner using SET operation in Descending Order.
SELECT DISTINCT City,State FROM Owner INTERSECT SELECT DISTINCT City,State FROM Owner ORDER BY City,State DESC

--Q4 For each Owner and Marina, list all City using SET operation in Ascending Order.
SELECT City FROM Owner UNION SELECT City FROM Marina ORDER BY City ASC

--Q6 For each Owner, get additional column with SlipID and BoatType using APPLY operator
SELECT *, T.SlipID, T.BoatType FROM Owner CROSS APPLY ( SELECT SlipID, BoatType FROM MarinaSlip WHERE Owner.OwnerNum = MarinaSlip.OwnerNum) AS T

--Q7 For each Marina, get Name of Marina and Max rental fee 
SELECT Marina.Name, MAX(RentalFee) FROM MarinaSlip JOIN Marina On MarinaSlip.MarinaNum = Marina.MarinaNum GROUP BY Name

--Q8 For every Slip, list the marina number, slip number, boat name, owner number, owner’s first name, and owner’s last name.
SELECT SlipNum, MarinaNum, BoatName, T.OwnerNum, T.FirstName, T.LastName FROM MarinaSlip OUTER APPLY (SELECT OwnerNum, FirstName, LastName FROM Owner WHERE Owner.OwnerNum = MarinaSlip.OwnerNum) AS T 