SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

-- =============================================
-- Author:		Scanprint IMS Dev Team
-- Create date: 2021-11-29
-- Description:	Check flatform asset components
-- InPut:		@Id = InspectionId, @ComponentId: AssetComponentId, @UserId = Logged User Id
-- OutPut:		1 or error in string format
-- Error:		in case of error, the details are logged in Files\log folder
-- =============================================

CREATE PROCEDURE [dbo].[ImsProcInspectionFlatformCheck] @InspectionId uniqueidentifier, @ComponentId uniqueidentifier, @UserId uniqueidentifier
	
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
