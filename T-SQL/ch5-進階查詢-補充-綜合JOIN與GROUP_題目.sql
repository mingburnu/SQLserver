use DB01
go

  
--�p�� �U����(department_id) ���� �� �`�X salary,�H��
--q1
  SELECT   department_id, avg(salary)
  FROM    employees
  GROUP   BY  department_id;


  select * from departments


--�p�� �U�����W��(department_name) ���� �� �`�X salary ,�H��


--error
  SELECT    department_name, avg(salary)
  FROM    employees
  GROUP   BY  department_name


  --q2
 SELECT    department_name, avg(salary)
  FROM    employees JOIN  departments
  ON      employees.DEPARTMENT_ID  = DEPARTMENTS.DEPARTMENT_ID 
  GROUP   BY  department_name


  --error
 SELECT    department_id, department_name, avg(salary)
  FROM    employees JOIN  departments
  ON      employees.DEPARTMENT_ID  = DEPARTMENTS.DEPARTMENT_ID 
  GROUP   BY  department_name


--q3    
 SELECT    departments.department_id, department_name, avg(salary)
  FROM    employees JOIN  departments
  ON      employees.DEPARTMENT_ID  = DEPARTMENTS.DEPARTMENT_ID 
  GROUP   BY   departments.department_id,department_name






  SELECT  
  FROM    
  ON      
  GROUP   BY 
  

--�p�� �U�����W��(department_id, department_name) ���� �� �`�X salary ,�H��

  SELECT  
  FROM    
  ON     
  GROUP   BY  
    

--�B�~�m�� 
--�d�� �Ȥ�q����Ӹ��

       Customers       (CustomerID) 
       Orders          (OrderID, CustomerID)
       [Order Details] (OrderID, ProductID)
       Products        (ProductID)

USE Northwind
go



