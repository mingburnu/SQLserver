
--ch3-1 �򥻬d��

--�d�ߩҦ���� 
SELECT   *
  FROM      departments


--�d�߳������ 
SELECT   department_id, location_id
  FROM      departments


--�ƾǹB��
SELECT  last_name,  salary,  12 * salary + 100
  FROM     employees;

  SELECT  last_name,  salary,  12 *  ( salary + 100 )
  FROM     employees;

--�줸�B��
  PRINT  59&12  

  PRINT  59|12   

  PRINT  59^12   

--NULL  Value (�ŭ�) 
  SELECT  last_name,  job_id,  salary,  commission_pct
  FROM     employees;

--NULL  Value �ƾǹB��
  SELECT  last_name,  12 * salary * commission_pct
  FROM     employees;

--���O�W (Alias)
SELECT  last_name  AS  name,  commission_pct   comm
  FROM     employees;

SELECT  last_name  "Name",  salary * 12  "Annual Salary"
  FROM     employees;

--Concatenation (��s�B��) 
  SELECT     last_name  +  job_id  AS  "Employees"
  FROM 	    employees;

--Literal Character Strings
SELECT  last_name   +  ' is a'  +  job_id   AS  "Employee Details"
FROM     employees;

--DISTINCT (�������_�C) 
SELECT  DISTINCT   department_id
  FROM     employees;
