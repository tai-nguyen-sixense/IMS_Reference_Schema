SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


-- =============================================
-- Author:		Vincent Morisseau
-- Create date: 2017-11-15
-- Description:	Run before saving by the api
-- InPut:		@Id = AssetComponent.Id, @assetComponentJson= default assetComponent in json format, @UserId = Loggged User Id
-- OutPut:		assetComponent in json format nvarchar(max) or error in string format
-- Error:		in case of error, the details are logged in Files\log folder
-- =============================================

CREATE PROCEDURE [dbo].[ImsProcAssetComponentSaveBefore] @Id uniqueidentifier, @assetComponentJson nvarchar(max), @UserId uniqueidentifier
	
AS
BEGIN
Declare @returnAssetComponentJson as nvarchar(max);
    
	BEGIN TRY  
		SET @returnAssetComponentJson=@assetComponentJson;
        -- @assetComponentJson is something like 
		--  {"latitude":null,"longitude":null,"polyline":null,"attributeValues":null,"allow":{"actOn":true,"edit":true,"delete":true,"copy":true,"check":true,"lockedFields":[]},"position":1,"knwlType":{"id":"b9f5a749-c95a-417c-8424-fd2cdf335823","name":"Decks","color":"#D1B9B9","icon":"flag","attributeFields":null},"comments":null,"asset":{"knwlType":{"id":"7165a2a0-c0d3-4153-a0fd-74ab98301b79","name":"Bridge","color":"#3EBCBD","icon":"bridge","attributeFields":[]},"comments":"totot","imageUrl":null,"id":"131a9293-1b83-4324-86e8-342da8da4d64","name":"NORTH PARK STEET UNDERPASS","number":" 1 -  44/"},"assetComponent":null,"id":"70697d65-b5db-4f73-851e-fd933d27684c","name":null,"number":null,"fullName":null,"fullPath":null}
		-- the procedure can be customized : using simple replace
					-- set @returnAssetComponentJson=replace(@assetComponentJson,'"comments":null','"comments":"please add comments"');

		-- include script here
		select @returnAssetComponentJson;
	END TRY  
	
	BEGIN CATCH 
		RETURN 'Sql Error- Number:' + cast (ERROR_NUMBER() as nvarchar(max)) + ' ;Message:' + ERROR_MESSAGE();
	END CATCH;

END
GO
