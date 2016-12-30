--SQL 2012 OFFSET FETCH 語法取代 TOP N, 因 TOP N 非標準語法,且不能指定輸出範圍

--排行榜  TOP n 

USE northwind
SELECT TOP 5 orderid, productid, quantity
FROM [order details]
ORDER BY quantity DESC
GO

--OFFSET n 指定跳過幾筆  / FETCH NEXT n 顯示往後幾筆
--OFFSET 0  ROWS FETCH NEXT 5 ROWS ONLY 與 TOP 5 功能相同
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

(5 個資料列受到影響)

*/

--OFFSET 10  ROWS FETCH NEXT 5 ROWS ONLY : 跳過前10筆, 顯示往後5筆 即 11-15
SELECT orderid, productid, quantity
FROM [order details]
ORDER BY quantity DESC
OFFSET 10  ROWS FETCH NEXT 5 ROWS ONLY
GO
