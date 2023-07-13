SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE PROCEDURE [dbo].[ImsProcAssetComponentsSaveAfter] @AssetId uniqueidentifier,  @UserId uniqueidentifier
	
AS
BEGIN
	Declare @returnDone as nvarchar(max);
  
	BEGIN TRY 

		SELECT 1;
	END TRY  
	
	BEGIN CATCH 
		RETURN 'Sql Error- Number:' + cast (ERROR_NUMBER() as nvarchar(max)) + ' ;Message:' + ERROR_MESSAGE();
	END CATCH;

END
GO
