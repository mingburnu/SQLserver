
--跳脫字元 ESCAPE , 跳過特定字元不處理, 
--ex: A_B, 之 '_' 是原來值, 非萬用字元 之 任一字

create table t2( id int,
                   name char(20))
go

insert into t2 values (1,'A_B')
insert into t2 values (2,'A1B')
insert into t2 values (3,'A2B')
go

select * from  t2
go

--origional 
select * from  t2
where name like '%A_B%' 

--escape 
select * from  t2
where name like '%A\_B%' ESCAPE '\'

select * from  t2
where name like '%A!_B%' ESCAPE '!'

