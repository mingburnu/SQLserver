

--�ק� db �j�p ��l�� 5M �̤j�� �L��: �k�� ��Ʈw�W/ �ݩ�/ �ɮ� 

USE [master]
GO
ALTER DATABASE sample2 
  MODIFY FILE ( NAME = N'sample2', 
                SIZE = 5MB , 
                MAXSIZE = UNLIMITED
               )
GO

--�ק� db �j�p �[ �ɮ�: �k�� ��Ʈw�W/ �ݩ�/ �ɮ� /�[�J
ALTER DATABASE sample2
  ADD FILE ( NAME = N'sample2_2', 
             FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\sample2_2.ndf' , 
             SIZE = 3MB , 
             MAXSIZE = 50MB , 
             FILEGROWTH = 1MB
            ) TO FILEGROUP [PRIMARY]
GO

--�ק� db �j�p �[filegroup : �k�� ��Ʈw�W/ �ݩ�/ �ɮ� /�[�J
--��J �޿�W��,�U�� �ɮ׸s�� / �s�W �ɮ׸s��, ��J���|, �ɦW

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


