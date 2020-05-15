--Thanakorn Pasangthien 6088109

--Create Rep Table
CREATE TABLE Rep
(
	RepNum CHAR(2) NOT NULL PRIMARY KEY,
	LastName CHAR(15),
	FirstName CHAR(15),
	Street CHAR(15),
	City CHAR(15),
	States CHAR(2),
	Zip CHAR(5),
	Commission DECIMAL(7,2),
	Rate DECIMAL(3,2) 
);


--Create Customer Table
CREATE TABLE Customer
(
	CustomerNum CHAR(3) NOT NULL PRIMARY KEY,
	CustomerName CHAR(35) NOT NULL,
	Street CHAR(15),
	City CHAR(15),
	States CHAR(2),
	Zip CHAR(5),
	Balance DECIMAL(8,2),
	CreditLimit DECIMAL(8,2),
	Repnum CHAR(2) FOREIGN KEY REFERENCES Rep(Repnum) 
);


--Insert Rep Table
INSERT INTO Rep
VALUES 
('20','Kaiser','Valerie','624 Randall','Grove','FL','33321',20542.50,0.05),
('35','Hull','Richard','532 Jackson','Sheldon','FL','33553',39216.00,0.07),
('65','Perez','Juan','1626 Taylor','Fillmore','FL','33336',23487.00,0.05);

--Insert Customer Table
INSERT INTO Customer
VALUES
('148','Al''s Appliance and Sport','2837 Greenway','Fillmore','FL','33336',6550.00,7500.00,'20'),
('282','Brookings Direct','3827 Devon','Grove','FL','33321',431.50,10000.00,'35'),
('356','Ferguson''s','382 Wildwood','Northfield','FL','33146',5785.00,7500.00,'65'),
('408','The Everything Shop','1828 Raven','Crystal','FL','33503',5285.25,5000.00,'35'),
('462','Bargains Galore','3829 Central','Grove','FL','33321',3412.00,10000.00,'65'),
('524','Kline''s','838 Ridgeland','Fillmore','FL','33336',12762.00,15000.00,'20'),
('608','Johnson''s Department Store','372 Oxford','Sheldon','FL','33553',2106.00,10000.00,'65'),
('687','Lee''s Sport and Appliance','282 Evergreen','Altonville','FL','32543',2851.00,5000.00,'35'),
('725','Deerfield''s Four Seasons','282 Columbia','Sheldon','FL','33553',248.00,7500.00,'35'),
('842','All Season','28 Lakeview','Grove','FL','33321',8221.00,7500.00,'20');

--Create Orders Table
CREATE TABLE Orders
(
	OrderNum int NOT NULL Primary key,
	OrderDate date NOT NULL,
	CustomerNum CHAR(3) FOREIGN KEY REFERENCES Customer(CustomerNum)
);

--Insert Orders Table
INSERT INTO Orders
VALUES
(21608,'10/20/2010','148'),
(21610,'10/20/2010','356'),
(21613,'10/21/2010','408'),
(21614,'10/21/2010','282'),
(21617,'10/23/2010','608'),
(21619,'10/23/2010','148'),
(21623,'10/23/2010','608');


--Create Part Table
CREATE TABLE Part
(
	PartNum CHAR(4) NOT NULL Primary key,
	Descriptions CHAR(15),
	OnHand DECIMAL(4,0) NOT NULL,
	Class CHAR(2),
	Warehouse CHAR(1),
	Price float
);

--Insert Part Table
INSERT INTO Part
VALUES
('AT94','Iron',50,'HW','3',24.95),
('BV06','Home Gym',45,'SG','2',794.95),
('CD52','Microwave Oven',32,'AP','1',165.00),
('DL71','Cordless Drill',21,'HW','3',129.95),
('DR93','Gas Range',8,'AP','2',495.00),
('DW11','Washer',12,'AP','3',399.99),
('FD21','Stand Mixer',22,'HW','3',159.95),
('KL62','Dryer',12,'AP','1',349.95),
('KT03','Dishwasher',8,'AP','3',595.00),
('KV29','Treadmill',9,'SG','2',1390.00);

--Create OrderLine Table
CREATE TABLE OrderLine
(
	OrderNum int FOREIGN KEY REFERENCES Orders(OrderNum),
	PartNum CHAR(4) FOREIGN KEY REFERENCES Part(PartNum),
	NumOrdered int,
	QuotaPrice float
);


--Insert OrderLine Table
INSERT INTO OrderLine
VALUES
(21608,'AT94',11,21.95),
(21610,'DR93',1,495.00),
(21610,'DW11',1,399.99),
(21613,'KL62',4,329.95),
(21614,'KT03',2,595.00),
(21617,'BV06',2,794.95),
(21617,'CD52',4,150.00),
(21619,'DR93',1,495.00),
(21623,'KV29',2,1290.00);

--Create CurrentOrders Table
CREATE TABLE CurrentOrders
(
	CustomerName CHAR(35) NOT NULL,
	OrderNum int FOREIGN KEY REFERENCES Orders(OrderNum),
	PartNum CHAR(4) FOREIGN KEY REFERENCES Part(PartNum),
	Descriptions CHAR(15),
	NumOrdered int,
	QuotedPrice int,
	Warehouse CHAR(1),
	Repnum CHAR(2) FOREIGN KEY REFERENCES Rep(Repnum) 
);

