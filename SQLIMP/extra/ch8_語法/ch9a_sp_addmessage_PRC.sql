
EXEC  sp_addmessage 66666, 7, 'Update Complete!',
@lang = 'us_english'
GO
RAISERROR (66666, 7, 1)

EXEC  sp_addmessage 66666, 7, '�������',
@lang = '��������', @replace = 'replace'
GO



SET LANGUAGE '��������'


RAISERROR (66666, 7, 1)  --�������, ���ز㼶, ״̬

EXEC sp_dropmessage @msgnum = 66666;  --ɾ���Զ�
ѶϢ
