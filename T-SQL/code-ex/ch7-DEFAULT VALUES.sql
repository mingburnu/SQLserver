--都是預設值 
use AdventureWorks
go
drop table shippers
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

set IDENTITY_INSERT dbo.shippers ON
go

--須個別列出欄位名稱
insert into shippers (shipperid,company,phone)  values (80,'ccc','0955555555')
go

--錯誤- 未個別列出欄位名稱
/* 訊息 8101，層級 16，狀態 1，行 1
位於資料表 'Shippers' 的識別欄位其外顯值只有當使用了資料行清單
且 IDENTITY_INSERT 為 ON 時才能指定。
*/

insert into  shippers values(80,'ccc','0955555555')
go

select * from shippers
go


