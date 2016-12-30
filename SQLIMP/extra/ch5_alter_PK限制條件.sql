
--�ا�table�� �A�ɥ[ PK

create table t12
 (id   int,
  name char(10))

--add PK  (�� not null �� PK)

alter table t12 alter column id int not null

alter table t12 add constraint pk_t12_id primary key (id)

--�R��������� PK, ���d�� constraint_name
--�d�� sys.check_constraint�Bsys.default_constraints�Bsys.key_constraints 
--�M   sys.foreign_keys �ؿ��˵��A�ӧP�_����������ϥΪ̦ۭq�W�٩Ψt�δ��Ѫ��W�١C

sp_help t12   
��
select * from sys.key_constraints 
where type = 'PK' and
parent_object_id = (select object_id  from sys.tables 
             where name = 't12'
            )
            


alter table t12 drop constraint pk_t12_id 




drop table t12


--�ϧΤ����[PK -�k���ƪ�W/�]�p, �y�k�O���� tmp��A DROP table�A����
create table t13
 (  id int,
    name  char(10)    
 )   

--���ͤ����O�X

/* ���F�קK����i��o�͸�ƿ򥢪����D�A�z���ӥ��Բ��˵������O�X�A�M��~��b��Ʈw�]�p�u�����ҥH�~����m����C*/
BEGIN TRANSACTION
SET QUOTED_IDENTIFIER ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ANSI_NULLS ON
SET ANSI_PADDING ON
SET ANSI_WARNINGS ON
COMMIT
BEGIN TRANSACTION
GO
CREATE TABLE dbo.Tmp_t13
	(
	id int NOT NULL,
	name char(10) NULL
	)  ON [PRIMARY]
GO
ALTER TABLE dbo.Tmp_t13 SET (LOCK_ESCALATION = TABLE)
GO
IF EXISTS(SELECT * FROM dbo.t13)
	 EXEC('INSERT INTO dbo.Tmp_t13 (id, name)
		SELECT id, name FROM dbo.t13 WITH (HOLDLOCK TABLOCKX)')
GO
DROP TABLE dbo.t13
GO
EXECUTE sp_rename N'dbo.Tmp_t13', N't13', 'OBJECT' 
GO
ALTER TABLE dbo.t13 ADD CONSTRAINT
	PK_t13 PRIMARY KEY CLUSTERED 
	(
	id
	) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

GO
COMMIT



