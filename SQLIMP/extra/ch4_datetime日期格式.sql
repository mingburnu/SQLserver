--�U�C�d�ҷ|����N�r���ഫ���C�� date �M time ������������G�C

SELECT 
     CAST('2007-05-08 12:35:29. 1234567 +12:15' AS time(7))       AS 'time' 
    ,CAST('2007-05-08 12:35:29. 1234567 +12:15' AS date)          AS 'date' 
    ,CAST('2007-05-08 12:35:29.123'             AS smalldatetime) AS 'smalldatetime' 
    ,CAST('2007-05-08 12:35:29.123'             AS datetime)      AS 'datetime' 
    ,CAST('2007-05-08 12:35:29. 1234567 +12:15' AS datetime2(7))  AS 'datetime2'
    ,CAST('2007-05-08 12:35:29.1234567 +12:15'  AS datetimeoffset(7)) AS 'datetimeoffset';



--SET DATEFROMAT �]�w��J�榡 ,����ܤ��H yyyy-mm-dd hh:mm:ss 

-- Set date format to day/month/year.
SET DATEFORMAT dmy;
GO
DECLARE @datevar datetime2 = '31/12/2008 09:01:01.1234567';
SELECT @datevar;
GO
-- Result: 2008-12-31 09:01:01.123


SET DATEFORMAT dmy;
GO
DECLARE @datevar datetime2 = '12/31/2008 09:01:01.1234567';
SELECT @datevar;
GO
-- Result: Msg 241: Conversion failed when converting date and/or time -- from character string.

GO