CREATE TABLE copy_emp
    ( employee_id    INT ,
      first_name     VARCHAR(20)  ,
      last_name      VARCHAR(25),
      email          VARCHAR(25) ,
      phone_number   VARCHAR(20),
      hire_date      DATE	,
      job_id         VARCHAR(10) ,
      salary         INT   , 
      commission_pct INT    ,
      manager_id     INT    ,
      department_id  INT 
);

CREATE TABLE SALES_REPS (
 ID               INT NOT NULL,
 NAME             VARCHAR(20),
 SALARY           DECIMAL(8,2),
 COMMISSION_PCT   DECIMAL(2,2)
);

