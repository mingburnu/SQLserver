--琩高 街 salary 程 ?

  
  SELECT  last_name,  job_id,  salary
  FROM     employees
  WHERE  salary  = 
                  (SELECT  MIN (salary)
                   FROM     employees );
                   
--琩高 街 salary キА ?

--э糶 SUBQUERY 盢 AVG 糶 SELECT 

  SELECT  last_name,  job_id,  salary, (SELECT  AVG (salary)
                                        FROM     employees )
  FROM     employees
  WHERE  salary  > 
                  (SELECT  AVG (salary)
                   FROM     employees );
                   
METHOD 2  э糶 JOIN

  SELECT  last_name,  job_id,  salary, AVGS
  FROM     employees CROSS join  (SELECT  AVG (salary) AVGS
                                  FROM     employees ) AV
  WHERE  salary  > AVGS;
                   
METHOD 3 т羱戈 场キА


                   
 SELECT  E.last_name,  E.job_id,  E.salary, E.DEPARTMENT_ID ,AVGS
  FROM     employees E INNER join  (SELECT  DEPARTMENT_ID, AVG (salary) AVGS
                                  FROM     employees 
                                  GROUP BY DEPARTMENT_ID ) AV
 on E.DEPARTMENT_ID = AV.DEPARTMENT_ID 
  WHERE  E.salary  > AVGS;
                   
                                
                   