--��X���ƭ�  (�Τ@�s��), �S�]PK
drop table company
go
create table company
( id   int,
  name char(20)
);
go

--104, 106 �@��
insert into company values (101, '����|');
insert into company values (102, '����|');
insert into company values (103, '�굦�|');
insert into company values (104, '�ثn�Ȧ�');  --�u���@��,
insert into company values (105, '���H��');
insert into company values (106, '����');
insert into company values (105, '���ƻ�');    --�νs�g��
insert into company values (101, '���s��Ǭ�s�|');
insert into company values (101, '����|�@��');
insert into company values (102, '������s�|');
insert into company values (103, '��T�u�~���i�|');
go

--�d�X�Y�@���, �L�k�ݥX����

select * from  company where name = '����|'
select * from  company where name like '%��|%'
select * from  company where name like '%��%'

--���� by name
select  name, count(*)
from  company
group by name

--���� by id, �i������, ���������X��
select  id, count(*)
from  company
group by id

--����

select  id, count(*)
from  company
group by id
having count(*) > 1

--��X����

select *
from company
where id in ( select  id 
              from  company
              group by id
              having count(*) > 1
            )
		
