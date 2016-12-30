/*
** This file contains examples from Module 8: 
** "Implementing Views"
** To use the file, highlight and execute each example.
*/

USE Northwind
GO

/*
**  Introduction to Views.
*/
CREATE VIEW dbo.EmployeeView
AS 
SELECT LastName, Firstname
FROM Employees

SELECT * from EmployeeView 


/*
**  Creating Views.
*/
CREATE VIEW dbo.OrderSubtotals (OrderID, Subtotal)
AS
SELECT OD.OrderID,
   SUM(CONVERT
    (money,(OD.UnitPrice*Quantity*(1-  Discount)/100))*100)
FROM [Order Details] OD
GROUP BY OD.OrderID
GO

SELECT * FROM OrderSubtotals 


/*
**  Example: View of Joined Tables.
*/
CREATE VIEW ShipStatusView
AS
SELECT OrderID, ShippedDate, ContactName
FROM Customers c INNER JOIN Orders o
   ON c.CustomerID = O.CustomerID
WHERE RequiredDate < ShippedDate

SELECT * FROM ShipStatusView 


/*
**  Altering and Dropping Views.
*/
ALTER VIEW dbo.EmployeeView
AS 
SELECT LastName, FirstName, Extension
FROM Employees

SELECT * from  dbo.EmployeeView


/*
**  Hiding View Definitions.
*/
CREATE VIEW dbo.[Order Subtotals]
   WITH ENCRYPTION
AS
SELECT OrderID,
 Sum(CONVERT(money,(UnitPrice*Quantity*(1-Discount)/100))*100)
   AS Subtotal
FROM [Order Details]
GROUP BY OrderID

--test

select * from dbo.[Order Subtotals]

sp_helptext dbo.[Order Subtotals]



/*
**  Performance Considerations.
*/

CREATE VIEW dbo.TotalPurchaseView
AS
SELECT CompanyName, Sum(CONVERT(money,
   (UnitPrice*Quantity*(1-Discount)/100))*100) AS Subtotal
FROM Customers c INNER JOIN Orders o
     ON c.CustomerID=o.CustomerID
   INNER JOIN [Order Details] od
     ON o.OrderID = od.OrderID
GROUP BY CompanyName
GO

CREATE VIEW dbo.TopSalesView
AS
SELECT *
FROM dbo.TotalPurchaseView
WHERE Subtotal > 50000
GO

SELECT *
FROM dbo.TopSalesView
WHERE CompanyName = 'Ernst Handel'


GO
