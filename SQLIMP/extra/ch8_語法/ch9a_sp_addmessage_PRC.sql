
EXEC  sp_addmessage 66666, 7, 'Update Complete!',
@lang = 'us_english'
GO
RAISERROR (66666, 7, 1)

EXEC  sp_addmessage 66666, 7, '更新完成',
@lang = '简体中文', @replace = 'replace'
GO



SET LANGUAGE '简体中文'


RAISERROR (66666, 7, 1)  --错误代码, 严重层级, 状态

EXEC sp_dropmessage @msgnum = 66666;  --删除自订
讯息
