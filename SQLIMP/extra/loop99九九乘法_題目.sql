--九九乘法表


 DECLARE   @i INT = 1;
  WHILE ( @i<=9 )
    BEGIN  
	   DECLARE   @j INT = 1;
	  WHILE ( @j <=9 )
        BEGIN
            -- PRINT i * j= i*j
            -- SET      
     
	  PRINT right('0'+convert(varchar(2), @i),2) 
      + '*'
	  + right('0'+convert(varchar(2), @j),2) 
      + '=' 
      + right('0'+convert(varchar(2),  @i*@j),2)
  set @j=@j+1
     END;
	 
      
	   set @i=@i+1  
      
   END;



--輸出格式
/*

1 補0 的方法之一 3--> 03,  12-->12 
  PRINT  RIGHT('0'+CONVERT(varchar(2), 值),2)

2 顯示 i * j = i*j 的方法之一  03*04=12  
  
  用加號加字串串起 :  i + '*' + j + '=' + i*j

PRINT right('0'+convert(varchar(2), @i),2) 
      + '*'
      + right('0'+convert(varchar(2), @j),2) 
      + '=' 
      + right('0'+convert(varchar(2), @i*@j),2);
      

*/