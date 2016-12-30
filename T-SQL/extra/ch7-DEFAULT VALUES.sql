--都是預設值 
use AdventureWorks
go
create table Shippers(shipperid int identity,
                       company char(30) default 'abc',
                       phone   char(20) default '09203333')


insert into shippers(company,phone  ) values(default, default)

insert into shippers default values
go
select * from shippers
go


--流水號強迫輸入

set IDENTITY_INSERT dbo.shippers On
go

insert into shippers(shipperid,company,phone  ) 
     values(85,'ccc','0955555555')
go
select * from shippers
go


