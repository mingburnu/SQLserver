--�I�s sp_executesql �إ� DDL���O 
--�B�{�� sp_executesql �{�ǥ��������� 'ntext/nchar/nvarchar' ���Ѽ� '@statement'
--http://msdn.microsoft.com/zh-tw/library/ms175170.aspx

/* �Y�n����r��A��ĳ�z�ϥ� sp_executesql �w�s�{�ǡA�Ӥ��ϥ� EXECUTE ���z���C
   �]�����w�s�{�Ǥ䴩�Ѽƴ��N�A�ҥH sp_executesql �|�� EXECUTE ��㦳�h�ܩ�
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

--����
exec p_table 'test1'