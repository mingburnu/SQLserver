

/*Show not having access to variables from the calling batch. */
  DECLARE @CharVariable CHAR(3);
  SET @CharVariable = 'abc';

/* �|���� sp_executesql fails because @CharVariable has gone out of scope. */
EXECUTE sp_executesql N'PRINT @CharVariable';
GO


/* Show database context resetting after sp_executesql finishes. �I�s USE�����^��DB */
USE master;
GO
EXECUTE sp_executesql N'USE AdventureWorks2012;'
GO

/* This statement fails because the database context
   has now returned to master. */

SELECT * FROM Sales.Store;
GO

--�� 2 ���N�Ѽƭ�

DECLARE @IntVariable INT;
DECLARE @SQLString NVARCHAR(500);
DECLARE @ParmDefinition NVARCHAR(500);

/* Build the SQL string one time. */
SET @SQLString =
     N'SELECT * FROM AdventureWorks2012.Sales.Store WHERE SalesPersonID = @SalesID';
/* Specify the parameter format one time. */
SET @ParmDefinition = N'@SalesID int';

/* Execute the string with the first parameter value. */
SET @IntVariable = 275;
EXECUTE sp_executesql @SQLString, @ParmDefinition,
                      @SalesID = @IntVariable;
/* Execute the same string with the second parameter value. */
SET @IntVariable = 276;
EXECUTE sp_executesql @SQLString, @ParmDefinition,
                      @SalesID = @IntVariable;