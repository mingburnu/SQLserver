--�E�E���k��


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



--��X�榡
/*

1 ��0 ����k���@ 3--> 03,  12-->12 
  PRINT  RIGHT('0'+CONVERT(varchar(2), ��),2)

2 ��� i * j = i*j ����k���@  03*04=12  
  
  �Υ[���[�r���_ :  i + '*' + j + '=' + i*j

PRINT right('0'+convert(varchar(2), @i),2) 
      + '*'
      + right('0'+convert(varchar(2), @j),2) 
      + '=' 
      + right('0'+convert(varchar(2), @i*@j),2);
      

*/