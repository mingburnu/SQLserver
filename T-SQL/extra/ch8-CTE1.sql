--找出總薪資支出金額最高的部門

use adventureworks
go

WITH  payroll  (deptno , totalpay )  
AS
  ( SELECT department_id , SUM(salary) 
    FROM   employees
    GROUP  BY  department_id
  ) 
SELECT  deptno
FROM    payroll
WHERE   totalpay  =  ( SELECT MAX(totalpay) 
                       FROM   payroll 
                     )



