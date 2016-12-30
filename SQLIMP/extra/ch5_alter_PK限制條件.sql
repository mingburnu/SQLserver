
--建完table後 再補加 PK

create table t12
 (id   int,
  name char(10))

--add PK  (須 not null 及 PK)

alter table t12 alter column id int not null

alter table t12 add constraint pk_t12_id primary key (id)

--刪除限制條件 PK, 先查詢 constraint_name
--查詢 sys.check_constraint、sys.default_constraints、sys.key_constraints 
--和   sys.foreign_keys 目錄檢視，來判斷條件約束的使用者自訂名稱或系統提供的名稱。

sp_help t12   
或
select * from sys.key_constraints 
where type = 'PK' and
parent_object_id = (select object_id  from sys.tables 
             where name = 't12'
            )
            


alter table t12 drop constraint pk_t12_id 




drop table t12


--圖形介面加PK -右鍵資料表名/設計, 語法是先建 tmp表再 DROP table再重建
create table t13
 (  id int,
    name  char(10)    
 )   

--產生之指令碼

/* 為了避免任何可能發生資料遺失的問題，您應該先詳細檢視此指令碼，然後才能在資料庫設計工具環境以外的位置執行。*/
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



