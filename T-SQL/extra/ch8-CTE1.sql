--��X�`�~���X���B�̰�������

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



