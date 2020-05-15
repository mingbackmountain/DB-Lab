--Thanakorn Pasagnthien 6088109
CREATE PROCEDURE proc_InsertOrder
	@amount int,
	@part nvarchar(10),
	@customerNum int
AS
BEGIN
	DECLARE @orderNum int;
	DECLARE @date DATE;
	DECLARE @pricePart INT;
	SET @date = getdate();
	SET @orderNum = (SELECT MAX(OrderNum) + 1 FROM Orders);
	SET @pricePart = (SELECT Price FROM Part WHERE PartNum = @part) * @amount
	
	INSERT INTO Orders (OrderNum,OrderDate,CustomerNum) VALUES (@orderNum,@date,@customerNum)
	
	INSERT INTO OrderLine (OrderNum,PartNum,NumOrdered,QuotedPrice) VALUES (@orderNum,@part,@amount,@pricePart)
END

SELECT * FROM Orders
SELECT * FROM OrderLine

EXEC proc_InsertOrder 
	@amount = 2,
	@part = 'DR93',
	@customerNum = '608'

SELECT * FROM Orders
SELECT * FROM OrderLine


