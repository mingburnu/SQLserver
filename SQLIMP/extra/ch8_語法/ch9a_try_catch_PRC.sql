     
     
BEGIN  TRY
SELECT 1/ 0;   --产生除以分母为零的错误
END TRY
BEGIN  CATCH
-- 拦截错误讯息
SELECT
ERROR_NUMBER()        AS ErrorNumber
,ERROR_SEVERITY()      AS ErrorSeverity
,ERROR_STATE()             AS ErrorState
,ERROR_PROCEDURE() AS ErrorProcedure
,ERROR_LINE()                AS ErrorLine
,ERROR_MESSAGE()      AS ErrorMessage;
END  CATCH;
GO
