
--«Å§iCursor©I¥sCHEKDB.sql
--http://msdn.microsoft.com/zh-tw/library/ms175170.aspx

USE master;
GO
SET NOCOUNT ON;
GO
DECLARE AllDatabases CURSOR FOR
SELECT name FROM sys.databases WHERE database_id > 4
OPEN AllDatabases;

DECLARE @DBNameVar NVARCHAR(128);
DECLARE @Statement NVARCHAR(300);

FETCH NEXT FROM AllDatabases INTO @DBNameVar;
WHILE (@@FETCH_STATUS = 0)
BEGIN
   PRINT N'CHECKING DATABASE ' + @DBNameVar;
   SET @Statement = N'USE ' + @DBNameVar + CHAR(13)
      + N'DBCC CHECKDB (' + @DBNameVar + N')' + N'WITH PHYSICAL_ONLY';
   EXEC sp_executesql @Statement;
   PRINT CHAR(13) + CHAR(13);
   FETCH NEXT FROM AllDatabases INTO @DBNameVar;
END;

CLOSE AllDatabases;
DEALLOCATE AllDatabases;
GO
SET NOCOUNT OFF;
GO
