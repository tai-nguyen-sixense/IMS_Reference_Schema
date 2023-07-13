SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

-- =============================================
-- Author:		Aaron Kinfe
-- Create date: 2021-10-03
-- Description:	Run on demand by end user
-- InPut:		@Id = Role.Id, @UserId = Loggged User Id
-- OutPut:		nvarchar(max) return to the end user or error in string format
-- Error:		in case of error, the details are logged in Files\log folder
-- =============================================

Create PROCEDURE [dbo].[ImsProcRoleCheck] @Id uniqueidentifier, @UserId uniqueidentifier
	
AS
BEGIN
	Declare @returnCheck as nvarchar(max);
  
	BEGIN TRY 
		-- include script here
		SET @returnCheck='The object has been checked'

		select @returnCheck;
	END TRY  
	
	BEGIN CATCH 
		RETURN 'Sql Error- Number:' + cast (ERROR_NUMBER() as nvarchar(max)) + ' ;Message:' + ERROR_MESSAGE();
	END CATCH;

END

GO
