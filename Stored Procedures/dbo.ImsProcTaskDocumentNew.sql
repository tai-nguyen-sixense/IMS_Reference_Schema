SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


-- =============================================
-- Author:		Vincent Morisseau
-- Create date: 2018-04-16
-- Description:	Return taskDocument in json format when user creates a new taskDocument
-- InPut:		@Id = TaskDocument.Id, @taskDocumentJson= default taskDocument in json format, @UserId = Loggged User Id
-- OutPut:		taskDocument in json format nvarchar(max) or error in string format
-- Error:		in case of error, the details are logged in Files\log folder
-- =============================================

CREATE PROCEDURE [dbo].[ImsProcTaskDocumentNew] @Id uniqueidentifier,@taskDocumentJson nvarchar(max), @UserId uniqueidentifier
	
AS
BEGIN

	Declare @returnTaskDocumentJson as nvarchar(max);
    
	BEGIN TRY  
		SET @returnTaskDocumentJson=@taskDocumentJson;
		-- the procedure can be customized :
		--    - or using simple replace
					-- set @returnTaskDocumentJson=replace(@taskDocumentJson,'"name":null','"name":"default name for taskDocument"');
		--    - or rewrite the taskDocument object
	
		-- include script here
		select @returnTaskDocumentJson;
	END TRY  
	
	BEGIN CATCH 
		RETURN 'Sql Error- Number:' + cast (ERROR_NUMBER() as nvarchar(max)) + ' ;Message:' + ERROR_MESSAGE();
	END CATCH;

END
GO
