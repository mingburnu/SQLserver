
--tablename�T�w
 create table test2(id int)
  
 IF object_id( 'test2' , 'U') IS NOT NULL
     drop table test2;

--tablename���T�w
 create table test2(id int)
 
 declare @TableName varchar(30);
 declare @strsql varchar(300);

 set  @TableName = 'test2';
 
 IF object_id(@TableName, 'U') IS NOT NULL
    begin
     set @strsql = 'drop table '+@TableName;
     -- ���@�� �ҥi exec sp_executesql  �� exec (@strsql) �n�[�A�� ;
     --exec sp_executesql @strsql;
     exec  (@strsql);
    end; 
     
