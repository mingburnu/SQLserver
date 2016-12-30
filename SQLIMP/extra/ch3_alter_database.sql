

--修改 db 大小 初始值 5M 最大值 無限: 右鍵 資料庫名/ 屬性/ 檔案 

USE [master]
GO
ALTER DATABASE sample2 
  MODIFY FILE ( NAME = N'sample2', 
                SIZE = 5MB , 
                MAXSIZE = UNLIMITED
               )
GO

--修改 db 大小 加 檔案: 右鍵 資料庫名/ 屬性/ 檔案 /加入
ALTER DATABASE sample2
  ADD FILE ( NAME = N'sample2_2', 
             FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\sample2_2.ndf' , 
             SIZE = 3MB , 
             MAXSIZE = 50MB , 
             FILEGROWTH = 1MB
            ) TO FILEGROUP [PRIMARY]
GO

--修改 db 大小 加filegroup : 右鍵 資料庫名/ 屬性/ 檔案 /加入
--輸入 邏輯名稱,下拉 檔案群組 / 新增 檔案群組, 輸入路徑, 檔名

ALTER DATABASE sample2
  ADD FILEGROUP filegroup2
GO

ALTER DATABASE sample2 
  ADD FILE ( NAME = N'samlpe2_fg2', 
             FILENAME = N'C:\mydb\sample2_fg2.ndf' , 
             SIZE = 3MB , 
             MAXSIZE = 5MB ,
             FILEGROWTH = 1MB ) TO FILEGROUP filegroup2
GO


