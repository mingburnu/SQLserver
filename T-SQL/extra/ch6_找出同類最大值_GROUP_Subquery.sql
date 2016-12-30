ms-sql т摸程, ノ琩高,

id  name  price
1   A     100
2   A     300
3   A     200   <---硂摸id程
4   B     500
5   B     400   <---硂摸id程
6   C     600
7   C     800   <---硂摸id程
8   C     700



create table test
( id    int primary key,
  name  char(10),
  price  int
)
go


insert into test values (1,   'A',     100)
insert into test values (2,   'A',     300)
insert into test values (3,   'A',     200)
insert into test values (4,   'B',     500)
insert into test values (5,   'B',     400)
insert into test values (6,   'C',     600)
insert into test values (7,   'C',     800)
insert into test values (8,   'C',     700)
go

select * from test
go


select *
from test
where id in ( select MAX(id)
              from test
              group by name
             )



id          name       price
----------- ---------- -----------
3           A          200
5           B          400
8           C          700

(3 戈紇臫)
