use Northwind 
go
drop view v2
--CECJ02�ǭ�
-- �g�@��view�A�u��b�P��1~5���դ�09:00~17:59�W�Z�ɬq�A�~��d��Employees
create view v2
as
select EmployeeID, LastName , Country  
from employees
where (DATEPART(HOUR,getdate()) between 9 and 17) and DATEPART(dw,getdate())-1 between 1 and 4


select  DATEPART(HOUR,getdate())


select *
from v2

-- �P���ɥR
select '�g'
     + SUBSTRING('��@�G�T�|����',DATEPART(dw,getdate()),1)

select DATEPART(dw,getdate())-1