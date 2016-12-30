/*
  C:\>sqlcmd -E -i c:\temp\extra\ch2_script1.sql -v cols="employeeid, lastname" tabname="employees"

*/

USE northwind
GO
SELECT  $(cols)  FROM  $(tabname)
GO
