--Rollup

SELECT   department_id DEPTID, job_id JOB, SUM(salary)  AS  SUMSAL
FROM     employees
WHERE    department_id < 50
GROUP  BY  ROLLUP ( department_id,  job_id ) ;


--Cube

SELECT   department_id DEPTID, job_id JOB, SUM(salary)  AS  SUMSAL
FROM     employees
WHERE    department_id < 50
GROUP  BY  CUBE ( department_id,  job_id ) ;

--GROUPING

SELECT   department_id DEPTID, job_id JOB, SUM(salary)  AS  SUMSAL,
         GROUPING(department_id) GRP_DEPT,
         GROUPING(job_id) GRP_JOB
FROM     employees
WHERE    department_id < 50
GROUP  BY  ROLLUP ( department_id,  job_id ) ;
