SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE PROCEDURE [dbo].[ImsProcAssetsCheck] @Ids AssetIds Readonly, @UserId uniqueidentifier
	
AS
BEGIN

	BEGIN TRY  

	select 1;

	END TRY
	
	BEGIN CATCH 
		RETURN 'Sql Error- Number:' + cast (ERROR_NUMBER() as nvarchar(max)) + ' ;Message:' + ERROR_MESSAGE();
	END CATCH;

END
GO
