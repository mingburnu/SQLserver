----CTE ½d¨Ò1
USE northwind
GO
WITH inventory
AS
 (
   SELECT productid, SUM(quantity) totalqty
   FROM   [Order Details]
   GROUP BY productid
  )
SELECT productid, totalqty
FROM   inventory
where totalqty = ( SELECT MAX(totalqty)
                   FROM   inventory
                 )

--§ï¼g
select   productid, SUM(quantity) totalqty
from     [Order Details]
GROUP BY productid
having SUM(quantity) =  ( select  top 1 SUM(quantity) totalqty
                         from     [Order Details]
                         GROUP BY productid
                         order by  totalqty desc
                        )
