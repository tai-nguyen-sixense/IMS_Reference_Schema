SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO



-- =============================================
-- Author:		Vincent Morisseau
-- Create date: 2018-04-16
-- Description:	Run before saving by the api
-- InPut:		@Id = TaskDocument.Id, @taskDocumentJson= default taskDocument in json format, @UserId = Loggged User Id
-- OutPut:		taskDocument in json format nvarchar(max) or error in string format
-- Error:		in case of error, the details are logged in Files\log folder
-- =============================================

CREATE PROCEDURE [dbo].[ImsProcTaskDocumentSaveBefore] @Id uniqueidentifier, @taskDocumentJson nvarchar(max), @UserId uniqueidentifier
	
AS
BEGIN
Declare @returnTaskDocumentJson as nvarchar(max);
    
	BEGIN TRY  
		SET @returnTaskDocumentJson=@taskDocumentJson;
        -- @taskDocumentJson is something like 
			-- the procedure can be customized : using simple replace
					-- set @returnTaskDocumentJson=replace(@taskDocumentJson,'"comments":null','"comments":"please add comments"');

		-- include script here
		select @returnTaskDocumentJson;
	END TRY  
	
	BEGIN CATCH 
		RETURN 'Sql Error- Number:' + cast (ERROR_NUMBER() as nvarchar(max)) + ' ;Message:' + ERROR_MESSAGE();
	END CATCH;

END
GO
