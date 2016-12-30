--建立資料分割資料表
--下列範例會建立一個資料分割函數，將資料表或索引分割成四份資料分割。之後，
--此範例會建立一個資料分割結構描述來指定分別用來保留這四份資料分割的檔案群組。
--最後，這個範例會建立一份使用資料分割結構描述的資料表。這個範例假設這些檔案群組已在資料庫中。

--須先建好四個 filegroup

CREATE PARTITION FUNCTION myRangePF1 (int)
AS RANGE LEFT FOR VALUES (1, 100, 1000) ;
GO

CREATE PARTITION SCHEME myRangePS1
AS PARTITION myRangePF1
TO (test1fg, test2fg, test3fg, test4fg) ;
GO

CREATE TABLE PartitionTable (col1 int, col2 char(10))
ON myRangePS1 (col1) ;
GO

