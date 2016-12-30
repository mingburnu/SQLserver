
--CONVERT ��� ������r��� ���|�۰��ഫ

--����|�ഫ�����P �˦��榡
select CONVERT ( VARCHAR(40), GETDATE()  , 101  )
select CONVERT ( VARCHAR(40), GETDATE()  , 102  )
select CONVERT ( VARCHAR(40), GETDATE()  , 103  )        

--����r���A,���ন����˦� ex: 2010-40-20 �� 101,102,103 �˦����� 2010-04-20
select CONVERT ( VARCHAR(40), '2010-04-20' , 101  )
select CONVERT ( VARCHAR(40), '2010-04-20' , 102  )
select CONVERT ( VARCHAR(40), '2010-04-20' , 103  ) 

--�ŧi��������A, �i
declare  @d date;
set      @d = '2010-04-20'

select CONVERT ( VARCHAR(40), @d , 101  )
select CONVERT ( VARCHAR(40), @d , 102  )
select CONVERT ( VARCHAR(40), @d , 103  ) 

--���ŧi����r���A, ���ন����˦�
declare  @d varchar(20);
set      @d = '2010-04-20'

select CONVERT ( VARCHAR(40), @d , 101  )
select CONVERT ( VARCHAR(40), @d , 102  )
select CONVERT ( VARCHAR(40), @d , 103  ) 

----��������, ���ѼƬ��r���, �|�۰��ഫ�����

SELECT DATEADD(month, 6, '2006-03-30') 
SELECT DATEDIFF(YEAR, '2006-01-30' , '2009-03-30'); 
SELECT DATEDIFF(MONTH, '2006-01-30' , '2009-03-30');

--��r�ন��� �w�]�� YYYY-MM-DD ex  2010-04-20
select CONVERT ( DATE, '2010-04-20'   )
select CONVERT ( DATE, '2010/04/20'   )
select CONVERT ( DATE, '2010.04.20'   )
