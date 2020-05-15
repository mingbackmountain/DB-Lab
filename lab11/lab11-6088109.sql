--Thanakorn Pasangthien 6088109 Section1

--Q1. Write Q5: a query which is semantically equivalent to Q4 but does not use View

SELECT PartNum,Description,OnHand,Price FROM Part WHERE Class = 'HW' AND OnHand < 25;

--Q2. Write Q9: a query which is semantically equivalent to Q8 but does not use View

SELECT Rep.RepNum as SNum, LastName as SLast, FirstName as SFirst FROM Rep,Customer WHERE Rep.RepNum = Customer.RepNum AND CustomerNum = '282'