/*
**  This file contains examples from 'Module 4: Creating Datatypes and Tables'.

/* **Creating a User-Defined Data Type */
USE Northwind
GO
EXEC  sp_addtype  city,    'nvarchar(15)', NULL
EXEC  sp_addtype  region,  'nvarchar(15)', NULL
EXEC  sp_addtype  country, 'nvarchar(15)', NULL
GO

/* **Dropping a User-Defined Data Type  */
USE Northwind
GO
EXEC sp_droptype city
GO

--��ĳ�H CREATE TYPE ���N sp_addtype
--�ۭq����
CREATE TYPE state from varchar(2) NOT NULL

--�إߪ�� ��쬰 �ۭq����
create table t2(id    int,
                city  state)  --�ۭq����
GO

drop table t2     --���R���
drop type state   --�~��R �ۭq����


/*
**Specifying NULL or NOT NULL
**
**Example
**The following example creates the CategoriesNew table, specifying the 
**columns of the table, a data type for each column, and whether that 
**column allows null values.
*/
USE Northwind
GO
CREATE TABLE dbo.CategoriesNew
  (CategoryID   int IDENTITY(1, 1) NOT NULL,
   CategoryName nvarchar(15)       NOT NULL,
   Description  ntext              NULL,
   Picture      image              NULL)
GO

/*
**Adding a Column
**
**Example
**This example adds a column that allows null values.
*/

USE Northwind
GO
ALTER TABLE CategoriesNew
ADD Commission money null
GO

/*
**Dropping a Column
**
**Example
**This example drops a column from a table.
*/
USE Northwind
GO
ALTER TABLE CategoriesNew
DROP COLUMN Commission
GO

/*
**Using the IDENTITY Property
**
**Example
**This example creates a table with two columns, student_id and name. 
**The IDENTITY property is used to increment the value automatically 
**in each row added to the student_id column. The seed is set to 100, and 
**the increment value is 5. The values in the column would be 100, 105, 
**110, 115, and so on. Using 5 as an increment value allows you to insert
**records between the values at a later time.
*/
USE Northwind
GO
CREATE TABLE Class 
  (StudentId int IDENTITY(100, 5) NOT NULL, 
   Name      varchar(16))
GO

/*
**Using the NEWID Function and the uniqueidentifier Data Type
**
**Example
**In this example, the customer table customer ID column is created 
**with a uniqueidentifier data type, with a default value generated
**by the NEWID function. A unique value for the cust_id column will 
**be generated for each new and existing row.
*/
USE Northwind
GO
CREATE TABLE Customer
(CustID uniqueidentifier NOT NULL
	DEFAULT NEWID(),
	CustName char(30) NOT NULL) 
GO

/*
**End of File
*/

