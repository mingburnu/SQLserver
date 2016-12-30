--SQL 2012 OFFSET FETCH �y�k���N TOP N, �] TOP N �D�зǻy�k,�B������w��X�d��

--�Ʀ�]  TOP n 

USE northwind
SELECT TOP 5 orderid, productid, quantity
FROM [order details]
ORDER BY quantity DESC
GO

--OFFSET n ���w���L�X��  / FETCH NEXT n ��ܩ���X��
--OFFSET 0  ROWS FETCH NEXT 5 ROWS ONLY �P TOP 5 �\��ۦP
USE northwind
SELECT orderid, productid, quantity
FROM [order details]
ORDER BY quantity DESC
OFFSET 0 ROWS FETCH NEXT 5 ROWS ONLY
GO

/*
orderid     productid   quantity
----------- ----------- --------
10764       39          130
11072       64          130
10398       55          120
10451       55          120
10515       27          120

(5 �Ӹ�ƦC����v�T)

*/

--OFFSET 10  ROWS FETCH NEXT 5 ROWS ONLY : ���L�e10��, ��ܩ���5�� �Y 11-15
SELECT orderid, productid, quantity
FROM [order details]
ORDER BY quantity DESC
OFFSET 10  ROWS FETCH NEXT 5 ROWS ONLY
GO
