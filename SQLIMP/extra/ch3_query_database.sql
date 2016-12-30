
--�إ� DB
USE master;
GO

IF DB_ID (N'mytest') IS NOT NULL
  DROP DATABASE mytest;
GO
  CREATE DATABASE mytest;
GO

--�d�� Verify the database files and sizes
SELECT name, size, size*1.0/128 AS [Size in MBs] 
FROM sys.master_files
WHERE name = N'mytest';
GO

--�d�߫إߤ����|

SELECT SUBSTRING(physical_name, 1, CHARINDEX(N'master.mdf', LOWER(physical_name)) - 1)
                  FROM master.sys.master_files
                  WHERE database_id = 1 AND file_id = 1


--�άd 
sp_helpfile
