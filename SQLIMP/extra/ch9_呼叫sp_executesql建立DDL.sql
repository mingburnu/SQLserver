--呼叫 sp_executesql 建立 DDL指令 
--且程序 sp_executesql 程序必須有類型 'ntext/nchar/nvarchar' 的參數 '@statement'
--http://msdn.microsoft.com/zh-tw/library/ms175170.aspx

/* 若要執行字串，建議您使用 sp_executesql 預存程序，而不使用 EXECUTE 陳述式。
   因為此預存程序支援參數替代，所以 sp_executesql 會比 EXECUTE 更具有多變性
*/

use Northwind 
go
drop procedure p_table;
go
drop table test1;
go

create procedure p_table @TableName nvarchar(250)
as
begin
  DECLARE @strSQL nvarchar(1000);
  SET @strSQL= N'CREATE TABLE '+ @TableName +  ' (id int)';
  print @strSQL;
  
  IF object_id(@TableName, 'U') IS NULL
    exec sp_executesql @strSQL;
end;

--測試
exec p_table 'test1'