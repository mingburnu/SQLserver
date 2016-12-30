
--
USE master
GO
CREATE LOGIN  L1 WITH PASSWORD= 'l1'              --�� Login: L1, �K�X�����j�p�g
GO

use Northwind
go
CREATE USER u1 FOR LOGIN L1                       --�� User : u1
GO
CREATE SCHEMA s1 AUTHORIZATION u1                 --�� Schema : s1
GO
ALTER USER u1 WITH DEFAULT_SCHEMA=s1              --�]�w u1 �w�] schema �� s1
GO

EXEC sp_addrolemember 'db_datawriter', 'u1'       --���v u1
GO
EXEC sp_addrolemember 'db_ddladmin'  , 'u1'
GO
EXEC sp_addrolemember 'db_datareader', 'u1'
GO




--�H L1 �n�J �� ��� a1 �� northwind
use Northwind
go
create table a1(id int)
go

insert into    a1 values (101);
insert into s1.a1 values (102);

select * from     a1;
select * from  s1.a1;
select * from  dbo.a1;    --����
go


--�R�� �ϦV����
DROP TABLE  s1.a1
GO
DROP SCHEMA s1
GO
DROP USER u1
GO
USE [master]
GO
DROP LOGIN L1
GO




