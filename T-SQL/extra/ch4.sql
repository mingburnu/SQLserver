 --avg
  SELECT  AVG ( salary ),  MAX ( salary ),   MIN ( salary ),  SUM ( salary )
  FROM     employees;

--error
  SELECT  last_name, AVG ( salary ),  MAX ( salary ),   MIN ( salary ),  SUM ( salary )
  FROM     employees;

--count
  SELECT  COUNT ( * ),  COUNT ( commission_pct ),  COUNT ( last_name )
  FROM     employees;


  SELECT  last_name,  commission_pct 
  FROM     employees;


--avg

--count
  SELECT AVG( commission_pct ),  AVG( ISNULL(commission_pct,0)),
         sum (commission_pct ), 
         sum (commission_pct )/count(commission_pct )
  FROM     employees;
  
  --group
    SELECT  department_id,  AVG ( salary ), SUM ( salary )
  FROM     employees
  GROUP   BY  department_id;

  --group without name
    SELECT     AVG ( salary ), SUM ( salary ),COUNT(*)
  FROM     employees
  GROUP   BY  department_id;

  --error group w
    SELECT  last_name,  AVG ( salary ), SUM ( salary )
  FROM     employees
  GROUP   BY  department_id;
  
  
    --group 2
    SELECT   department_id, job_id,  AVG ( salary ), SUM ( salary ),COUNT(*)
  FROM     employees
  GROUP   BY  department_id,  job_id
  order by department_id,  job_id;

--advanced group

    SELECT   department_id, job_id,  AVG ( salary ), SUM ( salary ),COUNT(*)
  FROM     employees
  GROUP   BY  ROLLUP( department_id,  job_id)
  order by department_id,  job_id;


--error filter
  SELECT  department_id,   AVG ( salary )
  FROM     employees
  WHERE  AVG ( salary ) >  8000
  GROUP   BY  department_id;
  
  --before fileter
    SELECT  department_id,   AVG ( salary )
  FROM     employees
  GROUP   BY  department_id;

--having filter
  SELECT  department_id,   AVG ( salary )
  FROM     employees
  GROUP   BY  department_id
 HAVING  AVG ( salary ) >  8000
 
 --where and having ¨Ã¥Î
   SELECT  department_id,   AVG ( salary )
  FROM     employees
  where DEPARTMENT_ID >= 50
  GROUP   BY  department_id
 HAVING  AVG ( salary ) >  8000