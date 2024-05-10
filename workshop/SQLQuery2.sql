SELECT DATEPART(WEEKDAY,O.OrderDate)
FROM Orders AS O


-- List of orders Raised on Sunday of Dec. 1997

SELECT *
FROM Orders AS O
WHERE YEAR(O.OrderDate) = 1997 AND MONTH(O.OrderDate) = 12 AND DATENAME(WEEKDAY,O.OrderDate) = 'moNDAY'


SELECT *
FROM Orders AS O
WHERE YEAR(O.OrderDate) = 1997 AND MONTH(O.OrderDate) = 12 AND DATEPART(WEEKDAY,O.OrderDate)  IN (2,3,4,5,6)

SELECT *
FROM Employees AS E
WHERE E.Title LIKE 'Sales%'



SELECT *
FROM Employees AS E
WHERE E.Title LIKE '%Sales'


SELECT TOP 1 *
FROM Employees AS E
WHERE E.Title LIKE '%Sales%'


-- lIST OF PRODUCTS AS productID,Name, CategoryId,NAme

SELECT *
FROM Products AS P
JOIN Categories AS C ON P.CategoryID=C.CategoryID


SELECT P.ProductID,P.CategoryID,P.ProductName,C.CategoryName
FROM Products AS P
JOIN Categories AS C ON P.CategoryID=C.CategoryID


--List of customsers
SELECT *
FROM Customers


--List of customsers with atleast 1 order

SELECT DISTINCT O.CustomerID
FROM Orders AS O
ORDER BY O.CustomerID

--List of customsers with  0 order
SELECT  C.*
FROM Orders AS O
FULL JOIN Customers AS C ON O.CustomerID = C.CustomerID
WHERE O.OrderID IS NULL



SELECT c.*
FROM Customers c
LEFT JOIN Orders o ON c.CustomerID = o.CustomerID
WHERE o.OrderID IS NULL