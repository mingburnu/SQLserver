

/*Show not having access to variables from the calling batch. */
  DECLARE @CharVariable CHAR(3);
  SET @CharVariable = 'abc';

/* 會失敗 sp_executesql fails because @CharVariable has gone out of scope. */
EXECUTE sp_executesql N'PRINT @CharVariable';
GO


/* Show database context resetting after sp_executesql finishes. 呼叫 USE完後返回原DB */
USE master;
GO
EXECUTE sp_executesql N'USE AdventureWorks2012;'
GO

/* This statement fails because the database context
   has now returned to master. */

SELECT * FROM Sales.Store;
GO

--例 2 替代參數值

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