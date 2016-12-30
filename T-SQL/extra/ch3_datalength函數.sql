ms-help://MS.SQLCC.v10/MS.SQLSVR.v10.zh-CHT/s10de_6tsql/html/00f377f1-cc3e-4eac-be47-b3e3f80267c9.htm

USE AdventureWorks;
GO
SELECT length = DATALENGTH(Name), Name, length2 = DATALENGTH('中文字')
FROM Production.Product
ORDER BY Name;
GO
 
create table t1(c1 char(10),
                c2 varchar(10)
)      

insert into t1 values ( '中文字', '中文字');
insert into t1 values ( '中文字英', '中文字英');
insert into t1 values ( '中文字英文', '中文字英文');

insert into t1 values ( '中文字英文字', '中文字字');
      
      
select c1,length = DATALENGTH(c1), c2, length2 = DATALENGTH(c2), length3 = DATALENGTH('abcde')
from  t1;    