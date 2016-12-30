
--�� procedure �a�Ѽ� �̿�J�� ���u�s���d�m�W
use Northwind
go

create procedure p1 
  @empid int
as
begin
  select lastname, firstname
  from employees
  where EmployeeID = @empid 
  
end

--���� �d�X ���s 2, 3���� �m�W
exec p1  2
exec p1  3

--�d procedure ���e

sp_helptext p1

--�d procedure �̪ۨ���
sp_depends p1

--�d procedure �򥻸�T
sp_stored_procedures p1

--�ϥ� sys.modules �d���e

select * from sys.objects
where name = 'p1'


select definition  from sys.sql_modules 
where definition like '%p1%'


SELECT name, mo.object_id, definition 
FROM   sys.sql_modules mo JOIN sys.objects ob
ON     mo.object_id = ob.object_id AND TYPE = 'P'
where name = 'p1'
