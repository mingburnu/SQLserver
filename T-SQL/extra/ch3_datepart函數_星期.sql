sp_helplanguage



--�P���@ �O ��1�� DAETFIRST 1  ,�Y�P����O 1 �h DAETFIRST 7 
use DB01

set language �c�餤��
SET DATEFIRST  1

select @@datefirst

--�̬P���X�Ƨ�
select hire_date, MONTH(hire_date), DATENAME(MONTH,hire_date) , DATENAME(dw,hire_date), DATEPART(dw,hire_date) 
from employees
order by  DATEPART(dw,hire_date) 


hire_date                                                                            
---------- ----------- ------------------------------ ------------------------------ -----------
1999-05-24 5           ����                             �P���@                            1
1991-05-21 5           ����                             �P���G                            2
1999-11-16 11          �Q�@��                           �P���G                            2
1995-10-17 10          �Q��                             �P���G                            2
:
1996-02-17 2           �G��                             �P����                            6
2000-01-29 1           �@��                             �P����                            6
1996-05-11 5           ����                             �P����                            6
1999-02-07 2           �G��                             �P����                            7
1997-08-17 8           �K��                             �P����                            7
1998-03-15 3           �T��                             �P����                            7

-- SET DATEFIRST to U.S. English default value of 7.
SET DATEFIRST 7;

SELECT CAST('1999-1-1' AS datetime2) AS SelectDate
    ,DATEPART(dw, '1999-1-1') AS DayOfWeek;
-- January 1, 1999 is a Friday. Because the U.S. English default 
-- specifies Sunday as the first day of the week, DATEPART of 1999-1-1
-- (Friday) yields a value of 6, because Friday is the sixth day of the 
-- week when you start with Sunday as day 1.

SET DATEFIRST 3;
-- Because Wednesday is now considered the first day of the week,
-- DATEPART now shows that 1999-1-1 (a Friday) is the third day of the 
-- week. The following DATEPART function should return a value of 3.
SELECT CAST('1999-1-1' AS datetime2) AS SelectDate
    ,DATEPART(dw, '1999-1-1') AS DayOfWeek;
GO