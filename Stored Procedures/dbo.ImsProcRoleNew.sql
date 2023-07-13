SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

-- =============================================
-- Author:		Aaron Kinfe
-- Create date: 2021-10-03
-- Description:	Return team in json format when user creates a new team
-- InPut:		@Id = Team.Id, @teamJson= default team in json format, @UserId = Loggged User Id
-- OutPut:		role in json format nvarchar(max) or error in string format
-- Error:		in case of error, the details are logged in Files\log folder
-- =============================================

Create PROCEDURE [dbo].[ImsProcRoleNew] @Id uniqueidentifier,@roleJson nvarchar(max), @UserId uniqueidentifier
	
AS
BEGIN

	Declare @returnRoleJson as nvarchar(max);
    
	BEGIN TRY  
		SET @returnRoleJson=@roleJson;
      
		-- include script here
		select @returnRoleJson;
	END TRY  
	
	BEGIN CATCH 
		RETURN 'Sql Error- Number:' + cast (ERROR_NUMBER() as nvarchar(max)) + ' ;Message:' + ERROR_MESSAGE();
	END CATCH;

END

GO
