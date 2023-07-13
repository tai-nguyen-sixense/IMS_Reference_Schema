SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


-- =============================================
-- Author:		Vincent Morisseau
-- Create date: 2017-11-15
-- Description:	Run before saving by the api
-- InPut:		@Id = Asset.Id, @assetJson= default asset in json format, @UserId = Loggged User Id
-- OutPut:		asset in json format nvarchar(max) or error in string format
-- Error:		in case of error, the details are logged in Files\log folder
-- =============================================

CREATE PROCEDURE [dbo].[ImsProcAssetSaveBefore] @Id uniqueidentifier, @assetJson nvarchar(max), @UserId uniqueidentifier
	
AS
BEGIN
Declare @returnAssetJson as nvarchar(max);
    
	BEGIN TRY  
		SET @returnAssetJson=@assetJson;
        -- @assetJson is something like 
		--  {"latitude":null,"longitude":null,"polyline":null,"attributeValues":null,"isActive":true,"allow":{"actOn":true,"edit":true,"delete":true,"copy":true,"lockedFields":["number"]},"contacts":null,"knwlType":{"id":"7165a2a0-c0d3-4153-a0fd-74ab98301b79","name":"Bridge","color":"#3EBCBD","icon":"bridge","attributeFields":[]},"comments":null,"imageUrl":null,"id":"7148B006-1722-4482-88BC-652D4100C373","name":null,"number":null}
		-- the procedure can be customized : using simple replace
					-- set @returnAssetJson=replace(@assetJson,'"comments":null','"comments":"please add comments"');

		-- include script here
		select @returnAssetJson;
	END TRY  
	
	BEGIN CATCH 
		RETURN 'Sql Error- Number:' + cast (ERROR_NUMBER() as nvarchar(max)) + ' ;Message:' + ERROR_MESSAGE();
	END CATCH;

END
GO
