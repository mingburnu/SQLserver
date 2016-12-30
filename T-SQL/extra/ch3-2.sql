--query dept= 90

SELECT  employee_id,  last_name,   job_id,   department_id
  FROM     employees
  WHERE  department_id  =  90;
  
 
 
select last_name, hire_date 
from EMPLOYEES
where HIRE_DATE = '1994-06-07'

--拖拉左邊物件

select LAST_NAME,HIRE_DATE
from dbo.EMPLOYEES
where HIRE_DATE = '1994-06-07'

--salary 語法

  SELECT  employee_id,  last_name,   job_id,   salary
  FROM     employees
  WHERE  salary  BETWEEN  2500  AND  3500;

--改寫
  SELECT  employee_id,  last_name,   job_id,   department_id
  FROM     employees
  WHERE  salary  >=  2500  AND  
         salary  <= 3500;
         
         --error
         
SELECT  employee_id,  last_name,   job_id,   salary
  FROM     employees
  WHERE  salary  BETWEEN  3500  AND  2500;

--ok
 SELECT  employee_id,  last_name,   job_id,   department_id
  FROM     employees
  WHERE  salary  <= 3500  AND  
         salary  >= 2500;
         
-list emp
  SELECT  employee_id,  last_name,  salary,  manager_id
  FROM     employees
  WHERE  manager_id  IN  ( 100,  101,  201 );

  --%
  SELECT	  first_name
  FROM 	  employees
  WHERE	  first_name  =   'S%';

-- is null
  SELECT  employee_id,  last_name,  salary,  manager_id
  FROM     employees
  where MANAGER_ID is null
  
-- is null error
  SELECT  employee_id,  last_name,  salary,  manager_id
  FROM     employees
  where MANAGER_ID = null
  
  --unless
  SET  ANSI_NULLS   On
SELECT  employee_id,  last_name,  salary,  manager_id
  FROM     employees
  where MANAGER_ID = null
  
  --and
    SELECT  employee_id,  last_name,  job_id,  salary
  FROM     employees
  WHERE  salary  >= 10000
  AND        job_id  LIKE  '%MAN%';

--or
  SELECT  employee_id,  last_name,  job_id,  salary
  FROM     employees
  WHERE  salary  >= 10000
  OR        job_id  LIKE  '%MAN%';

--and or
SELECT  last_name,  job_id,  salary
  FROM     employees
  WHERE  ( job_id  =  'SA_REP'
  OR           job_id  =  'AD_PRES')
  AND        salary  >  15000;

--order
  SELECT   last_name,  job_id,  department_id,  salary
  FROM      employees
  ORDER   BY last_name
