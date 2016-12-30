--tablesampe語法 取傳回值的 百分比 或 筆數

use AdventureWorks 
go

SELECT *
FROM   humanresources.employee  tablesample( 30 percent)


SELECT *
FROM   humanresources.employee  tablesample( 50 rows)
