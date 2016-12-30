use Northwind 
go

create view v1
as
select EmployeeID, LastName , Country  
from employees
where Country = 'UK'



select * 
from  v1
where employeeid = 6


--Same as
select * 
from    (
             select EmployeeID, LastName , Country  
             from employees
             where Country = 'UK'

         ) o



--檢查相依性

EXEC sp_depends  v1
EXEC sp_depends  Employees

--查詢 view 內容

EXEC sp_helptext v1

