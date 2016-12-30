--check 

create table ck1
(  id int ,
   qty  int  check (qty >=10)
  )

insert into ck1 values(101, 25)

--on update cascade

create table cust5
(  id int     primary key
)

create table ord5
(ono int primary key,
 id  int foreign key references cust5(id) ON UPDATE CASCADE
) 

insert into cust5 values(101)
insert into cust5 values(102)
insert into cust5 values(103)

insert into ord5 values(1, 101)
insert into ord5 values(2, 101)
insert into ord5 values(3, 102)

select * from cust5
select * from ord5

--test

delete from cust5 where id = 101
update cust5 set id = 901 where id = 101




