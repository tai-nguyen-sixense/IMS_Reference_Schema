SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE PROCEDURE [dbo].[ImsProcInspectionCopyAfter] @InspectionIdFrom uniqueidentifier, @InspectionIdTo uniqueidentifier, @UserId uniqueidentifier
	
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
