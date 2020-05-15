--Thanakorn Pasangthien 6088109 Section 1
CREATE PROCEDURE proc_UPDATECustomer(
	@id int
	@customerName nvarchar(255)
	@street nvarchar(255)
	@city nvarchar(255)
	@state nvarchar(255)
	@zip nvarchar(255)
	@balance int
	@creditLine int
	@repNum int
) AS
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION;
			UPDATE Customer
			SET
				CustomerName = @customerName
				Street       = @street
				City         = @city
				State        = @state
				Zip          = @zip
				Balance      = @balance
				CreditLine   = @creditLine
				RepNum       = @repNum
			WHERE
				CustomerNum = @id
		COMMIT TRANSACTION;
	END TRY
	
	BEGIN CATCH
		IF @@TRANCOUNT > 0
			ROLLBACK TRANSACTION;
			PRINT 'transaction is rolled back and the update can not be performed.';
	END CATCH
END
 
 
EXEC proc_UPDATECustomer
	@id = 842,
	@customerName = 'ICT',
	@street = 'Rama6',
	@city = 'Phayathai',
	@state = 'BK',
	@zip = '10400',
	@balance = 5000,
	@creditLine = 7000,
	@repNum = 20

SELECT * FROM Customer WHERE CustomerNum = '842'