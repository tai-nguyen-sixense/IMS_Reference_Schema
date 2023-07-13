SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE PROCEDURE [dbo].[ImsProcFileSaveAfter]
@type nvarchar(400),
@id uniqueidentifier,
@name nvarchar(400),
@fileTypeId uniqueidentifier,
@folderTypeId uniqueidentifier
	
AS
BEGIN
	BEGIN TRY  
		select 1
	END TRY
	BEGIN CATCH 
		RETURN 'Sql Error- Number:' + cast (ERROR_NUMBER() as nvarchar(max)) + ' ;Message:' + ERROR_MESSAGE();
	END CATCH
END
GO
