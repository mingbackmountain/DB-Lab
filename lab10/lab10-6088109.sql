--1. Write a query to create table Q1 with the following fields userId uniqueidentifier, firstName nvarchar(20), lastName nvarchar(20).
CREATE TABLE Q1 (
	userId uniqueidentifier,
	firstName nvarchar(20),
	lastName nvarchar(20),
) 
--2. Write two queries to insert you and your friend data into table Q1 with a random generate on userId.
DECLARE @id uniqueidentifier
SET @id = newid()
INSERT INTO Q1(userId,firstName,lastName) 
VALUES (newid(),'Thanakorn','Pasangthien'),
	   (newid(),'Paweennat','Foitong')
--3. From Q1, can you select name, lastname and present these data in one column with a single space between them as well as count total characters of your name and lastname.
SELECT Concat(firstName,'',lastName) AS name, (LEN(firstName)+LEN(lastName)) as numchar FROM Q1
--4.Write a query to create table Q2 with the following fields Uname nvarchar(32), Upass nvarchar(64).
CREATE TABLE Q2 (
	Uname nvarchar(32),
	Upass BINARY(64),
) 
--5. Write a query to insert your username e.g., u5988xxx and password ‘123456’ data into table Q2. To insert into a password field, you need to encode it first using HASHBYTES function with MD5 encoding format.
DECLARE @Upass BINARY(64)
SET @Upass = HASHBYTES('MD5','123456')
INSERT INTO Q2 (Uname,Upass) VALUES
('u6088109',@Upass)

--Homework


--6. Write a query to create table Q3 with based on the following fields Uid uniqueidentifier, Fname nvarchar(20), LoginDate date, LoginTime time, LogoutTime time.
CREATE TABLE Q3 (
	Uid uniqueidentifier,
	Fname nvarchar(20),
	LoginDate date,
	LoginTime time,
	LogoutTiime time,
) 
--7. Write a query to insert Uid, yourname, LoginDate, and LoginTime into table Q4 (Using current date and time).
DECLARE @id uniqueidentifier
SET @id = newid()
INSERT INTO Q3 (Uid,Fname,LoginDate,LoginTime,LogoutTiime) VALUES 
(newid(),'Thanakorn',getdate(),CONVERT(time, CURRENT_TIMESTAMP),CONVERT(time, CURRENT_TIMESTAMP))
--8. Write a query to update LogoutTime (Using current date and time), where Fname = yourname in table Q4.
UPDATE Q3
SET Fname = 'Thanakorn', LogoutTime=CONVERT(time, CURRENT_TIMESTAMP)

--9. Write a query to retrieve Fname, LoginTime, and LogoutTime (showing time in hh:mm:ss format)
SELECT Fname,left(LoginTime, len(LoginTime)- 8) as LoginTime,left(LogoutTime,len(LogoutTime) - 8 ) as LogoutTime FROM Q3

-- 10. Write a query to get Fname, LoginDate, and Online time. Where
	--– LoginDate is presented in dd-Month-yyyy format (Month is a full month name e.g., 03 = March).
	–-- Online time is calculated from LogoutTime – LoginTime (only different in minutes is considered)
SELECT Fname,Format(LoginDate,'dd-MMMM-yyyy'),DateDiff(MINUTE,LoginTime,LogoutTime) as onlineTime FROM Q3