--Q1 How many parts are in item class HW and price below 100.00?
SELECT COUNT(PartNum) as NumberOfPart from Part where Class = 'HW' and Price < 100
--Q2 How much the total balance of customer and how many customers assigned to each sale representative?
SELECT RepNum,COUNT(CustomerNum) as NumberOfCustomer,SUM(Balance) as TotalBalance FROM Customer GROUP BY RepNum
--Q3 How many customers who has the lowest credit limit?
SELECT COUNT(CustomerNum) as NumberOfCustomer from Customer where CreditLine = (SELECT MIN(CreditLine) from Customer)
--Q4 How many customer have balance higher than the average balance?
SELECT COUNT(CustomerNum) as NumberOfCustomer from Customer where Balance > (SELECT AVG(Balance) from Customer)
--Q5 For the customers who issue more than one order and whose balance is larger than 5000, list the customer numbers, their names and the number of orders.
SELECT Customer.CustomerNum,Customer.CustomerName, COUNT(Orders.OrderNum) as OrderNum  from Customer LEFT JOIN Orders on Customer.CustomerNum = Orders.CustomerNum GROUP BY Customer.CustomerNum,Customer.CustomerName,Customer.Balance HAVING Customer.Balance > 5000 and COUNT(Orders.OrderNum) > 1
