--�إ߸�Ƥ��θ�ƪ�
--�U�C�d�ҷ|�إߤ@�Ӹ�Ƥ��Ψ�ơA�N��ƪ�ί��ޤ��Φ��|����Ƥ��ΡC����A
--���d�ҷ|�إߤ@�Ӹ�Ƥ��ε��c�y�z�ӫ��w���O�ΨӫO�d�o�|����Ƥ��Ϊ��ɮ׸s�աC
--�̫�A�o�ӽd�ҷ|�إߤ@���ϥθ�Ƥ��ε��c�y�z����ƪ�C�o�ӽd�Ұ��]�o���ɮ׸s�դw�b��Ʈw���C

--�����ئn�|�� filegroup

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

