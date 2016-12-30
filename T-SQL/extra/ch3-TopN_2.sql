--ch3-3 topN with ties
drop table t2
go
create table t2(id  int,
                qty int)
go
insert into t2 values (1, 110)
insert into t2 values (2, 120)
insert into t2 values (3, 130)
insert into t2 values (4, 130)
insert into t2 values (5, 140)
insert into t2 values (6, 150)
go

select * from t2 order by qty desc
go
                
select top 3 qty, id    
from t2
order by qty desc
go

--with ties ���̫� �@���ۦP�ɳ��C�X, �D����
select top 3 with ties qty, id    
from t2
order by qty desc
go

--�`�N top 4 with ties ���O 4�� �O�̫�@�����ۦP 
select top 4 with ties qty, id    
from t2
order by qty desc
go             

--��h Top N

--top n

USE northwind
SELECT TOP 5 orderid, productid, quantity
 FROM [order details]
 ORDER BY quantity DESC

GO
