--Thanakorn Pasangthien 6088109 Section1

--Lab question 1
SELECT * FROM ( SELECT Orders.OrderNum,Orders.OrderDate,Orders.CustomerNum,COUNT(Orders.OrderNum) AS AmountOrder,SUM(OrderLine.QuotedPrice) AS SumPrice FROM Orders 
JOIN OrderLine ON Orders.OrderNum = OrderLine.OrderNum 
GROUP BY Orders.OrderNum,Orders.OrderDate,Orders.CustomerNum) as Order608 WHERE Order608.CustomerNum = '608'




--Lab question 2
WITH Order608 (OrderNum,OrderDate,CustomerNum,AmountOrder,SumPrice)
AS
(
	SELECT Orders.OrderNum,Orders.OrderDate,Orders.CustomerNum,COUNT(Orders.OrderNum) AS AmountOrder,SUM(OrderLine.QuotedPrice) AS SumPrice FROM Orders 
	JOIN OrderLine ON Orders.OrderNum = OrderLine.OrderNum 
	GROUP BY Orders.OrderNum,Orders.OrderDate,Orders.CustomerNum
)
SELECT * FROM Order608 WHERE Order608.CustomerNum = '608'

--HomeWork

CREATE FUNCTION func_OrderDetail(@CustomerNum INT) RETURN TABLE 
AS
RETURN
(
	SELECT Orders.OrderNum,Orders.OrderDate,Orders.CustomerNum,COUNT(Orders.OrderNum) AS AmountOrder,SUM(OrderLine.QuotedPrice) AS SumPrice FROM Orders 
	JOIN OrderLine ON Orders.OrderNum = OrderLine.OrderNum 
	GROUP BY Orders.OrderNum,Orders.OrderDate,Orders.CustomerNum HAVING Orders.CustomerNum = @CustomerNum

)