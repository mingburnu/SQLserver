--OUTPUT�y�k �f�t INSERT /UPDATE / DELETE �� inserted, deleted  �� OUTPUT .. INTO �s���

create table t1(id   int,
                qty  int)
                
go

insert into t1 values(1, 10);
insert into t1 values(2, 20);
insert into t1 values(3, 30);
insert into t1 values(4, 40);
go

select * from t1

--�R��
delete from  t1 output deleted.* 
where id = 2

--�s�W
insert into t1 
output inserted.id, inserted.qty
values(5, 50)

insert into t1 
output inserted.*
values(6, 60)

--��s
update t1 set qty = qty + 10  
output  deleted.*, inserted.*
where id = 1



