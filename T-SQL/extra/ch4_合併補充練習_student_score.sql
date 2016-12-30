-- student �ǭ���ƪ� 
-- course  �ǭ��U�즨�Z

--** ��� 23 �ǭ��� �C�H�ҤT��, ���@�ǭ� 3�쳣�S�� , �S�n�O���� �D�n�O�� �s��
--** ���@�I�h 10���ǭ��u�Ҩ��   �o�� �������� �N�|����ĳ

--�d�X�̰�/�̧C/���� �����ƬO�X�� (���ި��@��)
--�C�X�U��̰��̧C/���������ƬO�X��

--�C�X�ǭ��m�W�ΦU�즨�Z
--�C�X�ǭ��m�W�ΦU�즨�Z (���ѥ[�Ҹժ��ǭ��]�n�C�X)


--�d�X�ǭ��`���Ƴ̰� (�t�m�W)
--�d�X�ǭ����Ƥj���`������������ (�t�m�W,�ӤH����)
--�d�X�ǭ����Ƥj���`������������ (�t�m�W,�ӤH����,��������)


--�i��
--�d�X�ǭ����@����Ƥj���`������������ (�t�m�W,�ӤH����), ���@��j�� �`����
--�d�X�ǭ��U����Ƥj��Ӭ쥭���������� (�t�m�W,�ӤH����), ���@��j��U�� �`����

--�d�X�ǭ����Ƥj��U�쥭���������� (�t�m�W,�ӤH����)
--PIVOT �N�ǭ��U�즨�Z�ন PIVOT��� (�t�Ǹ�,�m�W,�U����� 3�����)



use DB01    --�Y �w�ǫD Chinese_Taiwan �h�t�� DB

go

drop table course;
drop table student;
go

create table student
( id    int        PRIMARY KEY,   --�Ǹ�
  name  char(20),                 --�m�W
  bdate date,
  tel   char(20)
);

create table course
( id    int     ,   --�Ǹ�
  name  char(20),   --�ҦW
  score int,        --����
  FOREIGN KEY(id) REFERENCES student(id) 
);
go



insert into student values ( 1, '���I��','1983-04-21','09205556781');
insert into student values ( 2, '�d�y��','1983-09-23','09205556789');
insert into student values ( 3, '�}�ŭY','1983-08-25','09205556785');
insert into student values ( 4, '�����z','1983-07-27','09205556783');
insert into student values ( 5, '²ö��','1983-05-29','09205556789');
insert into student values ( 6, '�C��','1983-06-22','09205556789');
insert into student values ( 7, '�L�|�w','1983-03-24','09205556786');
insert into student values ( 8, '���T��','1983-01-26','09205556789');
insert into student values ( 9, '���f��','1983-02-28','09205556789');
insert into student values (10, '���Ǵ�','1983-11-20','09205556782');
insert into student values (11, '���Z��','1983-10-21','09205556789');
insert into student values (12, '���H�d','1983-04-23','09205556789');
insert into student values (13, '���v��','1983-05-25','09205556788');
insert into student values (14, '�B�F�v','1983-07-23','09205556789');
insert into student values (15, '�����o','1983-02-27','09205556783');
insert into student values (16, '�G�J��','1983-04-23','09205556789');
insert into student values (17, '�g�q��','1983-06-29','09205556781');
insert into student values (18, '���~��','1983-04-22','09205556780');
insert into student values (19, '�����m','1983-08-24','09205556789');
insert into student values (20, '���ζ�','1983-04-26','09205556787');
insert into student values (21, '���q��','1983-09-28','09205556789');
insert into student values (22, '�G���A','1983-04-20','09205556789');
insert into student values (23, '���㨰','1983-05-25','09205556788');
go

insert into course values ( 1,'JAVA',85);
insert into course values ( 2,'JAVA',80);
insert into course values ( 3,'JAVA',80);
insert into course values ( 4,'JAVA',85);
insert into course values ( 5,'JAVA',75);
insert into course values ( 6,'JAVA',70);
insert into course values ( 7,'JAVA',92);
insert into course values ( 8,'JAVA',85);
insert into course values ( 9,'JAVA',83);
insert into course values (11,'JAVA',87);
insert into course values (12,'JAVA',85);
insert into course values (13,'JAVA',86);
insert into course values (14,'JAVA',85);
insert into course values (15,'JAVA',84);
insert into course values (16,'JAVA',75);
insert into course values (17,'JAVA',81);
insert into course values (18,'JAVA',85);
insert into course values (19,'JAVA',79);
insert into course values (20,'JAVA',85);
insert into course values (21,'JAVA',78);
insert into course values (22,'JAVA',85);

go

insert into course values ( 1,'�q��',81);
insert into course values ( 2,'�q��',80);
insert into course values ( 3,'�q��',82);
insert into course values ( 4,'�q��',84);
insert into course values ( 5,'�q��',64);
insert into course values ( 6,'�q��',83);
insert into course values ( 7,'�q��',85);
insert into course values ( 8,'�q��',87);
insert into course values ( 9,'�q��',86);
insert into course values (10,'�q��',85);
insert into course values (11,'�q��',82);
insert into course values (12,'�q��',81);
insert into course values (13,'�q��',89);
insert into course values (14,'�q��',85);
insert into course values (15,'�q��',88);
insert into course values (16,'�q��',87);
insert into course values (17,'�q��',86);
insert into course values (18,'�q��',85);
insert into course values (19,'�q��',84);
insert into course values (20,'�q��',82);
insert into course values (21,'�q��',85);
insert into course values (22,'�q��',81);

go

insert into course values ( 1,'T-SQL',85);
insert into course values ( 2,'T-SQL',85);
insert into course values ( 3,'T-SQL',80);
insert into course values ( 4,'T-SQL',85);
insert into course values ( 5,'T-SQL',85);
insert into course values ( 6,'T-SQL',83);
insert into course values ( 7,'T-SQL',85);
insert into course values ( 8,'T-SQL',82);
insert into course values ( 9,'T-SQL',91);
insert into course values (10,'T-SQL',85);
insert into course values (11,'T-SQL',85);
insert into course values (12,'T-SQL',87);
insert into course values (13,'T-SQL',85);
insert into course values (14,'T-SQL',85);
insert into course values (15,'T-SQL',86);
insert into course values (16,'T-SQL',85);
insert into course values (17,'T-SQL',85);
insert into course values (18,'T-SQL',89);
insert into course values (19,'T-SQL',85);
insert into course values (20,'T-SQL',88);
insert into course values (21,'T-SQL',85);
insert into course values (22,'T-SQL',84);
go
