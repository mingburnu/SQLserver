--���R�� �Y������� �X�{ �Ѧҧ���ʿ��~�� (�]employees�l�����uid �ѦҨ즹sales���� 80)
delete from DEPARTMENTS where  DEPARTMENT_NAME = 'Sales'

--�R�����v��� - ���̧ǧR���̪ۨ���� (���u 176 ���O���������u)
delete from JOB_HISTORY where DEPARTMENT_ID = ( select DEPARTMENT_ID from DEPARTMENTS 
                                               where  DEPARTMENT_NAME = 'Sales'
                                               )


--�R�����u�O�������D�ު���� (���u 174, 176 ��manager �� 149) �αN���u���D�޴��H��100
delete from EMPLOYEES where manager_id = ( select manager_ID from DEPARTMENTS 
                                               where  DEPARTMENT_NAME = 'Sales'
                                               )
                                               
 update EMPLOYEES set manager_id = 100
 where manager_id = ( select manager_ID from DEPARTMENTS 
                                               where  DEPARTMENT_NAME = 'Sales'
                                               )                                               
--�קﳡ���D�޸�Ƭ� NULL
update DEPARTMENTS set MANAGER_ID = null  where  DEPARTMENT_NAME = 'Sales'

--�R�����u�O�������D�ު���Ʃν���������80��90
delete from EMPLOYEES where DEPARTMENT_ID = ( select DEPARTMENT_ID from DEPARTMENTS 
                                               where  DEPARTMENT_NAME = 'Sales'
                                               )

 update EMPLOYEES set department_id = 90 where DEPARTMENT_ID = ( select DEPARTMENT_ID from DEPARTMENTS 
                                               where  DEPARTMENT_NAME = 'Sales'
                                               )
--�R���������
delete from DEPARTMENTS where  DEPARTMENT_NAME = 'Sales'
          
          
--test
--Sales ��department_id = 80

select DEPARTMENT_ID from DEPARTMENTS where  DEPARTMENT_NAME = 'Sales'
              
select * from JOB_HISTORY where DEPARTMENT_ID = 80                                          

select employee_id, manager_ID, DEPARTMENT_ID from employees
where  DEPARTMENT_id = 80

select * from departments