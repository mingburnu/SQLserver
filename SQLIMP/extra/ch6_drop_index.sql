
--PK �|�۰ʥ[�� cluster index

create table t1
( 
 id int constraint pk_t1_id primary key
)
GO

--�����i�P�@���A�� non-cluster index ��

create unique index i2 on t1(id)

--�L�k�����R�� �����w��ƪ�W�ٻP���ަW�١C
drop index dbo.i2
��
drop index t1.i2

--�� �[ ��ƪ�W�ٻP���ަW��,  drop index �W ON ���, �i�����[  WITH ONLINE = OFF
DROP INDEX i2 ON t1

--DROP INDEX i2 ON t1 WITH ( ONLINE = OFF )