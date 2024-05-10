-- List of Orders as OrderID, Order Date, Customer Name, CUstomer Country, Employee Name for customers
-- from France and Germany


SELECT O.OrderID,O.OrderDate,C.CompanyName,C.Country,E.FirstName + ' ' + E.LastName AS [Employee Name]
FROM Orders AS O
JOIN Customers AS C ON O.CustomerID = C.CustomerID
JOIN Employees AS E ON O.EmployeeID = E.EmployeeID
WHERE C.Country = 'France' or C.Country = 'Germany'



SELECT O.OrderID,O.OrderDate,C.CompanyName,C.Country,E.FirstName + ' ' + E.LastName AS [Employee Name]
FROM Orders AS O
JOIN Customers AS C ON O.CustomerID = C.CustomerID
JOIN Employees AS E ON O.EmployeeID = E.EmployeeID
WHERE C.Country IN ('France','Germany')


SELECT DISTINCT C.CompanyName,C.Country
FROM Orders AS O
JOIN Customers AS C ON O.CustomerID = C.CustomerID
JOIN Employees AS E ON O.EmployeeID = E.EmployeeID
WHERE C.Country IN ('France','Germany')




-- List od Orders as OrderId,Product Id, Product Name, Category Name, Line amt, Disct Amt
--for all orders raised in June 1997



SELECT OD.OrderID,P.ProductID,P.ProductName,C.CategoryName, OD.UnitPrice * OD.Quantity AS [Line Amount], OD.UnitPrice * OD.Quantity * OD.Discount AS [Disc Amt]
FROM [Order Details] AS OD
JOIN Products AS P ON OD.ProductID = P.ProductID
JOIN Orders AS O ON OD.OrderID = O.OrderID
JOIN Categories AS C ON P.CategoryID = C.CategoryID
WHERE MONTH(O.OrderDate) = 6 AND YEAR(O.OrderDate) = 1997
ORDER BY [Disc Amt] DESC


-- WE Can't say that Discount column stands for Discount amount
-- Dist amt is Distount (as it is given in fraction) x Line AMt
-- lINE AMT=  unit price x unit Quant


SELECT p.UnitPrice * P.UnitsOnOrder, P.UnitPrice, P.UnitsOnOrder
FROM [Order Details] AS OD
JOIN Products AS P ON OD.ProductID = P.ProductID
JOIN Orders AS O ON OD.OrderID = O.OrderID
JOIN Categories AS C ON P.CategoryID = C.CategoryID
WHERE MONTH(O.OrderDate) = 6 AND YEAR(O.OrderDate) = 1997

--List of Employees as EmployeeID,NAmealong with title of courtsy,Region, territory 

SELECT E.EmployeeID,  E.TitleOfCourtesy + ' '+E.FirstName + ' '+ E.LastName  AS [Name with Title], R.RegionDescription,T.TerritoryDescription
FROM EmployeeTerritories AS ET
JOIN Employees AS E ON ET.EmployeeID = E.EmployeeID
JOIN Territories AS T ON ET.TerritoryID = T.TerritoryID
JOIN Region AS R ON T.RegionID=R.RegionID


-- aggregation 

SELECT COUNT(*)
FROM Orders AS O --NO OF OBS


-- PROVIDE	 EMPLOYEE Cnt
SELECT COUNT(E.EmployeeID) AS EMP_CNT
FROM Employees AS E


-- never give * in count fn if you want to count all rows

SELECT COUNT(O.OrderID)
FROM Orders AS O
WHERE YEAR(O.OrderDate) = 1997

-- count of products in Beverage Cate

SELECT P.*
FROM Products AS P
JOIN Categories AS C ON P.CategoryID = C.CategoryID
WHERE C.CategoryName = 'Beverages'

-- grp by

SELECT c.CategoryName,COUNT(P.ProductID) AS Cnt
FROM Products AS P
JOIN Categories AS C ON P.CategoryID = C.CategoryID
WHERE P.UnitPrice > 100
group by c.CategoryName
ORDER BY Cnt


-- Order count by month and year

SELECT YEAR(O.OrderDate), MONTH(O.OrderDate), COUNT(O.OrderID)
FROM Orders AS O 
GROUP BY YEAR(O.OrderDate),MONTH(O.OrderDate)
order by Year(O.OrderDate)

-- LOOK for keyword as by,monthly,quarterly,wise,productwise,employeewise for aggregations

--Order by is always last clause


SELECT YEAR(O.OrderDate) as OY, DATENAME(MM,O.OrderDate) as OM, COUNT(O.OrderID)
FROM Orders AS O 
GROUP BY YEAR(O.OrderDate), DATENAME(MM,O.OrderDate)
order by OY,OM

-- Orderwise Total Order Amount for orders raised in 1998

SELECT O.OrderID,SUM(OD.Quantity * OD.UnitPrice)
FROM [Order Details] AS OD
JOIN Orders AS O ON OD.OrderID = O.OrderID
WHERE YEAR(O.OrderDate) = 1998
GROUP BY O.OrderID

-- oRDERWISE PRODUCT COUNT

SELECT O.OrderID,COUNT(P.ProductID)
FROM [Order Details] AS OD
JOIN Orders AS O ON OD.OrderID = O.OrderID
JOIN Products AS P ON OD.ProductID = P.ProductID
WHERE OD.OrderID = 10248
GROUP BY O.OrderID
 
 --

 
SELECT OD.OrderID,COUNT(OD.ProductID)
FROM [Order Details] AS OD
WHERE OD.OrderID = 10248
GROUP BY OD.OrderID
