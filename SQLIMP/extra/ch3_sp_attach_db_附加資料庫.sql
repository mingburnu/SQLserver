��1
--������Ʈw detach 

EXEC  sp_detach_db 'sample1'


--���[��Ʈw Attach
exec sp_attach_db sample1,  
                  'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\sample1.mdf' ,
                  'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\sample1_log.LDF' 



--���@��ƤU�ҥi ���ݤ����� master DB
EXEC master.dbo.sp_detach_db @dbname = N'sample1'


��
CREATE DATABASE [sample1] ON 
 ( FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\sample1.mdf' ),
 ( FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\sample1_log.LDF' )
 FOR ATTACH
GO


��2  �h �ɮ�

--������Ʈw detach 

USE [master]
GO
EXEC master.dbo.sp_detach_db @dbname = N'sample2'
GO


--���[��Ʈw Attach

USE [master]
GO
CREATE DATABASE [sample2] ON 
( FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\sample2.mdf' ),
( FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\sample2.ldf' ),
( FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\sample2_2.ndf' ),
( FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\sample2_fg2.ndf' )
 FOR ATTACH
GO

��

SP_ATTACH_DB [sample2] ,
   'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\sample2.mdf' ,
   'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\sample2.ldf' ,
   'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\sample2_2.ndf' ,
   'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\sample2_fg2.ndf' 
   
   