--圖表事後建cust PK (右鍵 資料表名/設計/右鍵欄位 選 設定主索引鍵 或點 快捷列 金黃色鑰匙 )

create table cust2
(
  cno   int  NOT NULL,
  name char(10)
);

--圖表事後加 FK (右鍵 資料表名/設計/右鍵欄位 選 關聯性 或點 快捷列 關聯性 圖示 )

create table ord2
(ordno  int  primary key,
 qty    int  check(qty >= 10),
 cno    int  
 )

--從資料庫圖表事後建cust PK (右鍵欄位 選 設定主索引鍵)

create table cust3
(
  cno   int  NOT NULL,
  name char(10)
);

--從資料庫圖表事後加 FK (拖拉 FK欄位 至 PK欄位, 或右鍵欄位 選 關聯性 )

create table ord3
(ordno  int  primary key,
 qty    int  check(qty >= 10),
 cno    int  
 )

--從從資料庫 建立表格
--自行從圖型介面練習

--測試資料 自行修改
 
 insert into cust2 values (101,'張三')
 insert into cust2 values (102,'李四')
 
 insert into ord2 values (1, 15, 101)
 insert into ord2 values (2, 12, 102)
 
 insert into ord2 values (3, 12, 109); --error
 
 select * from cust2
 select * from ord2
 
 
 