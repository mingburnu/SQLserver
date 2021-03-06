/****** SSMS 中 SelectTopNRows 命令的指令碼  ******/
use Northwind 
go

SELECT OrderID,ProductID,UnitPrice,Quantity,Discount 
FROM [Order Details]
  
--直接於欄位運算 -缺點是運算公式複雜時
select orderid, unitprice, unitprice*0.8
from [Order Details]
  
--建立純量函數 將運算公式包裝
  create function dist_p (@unitprice int)
  RETURNS int
  with schemabinding
  as
  begin
     declare @x  int
     
     if @unitprice >20
         set @x= @unitprice * 0.8
     else
         set @x= @unitprice * 0.95
  
     RETURN @x
  end
  
--於select中, 呼叫自訂函數  須加 schema name
  select orderid, unitprice, dbo.dist_p(unitprice)
  from [Order Details]
  
 --單獨呼叫--------------
  declare @x int
  set @x = dbo.dist_p(20)
  print  @x
  
 --或
 
 select dbo.dist_p(30)
  