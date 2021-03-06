--查詢 誰的 salary 最低 ?

  
  SELECT  last_name,  job_id,  salary
  FROM     employees
  WHERE  salary  = 
                  (SELECT  MIN (salary)
                   FROM     employees );
                   
--查詢 誰的 salary 大於平均 ?

--改寫 SUBQUERY 將 AVG 寫於 SELECT 

  SELECT  last_name,  job_id,  salary, (SELECT  AVG (salary)
                                        FROM     employees )
  FROM     employees
  WHERE  salary  > 
                  (SELECT  AVG (salary)
                   FROM     employees );
                   
METHOD 2  改寫為 JOIN

  SELECT  last_name,  job_id,  salary, AVGS
  FROM     employees CROSS join  (SELECT  AVG (salary) AVGS
                                  FROM     employees ) AV
  WHERE  salary  > AVGS;
                   
METHOD 3 找出薪資大於 各部門平均


                   
 SELECT  E.last_name,  E.job_id,  E.salary, E.DEPARTMENT_ID ,AVGS
  FROM     employees E INNER join  (SELECT  DEPARTMENT_ID, AVG (salary) AVGS
                                  FROM     employees 
                                  GROUP BY DEPARTMENT_ID ) AV
 on E.DEPARTMENT_ID = AV.DEPARTMENT_ID 
  WHERE  E.salary  > AVGS;
                   
                                
                   