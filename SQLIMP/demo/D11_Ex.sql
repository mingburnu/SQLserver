/*
** This file contains examples from 'Module 11: 'Implementing
** Triggers'
** To use the file, highlight and execute each example.
*/

/*
** Data Control Language Statements
**
** This example grants the public role permission to query the Products table
*/

USE Northwind
GO

--例1 建立 Trigger
--產生測試資料表
select * into employees2 from Employees

--建立 Trigger 當 刪除 employees 員工超過一筆以上時, 產生錯誤訊息
Use Northwind
GO
CREATE TRIGGER Empl_Delete ON Employees2
FOR DELETE 
AS
IF (SELECT COUNT(*) FROM Deleted) > 1
BEGIN
   RAISERROR('You cannot delete more than one employee at a time.', 16, 1)
   ROLLBACK TRANSACTION
END

--測試
delete from employees2 where employeeid >= 1      -- not OK
delete from employees2 where employeeid  = 1      -- OK

drop table employees2;



--產生測試資料
select * into products1 from products
select * into [Order Details1] from [Order Details]

/*
** Creating Triggers
*/

CREATE TRIGGER Product_Delete ON Products1 FOR DELETE
AS
IF (Select Count (*)
    FROM [Order Details1] INNER JOIN deleted 
    ON [Order Details1].ProductID = Deleted.ProductID    ) > 0 
BEGIN
   RAISERROR('Transaction cannot be processed. \
              This Product still has a history of orders.', 16, 1)
   ROLLBACK TRANSACTION
END

--測試
DELETE FROM	products1 where productid = 11

DROP TABLE products1;
DROP TABLE [Order Details1];

/*
** Example -- Note this customer table is not the same as 
** the Customers table in the Northwind database
*/

CREATE TABLE customer
	( id int IDENTITY(1,1),
	  cust_id   char(8),
	  firstname char(10),
	  lastname  char(20) )
GO
CREATE TRIGGER gen_cust_id ON customer FOR INSERT
AS
UPDATE customer SET cust_id = ( SELECT 
	REPLICATE('0',(4-(DATALENGTH(CONVERT(varchar(10),i.id)))))
		+ CONVERT(varchar(10),i.id)
		+ SUBSTRING(i.lastname,1,3)
		+ SUBSTRING(i.firstname,1,1)
		FROM customer c INNER JOIN inserted i ON i.id = c.id)
	FROM customer c INNER JOIN inserted i ON i.id = c.id

--The following INSERT statement fires the trigger.
INSERT customer (lastname, firstname)
		VALUES ('Rothenberg', 'Angela')

SELECT * FROM customer

DROP TABLE customer
GO
/*
** Altering and Dropping Triggers
*/
/*
** This example creates the OrdDet_Insert trigger 
** for the INSERT action on the Order Details table. When a row 
** is inserted into the Order Details table, the trigger updates 
** the UnitsInStock column of the Product table with reducing 
** the UnitsInStock by the amount of the order
*/

CREATE TRIGGER OrdDet_Insert
ON [Order Details]
FOR INSERT
AS
UPDATE P SET 
UnitsInStock = (P.UnitsInStock - I.Quantity)
FROM Products AS P INNER JOIN Inserted AS I
ON P.ProductID = I.ProductID

--測試2

select productid, unitsinstock '原庫存' from products where productid = 1

--購買產品 productid = 1 , 5個後
insert into [Order Details] values (10248, 1,14.00, 5,0)

select productid, unitsinstock  '新庫存' from products where productid = 1

drop trigger OrdDet_Insert

--改寫成單一式子, 若確定只會有一筆被影響時
CREATE TRIGGER OrdDet_Insert2
ON [Order Details]
FOR INSERT
AS
BEGIN
 declare @pid int;
 declare @qty int;

 select @pid = productid ,@qty = quantity 
 from   INSERTED;

 UPDATE Products  SET UnitsInStock = (UnitsInStock - @qty)
 where ProductID = @pid
END


/*
** Example 2
** In this example, the trigger is altered to 
** include checking for the delete action and 
** includes the Transact-SQL statements that are 
** required to update the UnitInStock column in 
** the Product table when a record is deleted 
** from the Order Details table.
*/

ALTER TRIGGER OrdDet_Insert
   ON [Order Details] FOR INSERT, DELETE
AS
IF EXISTS (SELECT * FROM Inserted)
   BEGIN
      UPDATE P SET 
      UnitsInStock = (P.UnitsInStock - I.Quantity)
      FROM Products AS P INNER JOIN Inserted AS I
      ON P.ProductID = I.ProductID
   END
ELSE
   BEGIN
      UPDATE P SET 
      UnitsInStock = (P.UnitsInStock + D.Quantity)
      FROM Products AS P INNER JOIN Deleted AS D
      ON P.ProductID = D.ProductID
   END

--測試

select productid, unitsinstock '原庫存' from products where productid = 1

--取消購買產品 productid = 1 , 5個後
delete from [Order Details] where orderid  = 10248 and productid =1

select productid, unitsinstock  '新庫存' from products where productid = 1



/*
** How a DELETE trigger works
**
** The trigger in this example was created 
** to update the Discontinued column in the 
** Products table whenever a Category is deleted 
** (whenever a record is deleted from the 
** Categories table). All affected products 
** are marked as 1 indicating they are discontinued.
*/

--產生測試資料
drop table Categories1
drop table products1  

select * into Categories1 from Categories
select * into products1   from products 

CREATE TRIGGER Category_Delete
	ON Categories1
	FOR DELETE
AS
	UPDATE P SET Discontinued = 1
		FROM Products1 AS P INNER JOIN deleted AS d
		ON P.CategoryID = d.CategoryID

--測試
select * from Categories1  where categoryid = 2
select productid, categoryid, discontinued from products1 where categoryid = 2

delete from Categories1  where categoryid = 2

--刪除後
select * from Categories1  where categoryid = 2
select productid, categoryid, discontinued from products1 where categoryid = 2


/*
** How an UPDATE trigger works
**
** This example prevents a user from modifying 
** the EmployeeID column in the Employees table.
*/
CREATE TRIGGER Employee_Update
	ON Employees
	FOR UPDATE
AS
IF UPDATE (EmployeeID)
BEGIN TRANSACTION
	RAISERROR ('Transaction cannot be processed.\
	***** Employee ID number cannot be modified.', 10, 1)
	ROLLBACK TRANSACTION

----測試
update employees set title= 'Sales' where employeeid = 1

/*
** How an INSTEAD OF trigger works
**
** This example creates a table with customers 
** in Germany and a table with customers in Mexico. 
** An INSTEAD OF trigger placed on the view redirects 
** updates to the appropriate underlying table. The 
** insert to the CustomersGer table occurs instead 
** of the insert to the view.
*/

--Create two tables with customer data
USE Northwind
GO
SELECT * INTO CustomersGer FROM Customers WHERE Customers.Country = 'Germany'
SELECT * INTO CustomersMex FROM Customers WHERE Customers.Country = 'Mexico'
GO

--Create a view on that data
CREATE VIEW CustomersView AS
SELECT * FROM CustomersGer
UNION
SELECT * FROM CustomersMex
GO

--Create an INSTEAD OF trigger on the view
CREATE TRIGGER Customers_Update2
ON CustomersView
INSTEAD OF UPDATE AS
DECLARE @Country nvarchar(15)
SET @Country = (SELECT Country FROM Inserted)
IF @Country = 'Germany'
  BEGIN 
   UPDATE CustomersGer
    SET CustomersGer.Phone = Inserted.Phone
    FROM CustomersGer JOIN Inserted 
    ON CustomersGer.CustomerID = Inserted.CustomerID
  END
ELSE 
  IF @Country = 'Mexico' 
  BEGIN
   UPDATE CustomersMex
    SET CustomersMex.Phone = Inserted.Phone
    FROM CustomersMex JOIN Inserted 
    ON CustomersMex.CustomerID = Inserted.CustomerID
  END
  
--Test the trigger by updating the view
UPDATE CustomersView SET Phone = ' 030-007xxxx' 
  WHERE CustomerID = 'ALFKI'
SELECT CustomerID, Phone FROM CustomersView 
  WHERE CustomerID = 'ALFKI'
SELECT CustomerID, Phone FROM CustomersGer 
  WHERE CustomerID = 'ALFKI'

/*
** How Nested Triggers Work
** 
** Placing an order causes the OrDe_Update trigger 
** to execute. That trigger executes an UPDATE 
** statement on the UnitsInStock column of the 
** Products table. When that update occurs it 
** fires the Products_Update trigger compares 
** the new value of the stock on hand plus the 
** stock on order to the reorder level. If that 
** it falls below the reorder level a message 
** is sent alerting the buyer to purchase more stock.
** 
** Note: The mail portion of this trigger is not provided.
** Mail capability is not required during course set up.
** You can substitute a Print statement to demonstrate 
** the action of the trigger.
*/

USE Northwind
GO
CREATE TRIGGER Products_Update
  ON Products
  FOR UPDATE
AS
IF UPDATE (UnitsInStock)
  IF (Products.UnitsInStock + Products.UnitsOnOrder) < Products.ReorderLevel 
BEGIN 
  --Send message to the purchasing department
END

/*
** Enforcing Data Integrity
** 
** The following example shows how a trigger 
** can maintain data integrity on a BackOrders 
** table by deleting records from a BackOrders 
** table when the Products table is updated 
** because products have been received.
** 
** This trigger is only an illustration.
** There is no BackOrders table in the Northwind database.
*/

CREATE TRIGGER BackOrderList_Delete
	ON Products FOR UPDATE
AS
IF (SELECT BO.ProductID FROM BackOrders AS BO JOIN
	Inserted AS I ON BO.ProductID = I.Product_ID
	) > 0
BEGIN
	DELETE BO FROM BackOrders AS BO 
	INNER JOIN Inserted AS I 
	ON BO.ProductID = I.ProductID
END

/* 
** ENforcing Business Rules
**
** This example creates a trigger that 
** determines whether any order history exists 
** for a product that is being deleted. If the 
** product has never been ordered then the 
** product can be deleted. If the product has 
** a history of orders then the delete from 
** the product table is rolled back and the 
** trigger returns a custom error message. 
*/ 
--產生測試資料
drop table products1
go
select * into products1   from products 


CREATE TRIGGER Product_Delete
  ON Products1 FOR DELETE
AS
IF (Select Count (*)
    FROM [Order Details] INNER JOIN deleted 
    ON [Order Details].ProductID = Deleted.ProductID
    ) > 0 
BEGIN
   RAISERROR('Transaction cannot be processed. \
              This product has order history.', 16, 1)
   ROLLBACK TRANSACTION
END

--測試
delete from products1 where productid = 11

/*
** Review
**
** The INSERT statement looks like this:
*/
USE Northwind
GO
SET IDENTITY_INSERT Products1 On
-- Run the query in the manual against the new table.
INSERT Products1 (ProductID, ProductName, SupplierID, 
CategoryID, QuantityPerUnit, UnitPrice, UnitsInStock, 
UnitsOnOrder, ReorderLevel, Discontinued)
VALUES (79, 'Tasty Cheese', 14, 
4, '1 kg pkg.', 8.0000, 0, 
10, 5, 0)
