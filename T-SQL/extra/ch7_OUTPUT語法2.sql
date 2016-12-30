USE tempdb
go

CREATE TABLE table1
(
    id INT,
    employee VARCHAR(32)
)
go

INSERT INTO table1 VALUES(1, 'Fred')
INSERT INTO table1 VALUES(2, 'Tom')
INSERT INTO table1 VALUES(3, 'Sally')
INSERT INTO table1 VALUES(4, 'Alice')
GO

DECLARE @MyTableVar TABLE
(
    id INT,
    employee VARCHAR(32)
)

PRINT 'table1, before delete' 
SELECT * FROM table1

DELETE FROM table1
OUTPUT DELETED.* INTO @MyTableVar
WHERE id = 4 OR id = 2

PRINT 'table1, after delete'
SELECT * FROM table1

PRINT '@MyTableVar, after delete'
SELECT * FROM @MyTableVar

DROP TABLE table1

--Results
--table1, before delete
--id          employee
------------- ------------------------------
--1           Fred
--2           Tom
--3           Sally
--4           Alice
--
--table1, after delete
--id          employee
------------- ------------------------------
--1           Fred
--3           Sally
--@MyTableVar, after delete
--id          employee
------------- ------------------------------
--2           Tom
--4           Alice