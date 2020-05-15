--Thanakorn Pasangthien 6088109
--Q1
SELECT OwnerNum,LastName,FirstName FROM Owner 
--Q2
SELECT * FROM Marina
--Q3
SELECT LastName,FirstName FROM Owner WHERE City = 'Bowton'
--Q4
SELECT LastName,FirstName FROM Owner WHERE City != 'Bowton'
--Q5
SELECT MarinaNum,SlipNum FROM MarinaSlip WHERE Length <= 30
--Q6
SELECT MarinaNum,SlipNum FROM MarinaSlip WHERE BoatType = 'Dolphin 28'
--Q7
SELECT SlipNum FROM MarinaSlip WHERE BoatType = 'Dolphin 28'AND MarinaNum = 1
--Q8
SELECT BoatName FROM MarinaSlip WHERE Length >= 25 AND LENGTH <= 30
--Q9
SELECT SlipNum FROM MarinaSlip WHERE MarinaNum = 1 AND RentalFee < 3000
--Q10
SELECT SlipID,CategoryNum,EstHours,EstLaborCost=(EstHours * 60) FROM ServiceRequest
--Q11
SELECT MarinaNum,SlipNum FROM MarinaSlip WHERE BoatType IN ('Sprite 4000','Sprite 3000',' Ray 4025')
--Q12
SELECT MarinaNum,SlipNum,BoatName FROM MarinaSlip ORDER BY BoatName
--Q13
SELECT MarinaNum,BoatNum = COUNT(BoatType) FROM MarinaSlip WHERE BoatType = 'Dolphin 25' GROUP BY MarinaNum
--Q14
SELECT SUM(RentalFee) FROM MarinaSlip
--Q15
SELECT MarinaSlip.MarinaNum,MarinaSlip.SlipNum,MarinaSlip.BoatName,Owner.OwnerNum,Owner.FirstName,Owner.LastName FROM MarinaSlip JOIN OWNER ON MarinaSlip.OwnerNum = Owner.OwnerNum
--Q16
SELECT MarinaSlip.SlipID,ServiceRequest.SlipID,ServiceRequest.Description,ServiceRequest.Status FROM MarinaSlip JOIN ServiceRequest ON MarinaSlip.SlipID = ServiceRequest.SlipID WHERE CategoryNum = 1
--Q17
SELECT MarinaSlip.SlipID,MarinaSlip.MarinaNum,MarinaSlip.SlipNum,ServiceRequest.EstHours,ServiceRequest.SpentHours,Owner.OwnerNum,Owner.LastName FROM MarinaSlip JOIN ServiceRequest ON MarinaSlip.SlipID = ServiceRequest.SlipID JOIN Owner ON MarinaSlip.OwnerNum = Owner.OwnerNum WHERE CategoryNum = 1