--��ܭ��u�{¾�θg��, ���ƭȥu��ܤ@�� 28 �� (20 + (10-2) �� �涰������¾��)


SELECT employee_id,  job_id
FROM   employees
UNION
SELECT employee_id,  job_id
FROM   job_history;


--��ܩҦ����u�{¾�θg�� 30�� (20+ 10)

SELECT employee_id,  job_id,  department_id
FROM   employees
UNION  ALL
SELECT employee_id, job_id, department_id
FROM   job_history
ORDER  BY   employee_id;


--��ܭ��u�ب�{¾�P�e¾�ȬۦP�� (2�H)

SELECT  employee_id,  job_id
FROM    employees
INTERSECT
SELECT  employee_id,  job_id
FROM    job_history;

--��ܭ��u�����󴫹L¾�Ȫ� (18�� �D�������󴫹L¾�� �� �����զ^�{�Ȫ� 20-2 = 18)

SELECT employee_id,job_id
FROM   employees 
EXCEPT
SELECT employee_id,job_id
FROM   job_history;


-- 7�� �հʹL¾�� �u�� employee_id ���� job_id
SELECT distinct employee_id
FROM   job_history;


--5�� 101,102, 176, 200, 201 �����L¾�ȥB�{¾
SELECT employee_id
FROM   employees
intersect
SELECT employee_id
FROM   job_history;


--15�� (20 - 5 ���涰 = 15) �����L¾�� �B�{¾
SELECT employee_id
FROM   employees
except
SELECT employee_id
FROM   job_history;

