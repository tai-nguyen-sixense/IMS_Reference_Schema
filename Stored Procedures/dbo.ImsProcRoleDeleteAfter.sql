SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

-- =============================================
-- Author:		Aaron Kinfe
-- Create date: 2021-10-03
-- Description:	Run after deleting by the api
-- InPut:		@Id = Role.Id, @UserId = Loggged User Id
-- OutPut:		1 or error in string format
-- Error:		in case of error, the details are logged in Files\log folder
-- =============================================

Create PROCEDURE [dbo].[ImsProcRoleDeleteAfter] @Id uniqueidentifier, @UserId uniqueidentifier
	
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
