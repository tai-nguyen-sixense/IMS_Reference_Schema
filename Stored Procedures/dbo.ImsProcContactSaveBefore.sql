SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


-- =============================================
-- Author:		Vincent Morisseau
-- Create date: 2017-11-15
-- Description:	Run before saving by the api
-- InPut:		@Id = Contact.Id, @contactJson= default contact in json format, @UserId = Loggged User Id
-- OutPut:		contact in json format nvarchar(max) or error in string format
-- Error:		in case of error, the details are logged in Files\log folder
-- =============================================

CREATE PROCEDURE [dbo].[ImsProcContactSaveBefore] @Id uniqueidentifier, @contactJson nvarchar(max), @UserId uniqueidentifier
	
AS
BEGIN
Declare @returnContactJson as nvarchar(max);
    
	BEGIN TRY  
		SET @returnContactJson=@contactJson;
        -- @contactJson is something like 
		--  {"assets":null,"allow":{"actOn":true,"edit":true,"delete":true,"copy":true,"check":true,"lockedFields":[]},"address":null,"email":null,"website":null,"phone":null,"fax":null,"contact":null,"id":"d25e00e5-c5f8-4237-a940-aaff40e5b111","fathersName":null,"name":null,"comments":null}
		-- the procedure can be customized : using simple replace
					-- set @returnContactJson=replace(@contactJson,'"comments":null','"comments":"please add comments"');

		-- include script here
		select @returnContactJson;
	END TRY  
	
	BEGIN CATCH 
		RETURN 'Sql Error- Number:' + cast (ERROR_NUMBER() as nvarchar(max)) + ' ;Message:' + ERROR_MESSAGE();
	END CATCH;

END
GO
