select * from departments

SELECT  department_id, department_name
From departments


exec sp_columns departments

  SELECT  last_name,  salary,  12 * salary + 100
  FROM     employees;


  SELECT  last_name,  salary,  12 * (salary + 100)
  FROM     employees;


print 59&12
select 59&12

SELECT  last_name,  job_id,  salary,  commission_pct
  FROM     employees;


--alias

SELECT  last_name  AS  '姓 名',  commission_pct   comm
  FROM     employees;
  
  --concated
  
  SELECT     last_name  +  job_id  AS  "Employees"
  FROM 	    employees;

--literal
SELECT  last_name   +  ' study at EEIT'
FROM     employees;


--without distict

select last_name,  department_id 
from employees

--VS 
 
select *
from departments