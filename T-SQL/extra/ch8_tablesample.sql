--tablesampe�y�k ���Ǧ^�Ȫ� �ʤ��� �� ����

use AdventureWorks 
go

SELECT *
FROM   humanresources.employee  tablesample( 30 percent)


SELECT *
FROM   humanresources.employee  tablesample( 50 rows)
