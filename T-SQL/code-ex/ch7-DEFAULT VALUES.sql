--���O�w�]�� 
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


--�y�����j����J

set IDENTITY_INSERT dbo.shippers ON
go

--���ӧO�C�X���W��
insert into shippers (shipperid,company,phone)  values (80,'ccc','0955555555')
go

--���~- ���ӧO�C�X���W��
/* �T�� 8101�A�h�� 16�A���A 1�A�� 1
����ƪ� 'Shippers' ���ѧO����~��ȥu����ϥΤF��Ʀ�M��
�B IDENTITY_INSERT �� ON �ɤ~����w�C
*/

insert into  shippers values(80,'ccc','0955555555')
go

select * from shippers
go


