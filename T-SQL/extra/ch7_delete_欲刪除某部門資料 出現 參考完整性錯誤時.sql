--欲刪除 某部門資料 出現 參考完整性錯誤時 (因employees子表有員工id 參考到此sales部門 80)
delete from DEPARTMENTS where  DEPARTMENT_NAME = 'Sales'

--刪除歷史資料 - 先依序刪除相依的資料 (員工 176 曾是此部門員工)
delete from JOB_HISTORY where DEPARTMENT_ID = ( select DEPARTMENT_ID from DEPARTMENTS 
                                               where  DEPARTMENT_NAME = 'Sales'
                                               )


--刪除員工是此部門主管的資料 (員工 174, 176 之manager 為 149) 或將員工之主管換人為100
delete from EMPLOYEES where manager_id = ( select manager_ID from DEPARTMENTS 
                                               where  DEPARTMENT_NAME = 'Sales'
                                               )
                                               
 update EMPLOYEES set manager_id = 100
 where manager_id = ( select manager_ID from DEPARTMENTS 
                                               where  DEPARTMENT_NAME = 'Sales'
                                               )                                               
--修改部門主管資料為 NULL
update DEPARTMENTS set MANAGER_ID = null  where  DEPARTMENT_NAME = 'Sales'

--刪除員工是此部門主管的資料或調離此部門80到90
delete from EMPLOYEES where DEPARTMENT_ID = ( select DEPARTMENT_ID from DEPARTMENTS 
                                               where  DEPARTMENT_NAME = 'Sales'
                                               )

 update EMPLOYEES set department_id = 90 where DEPARTMENT_ID = ( select DEPARTMENT_ID from DEPARTMENTS 
                                               where  DEPARTMENT_NAME = 'Sales'
                                               )
--刪除部門資料
delete from DEPARTMENTS where  DEPARTMENT_NAME = 'Sales'
          
          
--test
--Sales 之department_id = 80

select DEPARTMENT_ID from DEPARTMENTS where  DEPARTMENT_NAME = 'Sales'
              
select * from JOB_HISTORY where DEPARTMENT_ID = 80                                          

select employee_id, manager_ID, DEPARTMENT_ID from employees
where  DEPARTMENT_id = 80

select * from departments