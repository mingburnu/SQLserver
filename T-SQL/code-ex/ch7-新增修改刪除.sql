--�s�W���

INSERT INTO departments VALUES ( 71, 'Public Relations', 100, 1700 );

--�s�W�`�������~1  ���ƥD��
INSERT INTO departments VALUES ( 71, 'aaa', 100, 1700 );

--�s�W�`�������~2 �䤣��~����
INSERT INTO departments VALUES ( 72, 'aaa', 100, 1701 );

select * from DEPARTMENTS
select * from LOCATIONS 

--�s�W������� 
 INSERT INTO departments ( department_id, department_name )
              VALUES  ( 31, 'Purchasing' );

--�s�W��Ʊj���� NULL��
INSERT  INTO  departments  VALUES  ( 101, 'Finance', NULL, NULL );

--�@���s�W�h��                         
drop table t1
create table t1(id int, n char(20))  
go
                       
insert into t1 values (1,'aa'), 
                      (2,'bb'),
                      (3,'cc')
select * from t1


--�ƻs��浲�c

SELECT employee_id id,  last_name name ,  salary,  commission_pct
INTO   sales_reps
FROM   employees
WHERE  1=2;

--�q�d�ߤ��s�W���
INSERT  INTO  sales_reps ( id,  name,  salary,  commission_pct )
SELECT  employee_id,  last_name,  salary,  commission_pct
FROM    employees
WHERE   job_id  LIKE  '%REP%' ;

--
select * from sales_reps

--
select * from departments
select employee_id, department_id from employees

--��s���
 UPDATE  employees
 SET     department_id  =  60
 WHERE   employee_id  =  178;

--��s���2 �l�d��
UPDATE employees
SET    job_id = (SELECT job_id 
                 FROM   employees 
                 WHERE  employee_id  =  205 ), 
       salary = (SELECT salary 
                 FROM   employees 
                 WHERE  employee_id  =  205 ) 
WHERE  employee_id =  141;

--�R��
 DELETE FROM   employees
 WHERE  employee_id  =  141;


--�R��2
DELETE FROM employees
WHERE  department_id  = (SELECT  department_id
                         FROM    departments
                         WHERE  department_name  LIKE  '%Payroll%' );
                         

--truncate table

TRUNCATE TABLE sales_reps;