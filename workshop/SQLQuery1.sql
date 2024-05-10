SELECT *
FROM Categories


-- Create list of product in Product ID,NAME,Price 

SELECT ProductID, ProductName, UnitPrice
FROM Products WHERE UnitPrice > 50


-- CREATE the list of products Product ID,NAME,CategoriID,Unit price for products in catgory 3

SELECT ProductID, ProductName, CategoryID, UnitPrice
FROM Products WHERE CategoryID = 3


-- CREATE the list of products Product ID,NAME,CategoriID,Unit price for products in catgory 3 AND cAT 7

SELECT ProductID, ProductName, CategoryID, UnitPrice
FROM Products WHERE CategoryID = 3 OR CategoryID = 7

-- create list of products as ID,name and Price for all products between 20 to 30

SELECT P.ProductID, P.ProductName, P.CategoryID, P.UnitPrice
FROM Products AS P 
WHERE P.UnitPrice <= 30 AND P.UnitPrice >= 20
ORDER BY P.UnitPrice ASC

-- bETWEEN kEYWORD

SELECT P.ProductID, P.ProductName, P.CategoryID, P.UnitPrice
FROM Products AS P 
WHERE P.UnitPrice NOT BETWEEN 20 AND 80
ORDER BY P.UnitPrice ASC


-- LIST OF EMPLOYWW AS ID,NAME,CITY FOR ALL EMPLOYEES FROM LONDON AND


SELECT E.EmployeeID,	E.FirstName + ' ' + E.LastName AS Full_Name, E.City
FROM Employees AS E
WHERE E.City = 'London' OR E.City = 'Richmond'

-- DIFERENT TYPE OF GIVING NAME TO NEW COL

SELECT E.EmployeeID,	E.FirstName + ' ' + E.LastName AS 'Full Name', E.City
FROM Employees AS E
WHERE E.City = 'London' OR E.City = 'Richmond'


SELECT E.EmployeeID,	E.FirstName + ' ' + E.LastName AS [Full Name], E.City
FROM Employees AS E
WHERE E.City = 'London' OR E.City = 'Richmond'


-- MULTIPLE OR CONDITION ON SAME COLUMN USE IN FUNCTION
SELECT E.EmployeeID,	E.FirstName + ' ' + E.LastName AS Full_Name, E.City
FROM Employees AS E
WHERE E.City NOT IN ('London','Richmond')


--List all city names of Employees

SELECT DISTINCT E.City 
FROM Employees AS E


-- List of oerder as OrderID, Date,	Customer ID,Employee ID, for orders raised on 4th july 1997

SELECT O.OrderID, O.EmployeeID, O.CustomerID, O.OrderDate
FROM Orders AS O 
WHERE O.OrderDate = '1997-07-04'

-- List of oerder as OrderID, Date,	Customer ID,Employee ID, for orders raised on  July 1997

SELECT O.OrderID, O.EmployeeID, O.CustomerID, O.OrderDate
FROM Orders AS O 
WHERE O.OrderDate BETWEEN '1997-07-01' AND '1997-07-31'
ORDER BY O.EmployeeID


--LIST	OF ALL ORDERS AS OrderID, Order date, Customer ID, Employee ID, for order raised in 1st quarter of 1998

SELECT O.OrderID, O.EmployeeID, O.CustomerID, O.OrderDate
FROM Orders AS O 
WHERE O.OrderDate BETWEEN '1998-01-01' AND '1998-03-31'

--LIST	OF ALL ORDERS AS OrderID, Order date, Customer ID, Employee ID, for order raised in March in every year
--Check if how many year has July data 
-- if we just extract obs for July month, it would solve the problem

--Date Function

SELECT GETDATE()
SELECT YEAR(GETDATE())


-- List	 OF	Years of Orders

SELECT DISTINCT YEAR(O.OrderDate) AS [Years]
FROM Orders AS O
ORDER BY Years


--


SELECT DISTINCT YEAR(O.OrderDate) AS [Years], MONTH(O.OrderDate) AS [Months]
FROM Orders AS O
 WHERE MONTH(O.OrderDate) = 7
ORDER BY Years

-- 

SELECT O.CustomerID,O.OrderID, O.OrderDate
FROM Orders AS O
WHERE MONTH(O.OrderDate) = 7



