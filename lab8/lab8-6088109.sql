--Exercise

--Q1 Find all parts with a price greater than or equal to average parts price.
SELECT * FROM Part WHERE Price > (SELECT AVG(Price) FROM Part)
--Q2 Write a query to find the names of all customer who made an order before '2010-10-22'.
SELECT Customer.CustomerName FROM Customer WHERE CustomerNum IN (SELECT CustomerNum FROM Orders WHERE OrderDate < '2010-10-22')
--Q3 Write a query to find the names of the customer who were contacted by Valerie Kaiser.
SELECT Customer.CustomerName FROM Customer WHERE RepNum IN (SELECT RepNum FROM Rep WHERE FirstName = 'Valerie' AND LastName = 'Kaiser')
--Q4 Write a query to find the names and the balance of the customer who have a higher balance than the customer whose Name = Brookings Direct􏰅􏰆.
SELECT Customer.CustomerName,Customer.Balance FROM Customer WHERE Balance > (SELECT Balance FROM Customer WHERE CustomerName = 'Brookings Direct')

 
--HomeWork
 
--Q1 Write a query to find name of the customers who have ordered part and live in the Fillmore.
SELECT Customer.CustomerName FROM Customer WHERE City = 'Fillmore' AND CustomerNum IN (SELECT CustomerNum FROM Orders)
--Q2 Write a query to find name, balance, and credit limit of the customers who credit limit is greater than the average credit limit.
SELECT Customer.CustomerName,Customer.Balance,Customer.CreditLine FROM Customer WHERE CreditLine > (SELECT AVG(CreditLine) FROM Customer)
--Q3 Write a query to find the names, the balance of the customers who have balance more than customer name Ferguson's.
SELECT Customer.CustomerName, Customer.Balance FROM Customer WHERE Balance > (SELECT Balance FROM Customer WHERE CustomerName = 'Ferguson''s')
--Q4 Lists all the customers who order the Home Gym and Microwave Oven.
SELECT * FROM Customer WHERE Customer.CustomerName IN (SELECT CustomerName FROM CurrentOrders WHERE Description = 'Home Gym' INTERSECT SELECT CustomerName FROM CurrentOrders WHERE Description = 'Microwave Oven')
--Q5 Write a query to find the part number and description where price are higher than the average quoted price.
SELECT Part.PartNum, Part.Description FROM Part WHERE Price > (SELECT AVG(QuotedPrice) FROM OrderLine)