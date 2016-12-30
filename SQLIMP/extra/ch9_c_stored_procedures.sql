
--建 procedure 帶參數 依輸入之 員工編號查姓名
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

--執行 查出 員編 2, 3號之 姓名
exec p1  2
exec p1  3

--查 procedure 內容

sp_helptext p1

--查 procedure 相依物件
sp_depends p1

--查 procedure 基本資訊
sp_stored_procedures p1

--使用 sys.modules 查內容

select * from sys.objects
where name = 'p1'


select definition  from sys.sql_modules 
where definition like '%p1%'


SELECT name, mo.object_id, definition 
FROM   sys.sql_modules mo JOIN sys.objects ob
ON     mo.object_id = ob.object_id AND TYPE = 'P'
where name = 'p1'
