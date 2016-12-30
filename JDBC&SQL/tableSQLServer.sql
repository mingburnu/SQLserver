Use JDBC

DROP TABLE detail;
DROP TABLE Product;
CREATE TABLE Product (
   id       integer primary key,
   name     varchar(20),
   price    float,
   make     datetime,
   expire    integer
);

INSERT INTO product values (1,'Coca Cola',20, '2007-01-01',365);
INSERT INTO product values (2,'Milk Tea',15, '2007-02-14',150);
INSERT INTO product values (3,'Easy Coffe',10, '2007-10-01',200);
INSERT INTO product values (4,'Coffe Square',15, '2007-02-20',100);
INSERT INTO product values (5,'Cookie',25, '2007-03-27',45);
INSERT INTO product values (6,'Prince Noodle',5, '2007-04-02',365);
INSERT INTO product values (7,'Chicken Noodle',20, '2006-10-30',300);
INSERT INTO product values (8,'Qwi-Qwi',20, '2007-02-28',200);
INSERT INTO product values (9,'Ice Pop',15, '2007-05-30',150);
INSERT INTO product values (10,'HotDog',25, '2007-04-30',1);

/*==========================================================================*/

CREATE TABLE detail (
   photoid  integer primary key REFERENCES Product(id),
   photo    image
);

/*==========================================================================*/

DROP TABLE customer;
CREATE TABLE customer (
   custid     varchar(20) primary key,
   password   varbinary(50),
   email      varchar(30),
   birth      datetime
);

INSERT INTO customer values ('Alex', 0x41, 'alex@lab.com', '2001-07-20');
INSERT INTO customer values ('Babe', 0x42, 'babe@lab.com', '2003-03-20');
INSERT INTO customer values ('Carol', 0x43, 'carol@lab.com', '2001-09-11');
INSERT INTO customer values ('Dave', 0x44, 'dave@lab.com', '2001-01-20');
INSERT INTO customer values ('Ellen', 0x45, 'ellen@lab.com', '2000-05-20');

/*==========================================================================*/

DROP TABLE ProjEmp;
DROP TABLE Proj;
DROP TABLE Emp;
DROP TABLE Dept;
CREATE TABLE Dept (
  deptid     integer  primary key,
  deptname   VARCHAR(20)
);

INSERT INTO DEPT VALUES (10, 'Java');
INSERT INTO DEPT VALUES (20, 'Delphi');
INSERT INTO DEPT VALUES (30, 'Visual Basic');

/*=====================================================================*/

CREATE TABLE Emp (
  empid     integer primary key identity,
  empname   VARCHAR(10),
  salary    integer,
  sex       CHAR(1),
  photo     image,
  deptid    integer NOT NULL REFERENCES DEPT(DEPTID)
);

INSERT INTO EMP (EMPNAME, SALARY, SEX, DEPTID) VALUES ('Samuel', 10, 'M', 10);
INSERT INTO EMP (EMPNAME, SALARY, SEX, DEPTID) VALUES ('Crystal', 100, 'F', 30);
INSERT INTO EMP (EMPNAME, SALARY, SEX, DEPTID) VALUES ('Sammy', 1000, 'M', 10);
INSERT INTO EMP (EMPNAME, SALARY, SEX, DEPTID) VALUES ('Momo', 10000, 'M', 20);

/*=====================================================================*/

CREATE TABLE Proj (
  projid    integer  primary key,
  projname  VARCHAR(50)
);

INSERT INTO PROJ (PROJID, PROJNAME) VALUES (100, 'Online Shopping');
INSERT INTO PROJ (PROJID, PROJNAME) VALUES (200, 'Mobile Banking');
/*=====================================================================*/

CREATE TABLE ProjEmp (
  projid  integer,
  empid   integer,
  CONSTRAINT PK_PROJEMP_PROJIDEMPID PRIMARY KEY(PROJID, EMPID),
  CONSTRAINT FK_PROJEMP_PROJ_PROJID FOREIGN KEY(PROJID) REFERENCES PROJ(PROJID),
  CONSTRAINT FK_PROJEMP_EMP_EMPID FOREIGN KEY(EMPID) REFERENCES EMP(EMPID)
);

INSERT INTO PROJEMP VALUES (100, 1);
INSERT INTO PROJEMP VALUES (100, 2);
INSERT INTO PROJEMP VALUES (100, 4);
INSERT INTO PROJEMP VALUES (200, 3);
INSERT INTO PROJEMP VALUES (200, 4);
/*=====================================================================*/

DROP TABLE accountrole;
DROP TABLE account;
DROP TABLE blog;

CREATE TABLE blog (
   id          integer primary key identity,
   articleId   integer,
   nickname    varchar(20),
   retime      datetime,
   reply       varchar(500)
);
insert into blog (articleId, nickname, retime, reply) values (1, 'Crystal', '2011-05-01', '很不錯');
insert into blog (articleId, nickname, retime, reply) values (1, 'Babe', '2011-05-01', '看不懂在說甚麼');
insert into blog (articleId, nickname, retime, reply) values (1, 'Dave', '2011-05-01', 'BullShit');

/*=====================================================================*/
CREATE TABLE account (
   accountid  varchar(20) primary key,
   password   varchar(20)
);

CREATE TABLE accountrole (
   accountid   varchar(20),
   roleid     varchar(20),
   primary key(accountid, roleid),
   foreign key (accountid) references account (accountid)
);
/*==========================================================================*/
DROP PROCEDURE proProductByPrice;

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE proProductByPrice
	@param_price float AS
BEGIN
	SET NOCOUNT ON;
	SELECT * FROM product WHERE price>@param_price
END
GO

/*==========================================================================*/

DROP TABLE ObjectIDs;
CREATE TABLE ObjectIDs (
   table_name varchar(30) primary key,
   id         integer     not null
);
INSERT INTO ObjectIDs (TABLE_NAME, ID) VALUES ('Item', 20);

/*==========================================================================*/

DROP TABLE Item;
CREATE TABLE Item (
   id         integer    primary key,
   username   varchar(20)   not null, 
   title      varchar(100)  not null,
   year       char(4)       not null,
   genre      varchar(20)   not null
);
INSERT INTO ITEM VALUES (1, 'jack', 'The Godfather', '1972', 'Drama');
INSERT INTO ITEM VALUES (2, 'jack', 'The Shawshank Redemption', '1994', 'Drama');
INSERT INTO ITEM VALUES (3, 'jack', 'The Godfather: Part II', '1974', 'Drama');
INSERT INTO ITEM VALUES (4, 'jack', 'The Lord of the Rings: The Return of the King', '2003', 'Fantasy');
INSERT INTO ITEM VALUES (5, 'jack', 'The Lord of the Rings: The Two Towers', '2002', 'Fantasy');
INSERT INTO ITEM VALUES (6, 'jack', 'Shindler''s List', '1998', 'Drama');
INSERT INTO ITEM VALUES (7, 'jack', 'Shichinin no samurai', '1954', 'Action');
INSERT INTO ITEM VALUES (8, 'jack', 'Casablanca', '1942', 'Drama');
INSERT INTO ITEM VALUES (9, 'jack', 'The Lord of the Rings: The Fellowship of the Ring', '2001', 'Fantasy');
INSERT INTO ITEM VALUES (10, 'jack', 'Star Wars', '1977', 'Sci-Fi');
INSERT INTO ITEM VALUES (11, 'jack', 'Citizen Kane', '1941', 'Mystery');
INSERT INTO ITEM VALUES (12, 'jack', 'One Flew Over the Cuckoo''s Nest', '1975', 'Drama');
INSERT INTO ITEM VALUES (13, 'jack', 'Dr. Strangelove or: How I Learned to Stop Worrying and Love the Bomb', '1964', 'Comedy');
INSERT INTO ITEM VALUES (14, 'jack', 'Rear Window', '1954', 'Thriller');
INSERT INTO ITEM VALUES (15, 'jack', 'Star Wars: Episode V - The Empire Strikes Back', '1980', 'Sci-Fi');
INSERT INTO ITEM VALUES (16, 'jack', 'Raiders of the Lost Ark', '1981', 'Action');
INSERT INTO ITEM VALUES (17, 'jack', 'The Usual Suspects', '1995', 'Mystery');
INSERT INTO ITEM VALUES (18, 'jack', 'Pulp Fiction', '1994', 'Crime');
INSERT INTO ITEM VALUES (19, 'jack', 'Memento', '2000', 'Mystery');
/*==========================================================================*/
