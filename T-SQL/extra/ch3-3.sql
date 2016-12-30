select LOWER('ABCDEFG')

--lower ¹w³]  CI

  SELECT  employee_id,  last_name,  department_id
  FROM      employees 
  WHERE   last_name  =  'higgins';


  SELECT  employee_id,  last_name,  department_id
  FROM      employees 
  WHERE   last_name  =  'Higgins';
  
  
  select last_name, salary, ROUND(salary, -4)
  from employees
  
  --date
  
  select GETDATE()
  
  select MONTH(getdate())
  
  --isnull
    SELECT last_name, salary, commission_pct,  ISNULL ( commission_pct,  0 )
  FROM    employees;

--rank
SELECT  last_name,  SALARY , RANK() OVER  ( ORDER BY salary DESC )
FROM     employees
