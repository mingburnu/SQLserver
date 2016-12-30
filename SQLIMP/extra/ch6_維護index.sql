--��cust �Ȥ�D�� 
use Northwind
go
create table cust4
(
  cno   int     ,
  name  char(10)
);
go

--����
insert into cust4 values (101,'�i�T');
insert into cust4 values (102,'���|');
insert into cust4 values (103,'aa');
insert into cust4 values (104,'bb');
insert into cust4 values (105,'cc');
insert into cust4 values (106,'dd');
   
--��ܦ��p����p�e
select *    from cust4
select *    from cust4 where cno = 103
select *    from cust4 where name = 'aa'
select cno  from cust4 where cno = 103
select name from cust4 where name = 'aa'
select cno  from cust4 where name = 'aa'

--�إ߯���

create clustered index  i41 on cust4(cno);
create           index  i42 on cust4(name);
create           index  i43 on cust4(cno,name);

--�d�߯���

exec sp_helpindex  cust4       --���W
exec sp_help       cust4

--���@����1-�d�ݬO�_�� ���_ Fragmentation
--���Ӫ� Microsoft SQL Server �����N�����o���\��C��� sys.dm_db_index_physical_stats

DBCC SHOWCONTIG(cust4, i41)

/*
DBCC SHOWCONTIG ���b���y 'cust4' ��ƪ�...
��ƪ�: 'cust4' (882102183); �����ѧO�X: 1�A��Ʈw�ѧO�X: 7
�w���� TABLE �h�ű��y�C
- ���y����................................: 1
- ���y���d��..............................: 1
- �d�����..............................: 0
- �C�ӽd�򪺥�������........................: 1.0
- ���y�K�� [Best Count:Actual Count].......: 100.00% [1:1]
- �޿豽�y���q ..................: 0.00%
- �d�򱽴y���q ...................: 0.00%
- �C�ӭ����������i�Φ줸�ռ�.....................: 7958.0
- ���������K�� (����).....................: 1.68%
DBCC ������w�g�����C�p�G DBCC �L�X���~�T���A�гs���z���t�κ޲z���C

*/

--���@����2�d�ݬO�_�� ���_ Fragmentation
--���Ӫ� Microsoft SQL Server �����N�����o���\��(DBCC SHOWCONTIG)�C��� sys.dm_db_index_physical_stats

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

(7 �Ӹ�ƦC����v�T)

*/
--�������_1: ���ի��w��ƪ���˵�������
--�y�k DBCC INDEXDEFRAG( database_name, table_name, index_name )
--�U�@���� Microsoft SQL Server �N���A���Ѧ��\��C �Ч�� ALTER INDEX .. REORGANIZE
--�L�n��ĳ ���_(Fragmentation)���� < 30% �� REORGANIZE, > 30% ��  REBUILD

DBCC INDEXDEFRAG(northwind, cust4, i41)

--��
alter index i41 on cust4 REORGANIZE

--�������_2: ����-�b���w����Ʈw���A���ظ�ƪ��@�Φh�ӯ���
--�y�k DBCC DBREINDEX( table_name , index_name [ , fillfactor ] )
--�U�@���� Microsoft SQL Server �N���A���Ѧ��\��C�Ч�� ALTER INDEX .. REBUILD

DBCC DBREINDEX(cust4, i41)
DBCC DBREINDEX(cust4, i41, 70)

--��
alter index i41 on cust4 REBUILD

