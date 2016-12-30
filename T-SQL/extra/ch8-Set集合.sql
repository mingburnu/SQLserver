--顯示員工現職及經歷, 重複值只顯示一次 28 筆 (20 + (10-2) 筆 交集換為原職務)


SELECT employee_id,  job_id
FROM   employees
UNION
SELECT employee_id,  job_id
FROM   job_history;


--顯示所有員工現職及經歷 30筆 (20+ 10)

SELECT employee_id,  job_id,  department_id
FROM   employees
UNION  ALL
SELECT employee_id, job_id, department_id
FROM   job_history
ORDER  BY   employee_id;


--顯示員工目其現職與前職務相同者 (2人)

SELECT  employee_id,  job_id
FROM    employees
INTERSECT
SELECT  employee_id,  job_id
FROM    job_history;

--顯示員工未曾更換過職務者 (18筆 非全指未更換過職務 指 不曾調回現值者 20-2 = 18)

SELECT employee_id,job_id
FROM   employees 
EXCEPT
SELECT employee_id,job_id
FROM   job_history;


-- 7筆 調動過職務 只管 employee_id 不管 job_id
SELECT distinct employee_id
FROM   job_history;


--5筆 101,102, 176, 200, 201 有換過職務且現職
SELECT employee_id
FROM   employees
intersect
SELECT employee_id
FROM   job_history;


--15筆 (20 - 5 筆交集 = 15) 未換過職務 且現職
SELECT employee_id
FROM   employees
except
SELECT employee_id
FROM   job_history;

