
--PK 會自動加建 cluster index

create table t1
( 
 id int constraint pk_t1_id primary key
)
GO

--但仍可同一欄位再建 non-cluster index 怪

create unique index i2 on t1(id)

--無法直接刪除 須指定資料表名稱與索引名稱。
drop index dbo.i2
或
drop index t1.i2

--須 加 資料表名稱與索引名稱,  drop index 名 ON 表格, 可不須加  WITH ONLINE = OFF
DROP INDEX i2 ON t1

--DROP INDEX i2 ON t1 WITH ( ONLINE = OFF )