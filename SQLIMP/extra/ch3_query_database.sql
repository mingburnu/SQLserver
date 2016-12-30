
--建立 DB
USE master;
GO

IF DB_ID (N'mytest') IS NOT NULL
  DROP DATABASE mytest;
GO
  CREATE DATABASE mytest;
GO

--查詢 Verify the database files and sizes
SELECT name, size, size*1.0/128 AS [Size in MBs] 
FROM sys.master_files
WHERE name = N'mytest';
GO

--查詢建立之路徑

SELECT SUBSTRING(physical_name, 1, CHARINDEX(N'master.mdf', LOWER(physical_name)) - 1)
                  FROM master.sys.master_files
                  WHERE database_id = 1 AND file_id = 1


--或查 
sp_helpfile
