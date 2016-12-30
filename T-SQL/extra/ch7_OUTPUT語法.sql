--OUTPUT語法 搭配 INSERT /UPDATE / DELETE 及 inserted, deleted  或 OUTPUT .. INTO 新表格

create table t1(id   int,
                qty  int)
                
go

insert into t1 values(1, 10);
insert into t1 values(2, 20);
insert into t1 values(3, 30);
insert into t1 values(4, 40);
go

select * from t1

--刪除
delete from  t1 output deleted.* 
where id = 2

--新增
insert into t1 
output inserted.id, inserted.qty
values(5, 50)

insert into t1 
output inserted.*
values(6, 60)

--更新
update t1 set qty = qty + 10  
output  deleted.*, inserted.*
where id = 1



