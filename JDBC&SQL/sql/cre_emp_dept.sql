DROP TABLE employee;

DROP TABLE department;

CREATE TABLE department (
	deptno		varchar(3)	PRIMARY KEY,
	deptname	varchar(30)	NOT NULL,
	location	varchar(3)
);

INSERT INTO department
   VALUES ('100', 'IT', '101');

INSERT INTO department
   VALUES ('200', 'Accounting', '102');
   
INSERT INTO department
   VALUES ('300', 'Marketing', '103');


CREATE TABLE employee (
	empno		decimal(4)		PRIMARY KEY,
	empname		varchar(30)		NOT NULL,
	hiredate	datetime		NOT NULL,
	salary		decimal(10,2)	NOT NULL,
	deptno		varchar(3)		NOT NULL,
	title		varchar(30)		NOT NULL
);

INSERT INTO employee
   VALUES (1001, 'Pam Pan', '2003/11/10', 56000, '100', 'senior engineer');

INSERT INTO employee
   VALUES (1002, 'Lily Lee', '1998/03/22', 34000, '100', 'engineer');
   
INSERT INTO employee
   VALUES (1003, 'Stephen Hsu', '2001/08/14', 77000, '200', 'manager');
   
INSERT INTO employee
   VALUES (1004, 'May Wu', '2005/04/04', 67000, '300', 'manager');
   
INSERT INTO employee
   VALUES (1005, 'Tina Wang', '2004/12/25', 37000, '200', 'engineer');
   
INSERT INTO employee
   VALUES (1006, 'Allen Hu', '2007/07/06', 44000, '300', 'senior engineer');

INSERT INTO employee
   VALUES (1007, 'David Ho', '2003/09/11', 39000, '100', 'engineer');

INSERT INTO employee
   VALUES (1008, 'Viginia Kuo', '1999/05/16', 55000, '100', 'SA_REP');

