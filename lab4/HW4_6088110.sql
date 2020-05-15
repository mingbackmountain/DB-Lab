USE AdventureWorks2014

-- Lab --
-- Q1 --
SELECT  Person.BusinessEntityID, LastName, NationalIDNumber, JobTitle
FROM Person.Person FULL JOIN HumanResources.Employee  ON Person.BusinessEntityID = Employee.BusinessEntityID

-- Q2 --
SELECT FirstName, LastName, CreditCardID
FROM Person.Person RIGHT JOIN Sales.PersonCreditCard ON Person.BusinessEntityID = PersonCreditCard.BusinessEntityID

-- Q3 --
SELECT Product.Name , ProductCategory.Name, ProductSubcategory.ModifiedDate , ProductModel.Name
FROM Production.ProductModel RIGHT JOIN  Production.Product ON ProductModel.ProductModelID = Product.ProductModelID
LEFT JOIN Production.ProductSubcategory ON Product.ProductSubcategoryID = ProductSubcategory.ProductSubcategoryID
LEFT JOIN Production.ProductCategory ON ProductCategory.ProductCategoryID = ProductSubcategory.ProductCategoryID

-- Q4 --
SELECT LastName, LoginID, Department.Name
FROM Person.Person INNER JOIN HumanResources.Employee ON Person.BusinessEntityID = Employee.BusinessEntityID
INNER JOIN HumanResources.EmployeeDepartmentHistory ON EmployeeDepartmentHistory.BusinessEntityID = Employee.BusinessEntityID
INNER JOIN HumanResources.Department ON Department.DepartmentID = EmployeeDepartmentHistory.DepartmentID

-- Q5 -- 
SELECT CONCAT(Person.FirstName, Person.MiddleName, ' ', Person.LastName)  Name
FROM Person.Person INNER JOIN HumanResources.Employee ON Person.BusinessEntityID = Employee.BusinessEntityID
WHERE Employee.NationalIDNumber = '112457891'

-- Homework -- 
SELECT Product.ProductID, Name, SpecialOffer.SpecialOfferID
FROM Production.Product LEFT JOIN Sales.SpecialOfferProduct ON Product.ProductID = SpecialOfferProduct.ProductID 
LEFT JOIN Sales.SpecialOffer ON SpecialOfferProduct.SpecialOfferID = SpecialOffer.SpecialOfferID 
WHERE SpecialOffer.SpecialOfferID IS NULL OR SpecialOffer.DiscountPct IS NULL