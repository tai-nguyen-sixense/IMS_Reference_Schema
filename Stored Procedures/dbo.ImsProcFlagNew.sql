SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

-- =============================================
-- Author:		Vincent Morisseau
-- Create date: 2017-11-17
-- Description:	Return flag in json format when user creates a new flag
-- InPut:		@Id = Flag.Id, @flagJson= default flag in json format, @UserId = Loggged User Id
-- OutPut:		flag in json format nvarchar(max) or error in string format
-- Error:		in case of error, the details are logged in Files\log folder
-- =============================================

CREATE PROCEDURE [dbo].[ImsProcFlagNew] @Id uniqueidentifier,@flagJson nvarchar(max), @UserId uniqueidentifier
	
AS
BEGIN

	Declare @returnFlagJson as nvarchar(max);
    
	BEGIN TRY  
		SET @returnFlagJson=@flagJson;
        -- @flagJson is something like 
		--  {"attributeValues":null,"asset":{"knwlType":{"id":"7165a2a0-c0d3-4153-a0fd-74ab98301b79","name":"Bridge","color":"#3EBCBD","icon":"bridge","attributeFields":[]},"comments":"toto","imageUrl":null,"id":"4b933481-2149-471b-b2c9-df955504644d","name":"GURNEY CREEK WHITEMAN BRIDGE","number":" 1 -  85/"},"routings":null,"photos":null,"latitude":43.13748947,"longitude":-80.36729741,"allow":{"actOn":true,"edit":true,"delete":true,"copy":true,"check":true,"lockedFields":["number"]},"taskParent":null,"assetComponentId":null,"inspectionSheetId":null,"attributeFieldId":null,"description":null,"comments":null,"knwlStatu":{"id":"51951d4a-aca6-4ec4-9fcc-de88b44d93d4","name":"Open","color":"#E62E2E","icon":"flag","position":1},"knwlPriority":{"id":"9232105b-d3e5-4d9c-a6e6-cbc08b86581b","name":"Low","color":"#24E631","icon":"flag"},"date":"2017-11-17T18:50:23.3331777+01:00","imageUrl":null,"assetComponent":null,"attributeValue":null,"id":"150f6f5c-d709-4729-982d-62cce0ce1b7b","route":"flag","number":null,"knwlType":{"id":"bcd9a26d-6f1d-43a4-aebb-9f6b8f9314fe","name":"Maintenance Work 1","color":"#0F0F9B","icon":"flag","attributeFields":[]}}
		-- the procedure can be customized :
		--    - or using simple replace
					-- set @returnFlagJson=replace(@flagJson,'"number":null','"number":"default number for flag"');
		--    - or rewrite the flag object
					-- set @returnFlagJson='{"attributeValues":null,"asset":{"knwlType":{"id":"7165a2a0-c0d3-4153-a0fd-74ab98301b79","name":"Bridge","color":"#3EBCBD","icon":"bridge","attributeFields":[]},"comments":"toto","imageUrl":null,"id":"4b933481-2149-471b-b2c9-df955504644d","name":"GURNEY CREEK WHITEMAN BRIDGE","number":" 1 -  85/"},"routings":null,"photos":null,"latitude":43.13748947,"longitude":-80.36729741,"allow":{"actOn":true,"edit":true,"delete":true,"copy":true,"check":true,"lockedFields":["number"]},"taskParent":null,"assetComponentId":null,"inspectionSheetId":null,"attributeFieldId":null,"description":null,"comments":null,"knwlStatu":{"id":"51951d4a-aca6-4ec4-9fcc-de88b44d93d4","name":"Open","color":"#E62E2E","icon":"flag","position":1},"knwlPriority":{"id":"9232105b-d3e5-4d9c-a6e6-cbc08b86581b","name":"Low","color":"#24E631","icon":"flag"},"date":"2017-11-17T18:50:23.3331777+01:00","imageUrl":null,"assetComponent":null,"attributeValue":null,"id":"150f6f5c-d709-4729-982d-62cce0ce1b7b","route":"flag","number":null,"knwlType":{"id":"bcd9a26d-6f1d-43a4-aebb-9f6b8f9314fe","name":"Maintenance Work 1","color":"#0F0F9B","icon":"flag","attributeFields":[]}}';

		-- include script here
		select @returnFlagJson;
	END TRY  
	
	BEGIN CATCH 
		RETURN 'Sql Error- Number:' + cast (ERROR_NUMBER() as nvarchar(max)) + ' ;Message:' + ERROR_MESSAGE();
	END CATCH;

END
GO
