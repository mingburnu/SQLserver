use DB01
go

  
--璸衡 场(department_id) キА の 羆 salary,计
--q1
  SELECT   department_id, avg(salary)
  FROM    employees
  GROUP   BY  department_id;


  select * from departments


--璸衡 场嘿(department_name) キА の 羆 salary ,计


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
  

--璸衡 场嘿(department_id, department_name) キА の 羆 salary ,计

  SELECT  
  FROM    
  ON     
  GROUP   BY  
    

--肂絤策 
--琩高 め璹虫灿戈

       Customers       (CustomerID) 
       Orders          (OrderID, CustomerID)
       [Order Details] (OrderID, ProductID)
       Products        (ProductID)

USE Northwind
go



