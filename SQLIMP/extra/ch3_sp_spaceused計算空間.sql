
--�إ� table�γs��s�W���, �ë���d�� sp_spaceused �{�� �ʬݪŶ����ӱ���
use sample1
go

sp_spaceused
sp_spaceused t1

create table t1 (id char(200))
ON [PRIMARY]

insert into t1 values ('a');
insert into t1 select * from t1;

drop table t1

