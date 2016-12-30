/* UpdateCustomerPhone
   Updates a customer phone number
   Error checking ensures that a valid customer
   identification number is supplied
*/
/*
  The following user-defined message supports the
  UpdateCustomerPhone stored procedure
  �T�� 15279�A�h�� 16�A���A 1�A�{�� sp_addmessage�A�� 97
  �z�������[�J�o�ӰT���� us_english �����~��[�J '�c�餤��' �����C

set language us_english 
go
���� EXEC sp_addmessage ��
�A�����^ SET LANGUAGE �c�餤��
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


--�������

EXEC UpdateCustomerPhone

EXEC UpdateCustomerPhone 'Tom', '1'

EXEC UpdateCustomerPhone 1, '(206) 555-0000'

EXEC UpdateCustomerPhone 'ALFKI', '(206) 555-0000'

