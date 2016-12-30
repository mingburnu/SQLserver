--建cust 客戶主表 
use Northwind
go
create table cust4
(
  cno   int     ,
  name  char(10)
);
go

--測試
insert into cust4 values (101,'張三');
insert into cust4 values (102,'李四');
insert into cust4 values (103,'aa');
insert into cust4 values (104,'bb');
insert into cust4 values (105,'cc');
insert into cust4 values (106,'dd');
   
--顯示估計執行計畫
select *    from cust4
select *    from cust4 where cno = 103
select *    from cust4 where name = 'aa'
select cno  from cust4 where cno = 103
select name from cust4 where name = 'aa'
select cno  from cust4 where name = 'aa'

--建立索引

create clustered index  i41 on cust4(cno);
create           index  i42 on cust4(name);
create           index  i43 on cust4(cno,name);

--查詢索引

exec sp_helpindex  cust4       --表格名
exec sp_help       cust4

--維護索引1-查看是否有 片斷 Fragmentation
--未來的 Microsoft SQL Server 版本將移除這項功能。改用 sys.dm_db_index_physical_stats

DBCC SHOWCONTIG(cust4, i41)

/*
DBCC SHOWCONTIG 正在掃描 'cust4' 資料表...
資料表: 'cust4' (882102183); 索引識別碼: 1，資料庫識別碼: 7
已執行 TABLE 層級掃描。
- 掃描頁數................................: 1
- 掃描的範圍..............................: 1
- 範圍切換..............................: 0
- 每個範圍的平均頁數........................: 1.0
- 掃描密度 [Best Count:Actual Count].......: 100.00% [1:1]
- 邏輯掃描片段 ..................: 0.00%
- 範圍掃描片段 ...................: 0.00%
- 每個頁面的平均可用位元組數.....................: 7958.0
- 平均頁面密度 (全滿).....................: 1.68%
DBCC 的執行已經完成。如果 DBCC 印出錯誤訊息，請連絡您的系統管理員。

*/

--維護索引2查看是否有 片斷 Fragmentation
--未來的 Microsoft SQL Server 版本將移除這項功能(DBCC SHOWCONTIG)。改用 sys.dm_db_index_physical_stats

SELECT * FROM sys.dm_db_index_physical_stats(DB_ID('northwind'), OBJECT_ID('dbo.cust4'), NULL, NULL , 'DETAILED')

/*
database_id object_id   index_id    partition_number index_type_desc                                              alloc_unit_type_desc                                         index_depth index_level avg_fragmentation_in_percent fragment_count       avg_fragment_size_in_pages page_count           avg_page_space_used_in_percent record_count         ghost_record_count   version_ghost_record_count min_record_size_in_bytes max_record_size_in_bytes avg_record_size_in_bytes forwarded_record_count compressed_page_count
----------- ----------- ----------- ---------------- ------------------------------------------------------------ ------------------------------------------------------------ ----------- ----------- ---------------------------- -------------------- -------------------------- -------------------- ------------------------------ -------------------- -------------------- -------------------------- ------------------------ ------------------------ ------------------------ ---------------------- ---------------------
10          277576027   0           1                HEAP                                                         IN_ROW_DATA                                                  1           0           70                           11                   2.27272727272727           25                   77.6239189523103               6526                 0                    0                          21                       29                       21.467                   0                      0
10          277576027   4           1                NONCLUSTERED INDEX                                           IN_ROW_DATA                                                  2           0           80                           33                   1.21212121212121           40                   48.3518655794416               6526                 0                    0                          22                       22                       22                       NULL                   0
10          277576027   4           1                NONCLUSTERED INDEX                                           IN_ROW_DATA                                                  2           1           0                            1                    1                          1                    14.801087225105                40                   0                    0                          28                       28                       28                       NULL                   0
10          277576027   5           1                NONCLUSTERED INDEX                                           IN_ROW_DATA                                                  2           0           60.9756097560976             27                   1.51851851851852           41                   55.0380652335063               6526                 0                    0                          26                       26                       26                       NULL                   0
10          277576027   5           1                NONCLUSTERED INDEX                                           IN_ROW_DATA                                                  2           1           0                            1                    1                          1                    17.1979243884359               41                   0                    0                          32                       32                       32                       NULL                   0
10          277576027   6           1                NONCLUSTERED INDEX                                           IN_ROW_DATA                                                  2           0           81.8181818181818             19                   1.15789473684211           22                   65.9433531010625               6526                 0                    0                          16                       16                       16                       NULL                   0
10          277576027   6           1                NONCLUSTERED INDEX                                           IN_ROW_DATA                                                  2           1           0                            1                    1                          1                    6.49864096861873               22                   0                    0                          22                       22                       22                       NULL                   0

(7 個資料列受到影響)

*/
--消除片斷1: 重組指定資料表或檢視的索引
--語法 DBCC INDEXDEFRAG( database_name, table_name, index_name )
--下一版的 Microsoft SQL Server 將不再提供此功能。 請改用 ALTER INDEX .. REORGANIZE
--微軟建議 片斷(Fragmentation)情形 < 30% 須 REORGANIZE, > 30% 須  REBUILD

DBCC INDEXDEFRAG(northwind, cust4, i41)

--或
alter index i41 on cust4 REORGANIZE

--消除片斷2: 重建-在指定的資料庫中，重建資料表的一或多個索引
--語法 DBCC DBREINDEX( table_name , index_name [ , fillfactor ] )
--下一版的 Microsoft SQL Server 將不再提供此功能。請改用 ALTER INDEX .. REBUILD

DBCC DBREINDEX(cust4, i41)
DBCC DBREINDEX(cust4, i41, 70)

--或
alter index i41 on cust4 REBUILD

