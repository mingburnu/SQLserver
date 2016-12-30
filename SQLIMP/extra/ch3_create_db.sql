--create db  basic on default 

CREATE DATABASE sample1
GO

--create db  with primary file group + log 
/* SQL 2012 PRIMARY 檔案至少要有 5 MB , SQL 2013 只須 3MB
   訊息 1803，層級 16，狀態 1，行 1
   CREATE DATABASE 陳述式失敗。主要檔案至少要有 5 MB，才能容納模型資料庫的副本。
*/
CREATE DATABASE sample2
ON PRIMARY
	(NAME = sample2,
	  FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\sample2.mdf',
          SIZE = 5MB,
          MAXSIZE = 50MB,
          FILEGROWTH = 1MB)
LOG ON
	( NAME = sample2_log,
	  FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\sample2.ldf',
          SIZE = 1MB,
          MAXSIZE = 50MB,
          FILEGROWTH = 10%)
GO

--create db  with multiple  file group + log 
CREATE DATABASE sample3
ON PRIMARY
	(NAME = sample3,
	  FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\sample3.mdf',
          SIZE = 5MB,
          MAXSIZE = 50MB,
          FILEGROWTH = 1MB),
FILEGROUP  FILEGROUP2
	(NAME = sample3_fg2,
	  FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\sample3_fg2.ndf',
          SIZE = 3MB,
          MAXSIZE = 50MB,
          FILEGROWTH = 1MB)
LOG ON
	( NAME = sample3_log,
	  FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\sample3.ldf',
          SIZE = 1MB,
          MAXSIZE = 50MB,
          FILEGROWTH = 10%)
GO
          
--create db  with 2 files + 2 log files 
CREATE DATABASE sample4
ON PRIMARY
	(NAME = sample4_1,
	  FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\sample4_1.mdf',
          SIZE = 5MB,
          MAXSIZE = 50MB,
          FILEGROWTH = 1MB),
	 (NAME = sample4_2,
	  FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\sample4_2.ndf',
          SIZE = 3MB,
          MAXSIZE = 50MB,
          FILEGROWTH = 1MB)
LOG ON
	( NAME = sample4_log_1,
	  FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\sample4_1.ldf',
          SIZE = 1MB,
          MAXSIZE = 50MB,
          FILEGROWTH = 10%),
     ( NAME = sample4_log_2,
	   FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\sample4_2.ldf',
          SIZE = 1MB,
          MAXSIZE = 50MB,
          FILEGROWTH = 10%)      
GO
                     
--create db  with 2 file groups / 2files + 2 logs files
CREATE DATABASE sample5
ON PRIMARY
	(NAME = sample5_1,
	  FILENAME = N'C:\mydb\sample5_1.mdf',
          SIZE = 5MB,
          MAXSIZE = 50MB,
          FILEGROWTH = 1MB),
	 (NAME = sample5_2,
	  FILENAME = N'C:\mydb\sample5_2.ndf',
          SIZE = 3MB,
          MAXSIZE = 50MB,
          FILEGROWTH = 1MB),
FILEGROUP  FILEGROUP2
	(NAME = sample5_fg2_1,
	  FILENAME = N'C:\mydb\sample5_fg2_1.ndf',
          SIZE = 3MB,
          MAXSIZE = 50MB,
          FILEGROWTH = 1MB),
	 (NAME = sample5_fg2_2,
	  FILENAME = N'C:\mydb\sample5_fg2_2.ndf',
          SIZE = 3MB,
          MAXSIZE = 50MB,
          FILEGROWTH = 1MB), 
FILEGROUP  FILEGROUP3
	(NAME = sample5_fg3_1,
	  FILENAME = N'C:\mydb\sample5_fg3_1.ndf',
          SIZE = 3MB,
          MAXSIZE = 50MB,
          FILEGROWTH = 1MB),
	 (NAME = sample5_fg3_2,
	  FILENAME = N'C:\mydb\sample5_fg3_2.ndf',
          SIZE = 3MB,
          MAXSIZE = 50MB,
          FILEGROWTH = 1MB)                              
LOG ON
	( NAME = sample5_log_1,
	  FILENAME = N'C:\mydb\sample5_1.ldf',
          SIZE = 1MB,
          MAXSIZE = 50MB,
          FILEGROWTH = 10%),
     ( NAME = sample5_log_2,
	   FILENAME = N'C:\mydb\sample5_2.ldf',
          SIZE = 1MB,
          MAXSIZE = 50MB,
          FILEGROWTH = 10%)      
GO