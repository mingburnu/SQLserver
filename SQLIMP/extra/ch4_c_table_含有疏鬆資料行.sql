--���P��Ʀ欰�w�̨Τ��x�s��m�ӫO�s Null �Ȫ��@���Ʀ�C���P��Ʀ�|��� Null �Ȫ��Ŷ��ݨD�A
--���n�I�X�^���D Null �Ȫ���h�����t��C��Ŷ��ܤָ`�٤F�ʤ��� 20 �� 40 �ɡA�ЦҼ{�ϥβ��P��Ʀ�C
--���P��Ʀ�M��Ʀ涰�O�ϥ� CREATE TABLE �� ALTER TABLE ���z���ҩw�q�C

--�Y��즳�j�q NULL�� �i�H�]�����P ,�i�`�٪Ŷ�, ���۹諸, ���x�s�DNULL�� �|���h�ɶ��^���D Null ��

--�إߨ㦳���P��Ʀ�M��Ʀ涰����ƪ�
--�U�C�d�ҷ|�ܽd�p��إߤ@���t�����P��Ʀ檺��ƪ�A�H�Τ@���t����Ӳ��P��Ʀ�P��Ʀ涰����ƪ�C
���d�ҷ|�ϥΰ򥻻y�k�C�p�ݧ�������d�ҡA�аѾ\�ըϥβ��P��Ʀ�֩M�ըϥθ�Ʀ涰�֡C

--�Y�n�إߤ@���t�����P��Ʀ檺��ƪ�A�а���U�C�{���X�C



CREATE TABLE T1
(c1 int         PRIMARY KEY,
 C2 varchar(50) SPARSE NULL 
) ;



--�Y�n�إߤ@���t����Ӳ��P��Ʀ�P�W�� CSet ����Ʀ涰����ƪ�A�а���U�C�{���X

CREATE TABLE T1
(c1 int         PRIMARY KEY,
 C2 varchar(50) SPARSE NULL,
 C3 int         SPARSE NULL,
 CSet           XML COLUMN_SET FOR ALL_SPARSE_COLUMNS ) ;