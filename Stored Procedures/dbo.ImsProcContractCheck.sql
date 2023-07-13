SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO




-- =============================================
-- Author:		Scanprint IMS Dev Team
-- Create date: 2020-05-04
-- Description:	Run on demand by end user
-- InPut:		@Id = Contract.Id, @UserId = Loggged User Id
-- OutPut:		nvarchar(max) return to the end user or error in string format
-- Error:		in case of error, the details are logged in Files\log folder
-- =============================================

CREATE PROCEDURE [dbo].[ImsProcContractCheck] @Id uniqueidentifier, @UserId uniqueidentifier
	
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
