ms-help://MS.SQLCC.v10/MS.SQLSVR.v10.zh-CHT/s10de_6tsql/html/00f377f1-cc3e-4eac-be47-b3e3f80267c9.htm

USE AdventureWorks;
GO
SELECT length = DATALENGTH(Name), Name, length2 = DATALENGTH('����r')
FROM Production.Product
ORDER BY Name;
GO
 
create table t1(c1 char(10),
                c2 varchar(10)
)      

insert into t1 values ( '����r', '����r');
insert into t1 values ( '����r�^', '����r�^');
insert into t1 values ( '����r�^��', '����r�^��');

insert into t1 values ( '����r�^��r', '����r�r');
      
      
select c1,length = DATALENGTH(c1), c2, length2 = DATALENGTH(c2), length3 = DATALENGTH('abcde')
from  t1;    