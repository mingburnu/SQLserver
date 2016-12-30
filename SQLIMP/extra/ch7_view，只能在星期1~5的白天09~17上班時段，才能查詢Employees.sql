use Northwind 
go
drop view v2
--CECJ02學員
-- 寫一個view，只能在星期1~5的白天09:00~17:59上班時段，才能查詢Employees
create view v2
as
select EmployeeID, LastName , Country  
from employees
where (DATEPART(HOUR,getdate()) between 9 and 17) and DATEPART(dw,getdate())-1 between 1 and 4


select  DATEPART(HOUR,getdate())


select *
from v2

-- 星期補充
select '週'
     + SUBSTRING('日一二三四五六',DATEPART(dw,getdate()),1)

select DATEPART(dw,getdate())-1