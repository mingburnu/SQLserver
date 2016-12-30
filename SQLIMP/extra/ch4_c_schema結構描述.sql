--建 schema
USE [sample1]
GO
CREATE SCHEMA [person] AUTHORIZATION [dbo]
GO

--加schema
create table person.t1(id int)

--預設 dbo
create table t1(id int)
