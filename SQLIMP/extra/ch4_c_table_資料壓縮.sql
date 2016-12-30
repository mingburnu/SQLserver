-- 建立使用資料列壓縮的資料表
--下列範例會建立一份使用資料列壓縮的資料表。


CREATE TABLE T1 
(c1 int, 
 c2 nvarchar(200) 
)
WITH (DATA_COMPRESSION = ROW);
