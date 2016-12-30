--Scarlar Subquery 列出部門名稱及該部門最高薪資 (也可用JOIN 改寫)

use adventureworks
go
                  

SELECT   d.department_name  , (SELECT  max(salary)
                               FROM    employees  e
                               WHERE   e.department_id  = d.department_id ) 
FROM     departments  d


--JOIN 改寫
SELECT  d.department_name  ,  maxsal
FROM    departments  d JOIN (SELECT  department_id, max(salary) maxsal
                             FROM     employees 
                             GROUP BY department_id 
                             )  e
ON e.department_id  = d.department_id
