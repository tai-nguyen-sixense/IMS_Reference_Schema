SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

-- =============================================
-- Author:		Vincent Morisseau
-- Create date: 2017-11-17
-- Description:	Return taskPhoto in json format when user creates a new taskPhoto
-- InPut:		@Id = TaskPhoto.Id, @taskPhotoJson= default taskPhoto in json format, @UserId = Loggged User Id
-- OutPut:		taskPhoto in json format nvarchar(max) or error in string format
-- Error:		in case of error, the details are logged in Files\log folder
-- =============================================

CREATE PROCEDURE [dbo].[ImsProcTaskPhotoNew] @Id uniqueidentifier,@taskPhotoJson nvarchar(max), @UserId uniqueidentifier
	
AS
BEGIN

	Declare @returnTaskPhotoJson as nvarchar(max);
    
	BEGIN TRY  
		SET @returnTaskPhotoJson=@taskPhotoJson;
        -- @taskPhotoJson is something like 
		--  {"latitude":null,"longitude":null,"polyline":null,"attributeValues":null,"isActive":true,"allow":{"actOn":true,"edit":true,"delete":true,"copy":true,"lockedFields":["number"]},"taskPhotos":null,"knwlType":{"id":"7165a2a0-c0d3-4153-a0fd-74ab98301b79","name":"Bridge","color":"#3EBCBD","icon":"bridge","attributeFields":[]},"comments":null,"imageUrl":null,"id":"7148B006-1722-4482-88BC-652D4100C373","name":null,"number":null}
		-- the procedure can be customized :
		--    - or using simple replace
					-- set @returnTaskPhotoJson=replace(@taskPhotoJson,'"name":null','"name":"default name for taskPhoto"');
		--    - or rewrite the taskPhoto object
					-- set @returnTaskPhotoJson='{"latitude":null,"longitude":null,"polyline":null,"attributeValues":null,"isActive":true,"allow":{"actOn":true,"edit":true,"delete":true,"copy":true,"lockedFields":["number"]},"taskPhotos":null,"knwlType":{"id":"7165a2a0-c0d3-4153-a0fd-74ab98301b79","name":"Bridge","color":"#3EBCBD","icon":"bridge","attributeFields":[]},"comments":null,"imageUrl":null,"id":"' +  cast(@Id as nvarchar(max)) + '","name":"full new taskPhoto","number":null}';

		-- include script here
		select @returnTaskPhotoJson;
	END TRY  
	
	BEGIN CATCH 
		RETURN 'Sql Error- Number:' + cast (ERROR_NUMBER() as nvarchar(max)) + ' ;Message:' + ERROR_MESSAGE();
	END CATCH;

END
GO
