--使用者自訂資料類型方式 2 sp_addtype 及 create type ; 建議逐漸採用後者

--例1 **Creating a User-Defined Data Type 
USE Northwind
GO
EXEC  sp_addtype  city,    'nvarchar(15)', NULL
EXEC  sp_addtype  region,  'nvarchar(15)', NULL
EXEC  sp_addtype  country, 'nvarchar(15)', NULL
GO

--刪除類型 Dropping a User-Defined Data Type  
USE Northwind
GO
EXEC sp_droptype city
GO

--建議以 CREATE TYPE 取代 sp_addtype
--例2 自訂類型
CREATE TYPE state from varchar(2) NOT NULL

--建立表格 欄位為 自訂類型
create table t2(id    int,
                city  state)  --自訂類型
GO

drop table t2     --先刪表格
drop type state   --才能刪 自訂類型

