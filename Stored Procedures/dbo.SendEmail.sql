SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE PROCEDURE [dbo].[SendEmail] @UserId UNIQUEIDENTIFIER, @DocumentId UNIQUEIDENTIFIER, @RevisionId UNIQUEIDENTIFIER, @Email NVARCHAR(MAX), @CC NVARCHAR(MAX), @Description NVARCHAR(MAX)
AS
BEGIN

DECLARE @Email_Subject NVARCHAR(MAX) = 'BeyondAsset document link'
DECLARE @Email_Body NVARCHAR(MAX)
DECLARE @ReturnCode int

BEGIN TRY
SET CONCAT_NULL_YIELDS_NULL OFF 
SET @Email_Body = '<p>Hello,<br/><br/>You have received a link to document in BeyondAsset, please click the following link to access the document: <br/><br/>Description: ' 
				+ @Description  + '<br/>DocumentId: '  + TRY_CAST(@DocumentId AS NVARCHAR(MAX)) + '<br/>RevisionId: ' + TRY_CAST(@RevisionId as NVARCHAR(MAX))
EXEC @ReturnCode = [msdb].[dbo].[sp_send_dbmail]
					@profile_name = 'DB Admin Profile', -- Change this to server database profile
					@recipients = @Email,
					@copy_recipients = @CC,
					@subject = @Email_Subject,
					@body_format = 'HTML',
					@body = @Email_Body;

SELECT @ReturnCode
SET CONCAT_NULL_YIELDS_NULL ON
END TRY
BEGIN CATCH
RETURN 'Sql Error- Number:' + cast (ERROR_NUMBER() as nvarchar(max)) + ' ;Message:' + ERROR_MESSAGE();
END CATCH;

END

--2022-03-18_add_translation.sql
IF NOT EXISTS ( SELECT 1 FROM IMSLanguage WHERE Code = 'ims5.lang.send.email')
BEGIN
	INSERT INTO IMSLanguage (Code, Language1, ForMobile)
	VALUES ('ims5.lang.send.email', 'Email Notification', 0)
END
GO
