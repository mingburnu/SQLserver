use Northwind
go

SELECT USER_NAME()    --¨Ï¥ÎªÌ
SELECT SUSER_NAME() + ' EEIT56'  from employees  

SELECT 2+3   from employees  

SELECT * FROM  SYS.SYSUSERS  

select * from INFORMATION_SCHEMA.TABLES
select * from sys.TABLES

exec sp_tables

create table t1(id int)
create table hr.t1(id int)

insert into t1 values (101)
insert into t1 values (102)

insert into hr.t1 values (103)

select *  from hr.t1
select *  from t1

