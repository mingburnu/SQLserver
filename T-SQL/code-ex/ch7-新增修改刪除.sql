--新增資料

INSERT INTO departments VALUES ( 71, 'Public Relations', 100, 1700 );

--新增常見的錯誤1  重複主鍵
INSERT INTO departments VALUES ( 71, 'aaa', 100, 1700 );

--新增常見的錯誤2 找不到外部鍵
INSERT INTO departments VALUES ( 72, 'aaa', 100, 1701 );

select * from DEPARTMENTS
select * from LOCATIONS 

--新增部份欄位 
 INSERT INTO departments ( department_id, department_name )
              VALUES  ( 31, 'Purchasing' );

--新增資料強迫補 NULL值
INSERT  INTO  departments  VALUES  ( 101, 'Finance', NULL, NULL );

--一次新增多筆                         
drop table t1
create table t1(id int, n char(20))  
go
                       
insert into t1 values (1,'aa'), 
                      (2,'bb'),
                      (3,'cc')
select * from t1


--複製表格結構

SELECT employee_id id,  last_name name ,  salary,  commission_pct
INTO   sales_reps
FROM   employees
WHERE  1=2;

--從查詢中新增資料
INSERT  INTO  sales_reps ( id,  name,  salary,  commission_pct )
SELECT  employee_id,  last_name,  salary,  commission_pct
FROM    employees
WHERE   job_id  LIKE  '%REP%' ;

--
select * from sales_reps

--
select * from departments
select employee_id, department_id from employees

--更新資料
 UPDATE  employees
 SET     department_id  =  60
 WHERE   employee_id  =  178;

--更新資料2 子查詢
UPDATE employees
SET    job_id = (SELECT job_id 
                 FROM   employees 
                 WHERE  employee_id  =  205 ), 
       salary = (SELECT salary 
                 FROM   employees 
                 WHERE  employee_id  =  205 ) 
WHERE  employee_id =  141;

--刪除
 DELETE FROM   employees
 WHERE  employee_id  =  141;


--刪除2
DELETE FROM employees
WHERE  department_id  = (SELECT  department_id
                         FROM    departments
                         WHERE  department_name  LIKE  '%Payroll%' );
                         

--truncate table

TRUNCATE TABLE sales_reps;