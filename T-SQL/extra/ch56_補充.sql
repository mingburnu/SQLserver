
--列出學員姓名及各科成績

select s.id, s.name,  c.id, c.name, c.score
from    student s JOIN  course c
ON      s.id =  c.id
order by  s.id

--列出學員姓名及各科成績 (未參加考試的學員也要列出)


select s.id, s.name,  c.id, c.name, c.score
from    student s LEFT OUTER  JOIN  course c
ON      s.id =  c.id
order by  s.id


---adve

select  distinct  name
from   course
 
 --adv2
 select s.id, s.name, c1.name
 from    student s CROSS  JOIN  ( select  distinct  name
                                 from   course
                               ) c1
order by s.id

--adv3
 select s.id, s.name, c1.name, c.score
 from    student s CROSS  JOIN  ( select  distinct  name
                                 from   course
                               ) c1
LEFT OUTER JOIN  course c
ON c.name = c1.name and
s.id = c.id
order by s.id


--ch456
--列出學員姓名及各科成績

select s.id, s.name,  c.id, c.name, c.score, ( select avg(score) from  course where name = c.name)  as avgs
from    student s JOIN  course c
ON      s.id =  c.id
order by  c.name, s.id


--method2

select s.id, s.name,  c.id, c.name, c.score, avgs
from    student s JOIN  course c
ON      s.id =  c.id
JOIN (  select  name, avg(score) avgs
        from  course
		group by  name
	 )  c1
ON c.name =  c1.name 
order by  c.name, s.id

