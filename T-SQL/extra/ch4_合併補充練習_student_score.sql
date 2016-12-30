-- student 學員資料表 
-- course  學員各科成績

--** 單純 23 學員中 每人考三科, 有一學員 3科都沒考 , 沒登記分數 非登記成 零分
--** 難一點則 10號學員只考兩科   這時 平均分數 就會有爭議

--查出最高/最低/平均 的分數是幾分 (不管那一科)
--列出各科最高最低/平均的分數是幾分

--列出學員姓名及各科成績
--列出學員姓名及各科成績 (未參加考試的學員也要列出)


--查出學員總分數最高 (含姓名)
--查出學員分數大於總平均的有那些 (含姓名,個人分數)
--查出學員分數大於總平均的有那些 (含姓名,個人分數,平均分數)


--進階
--查出學員任一科分數大於總平均的有那些 (含姓名,個人分數), 任一科大於 總平均
--查出學員各科分數大於該科平均的有那些 (含姓名,個人分數), 任一科大於各科 總平均

--查出學員分數大於各科平均的有那些 (含姓名,個人分數)
--PIVOT 將學員各科成績轉成 PIVOT欄位 (含學號,姓名,各科分數 3個欄位)



use DB01    --若 定序非 Chinese_Taiwan 則另建 DB

go

drop table course;
drop table student;
go

create table student
( id    int        PRIMARY KEY,   --學號
  name  char(20),                 --姓名
  bdate date,
  tel   char(20)
);

create table course
( id    int     ,   --學號
  name  char(20),   --課名
  score int,        --分數
  FOREIGN KEY(id) REFERENCES student(id) 
);
go



insert into student values ( 1, '蔡富翔','1983-04-21','09205556781');
insert into student values ( 2, '吳宜樺','1983-09-23','09205556789');
insert into student values ( 3, '徐嘉若','1983-08-25','09205556785');
insert into student values ( 4, '黃旭慧','1983-07-27','09205556783');
insert into student values ( 5, '簡繹祥','1983-05-29','09205556789');
insert into student values ( 6, '顏仲陽','1983-06-22','09205556789');
insert into student values ( 7, '林育安','1983-03-24','09205556786');
insert into student values ( 8, '朱俊銘','1983-01-26','09205556789');
insert into student values ( 9, '陳柏均','1983-02-28','09205556789');
insert into student values (10, '陳傑揚','1983-11-20','09205556782');
insert into student values (11, '江鎧勳','1983-10-21','09205556789');
insert into student values (12, '黃信康','1983-04-23','09205556789');
insert into student values (13, '楊宗明','1983-05-25','09205556788');
insert into student values (14, '劉東洋','1983-07-23','09205556789');
insert into student values (15, '戴恩聰','1983-02-27','09205556783');
insert into student values (16, '鄭匡志','1983-04-23','09205556789');
insert into student values (17, '經皓元','1983-06-29','09205556781');
insert into student values (18, '葉漢森','1983-04-22','09205556780');
insert into student values (19, '曾智煒','1983-08-24','09205556789');
insert into student values (20, '曾佳隆','1983-04-26','09205556787');
insert into student values (21, '馬義棋','1983-09-28','09205556789');
insert into student values (22, '鄭翰澤','1983-04-20','09205556789');
insert into student values (23, '蔡忻辰','1983-05-25','09205556788');
go

insert into course values ( 1,'JAVA',85);
insert into course values ( 2,'JAVA',80);
insert into course values ( 3,'JAVA',80);
insert into course values ( 4,'JAVA',85);
insert into course values ( 5,'JAVA',75);
insert into course values ( 6,'JAVA',70);
insert into course values ( 7,'JAVA',92);
insert into course values ( 8,'JAVA',85);
insert into course values ( 9,'JAVA',83);
insert into course values (11,'JAVA',87);
insert into course values (12,'JAVA',85);
insert into course values (13,'JAVA',86);
insert into course values (14,'JAVA',85);
insert into course values (15,'JAVA',84);
insert into course values (16,'JAVA',75);
insert into course values (17,'JAVA',81);
insert into course values (18,'JAVA',85);
insert into course values (19,'JAVA',79);
insert into course values (20,'JAVA',85);
insert into course values (21,'JAVA',78);
insert into course values (22,'JAVA',85);

go

insert into course values ( 1,'電概',81);
insert into course values ( 2,'電概',80);
insert into course values ( 3,'電概',82);
insert into course values ( 4,'電概',84);
insert into course values ( 5,'電概',64);
insert into course values ( 6,'電概',83);
insert into course values ( 7,'電概',85);
insert into course values ( 8,'電概',87);
insert into course values ( 9,'電概',86);
insert into course values (10,'電概',85);
insert into course values (11,'電概',82);
insert into course values (12,'電概',81);
insert into course values (13,'電概',89);
insert into course values (14,'電概',85);
insert into course values (15,'電概',88);
insert into course values (16,'電概',87);
insert into course values (17,'電概',86);
insert into course values (18,'電概',85);
insert into course values (19,'電概',84);
insert into course values (20,'電概',82);
insert into course values (21,'電概',85);
insert into course values (22,'電概',81);

go

insert into course values ( 1,'T-SQL',85);
insert into course values ( 2,'T-SQL',85);
insert into course values ( 3,'T-SQL',80);
insert into course values ( 4,'T-SQL',85);
insert into course values ( 5,'T-SQL',85);
insert into course values ( 6,'T-SQL',83);
insert into course values ( 7,'T-SQL',85);
insert into course values ( 8,'T-SQL',82);
insert into course values ( 9,'T-SQL',91);
insert into course values (10,'T-SQL',85);
insert into course values (11,'T-SQL',85);
insert into course values (12,'T-SQL',87);
insert into course values (13,'T-SQL',85);
insert into course values (14,'T-SQL',85);
insert into course values (15,'T-SQL',86);
insert into course values (16,'T-SQL',85);
insert into course values (17,'T-SQL',85);
insert into course values (18,'T-SQL',89);
insert into course values (19,'T-SQL',85);
insert into course values (20,'T-SQL',88);
insert into course values (21,'T-SQL',85);
insert into course values (22,'T-SQL',84);
go
