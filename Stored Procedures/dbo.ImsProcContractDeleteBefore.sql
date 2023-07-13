SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


-- =============================================
-- Author:		Scanprint IMS Dev Team
-- Create date: 2020-05-04
-- Description:	Run before deleting by the api
-- InPut:		@Id = Contract.Id, @UserId = Loggged User Id
-- OutPut:		1 or error in string format
-- Error:		in case of error, the details are logged in Files\log folder
-- =============================================

CREATE PROCEDURE [dbo].[ImsProcContractDeleteBefore] @Id uniqueidentifier, @UserId uniqueidentifier
	
AS
BEGIN
	BEGIN TRY 
		-- include script here
		select 1;
	END TRY  
	
	BEGIN CATCH 
		RETURN 'Sql Error- Number:' + cast (ERROR_NUMBER() as nvarchar(max)) + ' ;Message:' + ERROR_MESSAGE();
	END CATCH;

END
GO
