SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE PROCEDURE [dbo].[ImsProcInspectionSendEmail] @UserId UNIQUEIDENTIFIER, @Email NVARCHAR(MAX), @CC NVARCHAR(MAX), @Description NVARCHAR(MAX), @Link NVARCHAR(MAX)
AS
BEGIN

    DECLARE @Email_Subject NVARCHAR(MAX) = 'BeyondAsset task link'
    DECLARE @Email_Body NVARCHAR(MAX)
    DECLARE @ReturnCode int

    BEGIN TRY
        SET CONCAT_NULL_YIELDS_NULL OFF 
        SET @Email_Body = '<p>Hello,<br/><br/>You have received a link to task in BeyondAsset, please click the following link to access the document: <br/><br/>Description: ' 
            + @Description  + '<br/>Link: '  + @Link
        EXEC @ReturnCode = [dbo].[sp_send_dbmail]
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
GO
