--Scarlar Subquery �C�X�����W�٤θӳ����̰��~�� (�]�i��JOIN ��g)

use adventureworks
go
                  

SELECT   d.department_name  , (SELECT  max(salary)
                               FROM    employees  e
                               WHERE   e.department_id  = d.department_id ) 
FROM     departments  d


--JOIN ��g
SELECT  d.department_name  ,  maxsal
FROM    departments  d JOIN (SELECT  department_id, max(salary) maxsal
                             FROM     employees 
                             GROUP BY department_id 
                             )  e
ON e.department_id  = d.department_id
