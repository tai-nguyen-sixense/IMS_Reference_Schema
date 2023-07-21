SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE PROCEDURE [dbo].[ImsProcAssetComponentsSaveBefore] @Data AssetComponentCheckBefore Readonly, @UserId uniqueidentifier
	
AS
BEGIN
	BEGIN TRY  
		return 1; -- Use return TO NOT SHOW a message to the user
		-- select 1; -- Use select TO SHOW a message to the user
	END TRY
	
	BEGIN CATCH 
		RETURN 'Sql Error- Number:' + cast (ERROR_NUMBER() as nvarchar(max)) + ' ;Message:' + ERROR_MESSAGE();
	END CATCH;

END
GO
