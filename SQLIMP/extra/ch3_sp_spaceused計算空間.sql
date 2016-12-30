
--建立 table及連續新增資料, 並持續查詢 sp_spaceused 程序 監看空間消耗情形
use sample1
go

sp_spaceused
sp_spaceused t1

create table t1 (id char(200))
ON [PRIMARY]

insert into t1 values ('a');
insert into t1 select * from t1;

drop table t1

