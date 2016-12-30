
--CONVERT 函數 日期為字串時 不會自動轉換

--日期會轉換成不同 樣式格式
select CONVERT ( VARCHAR(40), GETDATE()  , 101  )
select CONVERT ( VARCHAR(40), GETDATE()  , 102  )
select CONVERT ( VARCHAR(40), GETDATE()  , 103  )        

--但文字型態,未轉成日期樣式 ex: 2010-40-20 的 101,102,103 樣式仍為 2010-04-20
select CONVERT ( VARCHAR(40), '2010-04-20' , 101  )
select CONVERT ( VARCHAR(40), '2010-04-20' , 102  )
select CONVERT ( VARCHAR(40), '2010-04-20' , 103  ) 

--宣告為日期型態, 可
declare  @d date;
set      @d = '2010-04-20'

select CONVERT ( VARCHAR(40), @d , 101  )
select CONVERT ( VARCHAR(40), @d , 102  )
select CONVERT ( VARCHAR(40), @d , 103  ) 

--但宣告為文字型態, 未轉成日期樣式
declare  @d varchar(20);
set      @d = '2010-04-20'

select CONVERT ( VARCHAR(40), @d , 101  )
select CONVERT ( VARCHAR(40), @d , 102  )
select CONVERT ( VARCHAR(40), @d , 103  ) 

----但日期函數, 的參數為字串時, 會自動轉換為日期

SELECT DATEADD(month, 6, '2006-03-30') 
SELECT DATEDIFF(YEAR, '2006-01-30' , '2009-03-30'); 
SELECT DATEDIFF(MONTH, '2006-01-30' , '2009-03-30');

--文字轉成日期 預設為 YYYY-MM-DD ex  2010-04-20
select CONVERT ( DATE, '2010-04-20'   )
select CONVERT ( DATE, '2010/04/20'   )
select CONVERT ( DATE, '2010.04.20'   )
