/* UpdateCustomerPhone
   Updates a customer phone number
   Error checking ensures that a valid customer
   identification number is supplied
*/
/*
  The following user-defined message supports the
  UpdateCustomerPhone stored procedure
  訊息 15279，層級 16，狀態 1，程序 sp_addmessage，行 97
  您必須先加入這個訊息的 us_english 版本才能加入 '繁體中文' 版本。

set language us_english 
go
執行 EXEC sp_addmessage 後
再切換回 SET LANGUAGE 繁體中文
*/

EXEC sp_addmessage 50010, 16, 'CustomerID not found.', @replace='replace'
USE Northwind
GO
CREATE PROCEDURE UpdateCustomerPhone
  @CustomerID nchar (5) = NULL,
  @Phone nvarchar (24) = NULL
AS
IF @CustomerID IS NULL
   BEGIN
      PRINT 'You must supply a valid CustomerID.'
      RETURN
END
/* Ensure a valid CustomerID is supplied' */
IF NOT EXISTS
   (SELECT * FROM Customers WHERE CustomerID = @CustomerID)
      BEGIN
         RAISERROR (50010, 16, 1) --Customer not found.
         RETURN
      END

BEGIN TRANSACTION
UPDATE Customers
   SET Phone = @Phone
   WHERE CustomerID = @CustomerID

/* Display message that the phone number for CompanyName has
been updated */
SELECT 'The phone number for ' + @CustomerID + ' has been updated to ' +
@Phone
COMMIT TRANSACTION
GO


--執行測試

EXEC UpdateCustomerPhone

EXEC UpdateCustomerPhone 'Tom', '1'

EXEC UpdateCustomerPhone 1, '(206) 555-0000'

EXEC UpdateCustomerPhone 'ALFKI', '(206) 555-0000'

