     
     
BEGIN  TRY
SELECT 1/ 0;   --�������Է�ĸΪ��Ĵ���
END TRY
BEGIN  CATCH
-- ���ش���ѶϢ
SELECT
ERROR_NUMBER()        AS ErrorNumber
,ERROR_SEVERITY()      AS ErrorSeverity
,ERROR_STATE()             AS ErrorState
,ERROR_PROCEDURE() AS ErrorProcedure
,ERROR_LINE()                AS ErrorLine
,ERROR_MESSAGE()      AS ErrorMessage;
END  CATCH;
GO
