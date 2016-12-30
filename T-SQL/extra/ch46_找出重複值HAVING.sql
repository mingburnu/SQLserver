--找出重複值  (統一編號), 沒設PK
drop table company
go
create table company
( id   int,
  name char(20)
);
go

--104, 106 一筆
insert into company values (101, '中科院');
insert into company values (102, '中研院');
insert into company values (103, '資策會');
insert into company values (104, '華南銀行');  --只有一筆,
insert into company values (105, '中信銀');
insert into company values (106, '彰銀');
insert into company values (105, '彰化銀');    --統編寫錯
insert into company values (101, '中山科學研究院');
insert into company values (101, '中科院一所');
insert into company values (102, '中央研究院');
insert into company values (103, '資訊工業策進會');
go

--查出某一單位, 無法看出重覆

select * from  company where name = '中科院'
select * from  company where name like '%科院%'
select * from  company where name like '%科%'

--分組 by name
select  name, count(*)
from  company
group by name

--分組 by id, 可知重複, 但不知那幾筆
select  id, count(*)
from  company
group by id

--重複

select  id, count(*)
from  company
group by id
having count(*) > 1

--找出重複

select *
from company
where id in ( select  id 
              from  company
              group by id
              having count(*) > 1
            )
		
