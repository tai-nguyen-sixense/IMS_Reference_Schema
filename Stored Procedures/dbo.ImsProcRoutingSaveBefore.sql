SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


-- =============================================
-- Author:		Vincent Morisseau
-- Create date: 2017-11-15
-- Description:	Run before saving by the api
-- InPut:		@Id = Routing.Id, @routingJson= default routing in json format, @UserId = Loggged User Id
-- OutPut:		routing in json format nvarchar(max) or error in string format
-- Error:		in case of error, the details are logged in Files\log folder
-- =============================================

CREATE PROCEDURE [dbo].[ImsProcRoutingSaveBefore] @Id uniqueidentifier, @routingJson nvarchar(max), @UserId uniqueidentifier
	
AS
BEGIN
Declare @returnRoutingJson as nvarchar(max);
    
	BEGIN TRY  
		SET @returnRoutingJson=@routingJson;
        -- @routingJson is something like 
		--  {"allow":{"actOn":true,"edit":true,"delete":true,"copy":true,"check":true,"lockedFields":[]},"comments":null,"dateReceived":null,"task":{"description":null,"comments":null,"knwlStatu":{"id":"dd93063d-34ad-4b90-89b6-19b44b22c7c5","name":"Incomplete","color":"#CAD739","icon":"inspection","position":6},"knwlPriority":null,"date":"2017-06-20T13:10:00","imageUrl":null,"assetComponent":null,"attributeValue":null,"id":"2b09c036-e91f-4229-a1ae-003f0d4f499f","route":"inspection","number":"63489239","knwlType":{"id":"a9c2b7dd-094a-468a-a6b4-6a6e2c2a18ac","name":"Regular OSIM","color":"#38E4DB","icon":"inspection","attributeFields":[]},"attributeValues":[{"allowedValue":null,"valueText":null,"valueNumeric":null,"valueBool":null,"valueDate":null,"comments":null,"attributeField":{"id":"8e0ffa3e-7377-40f3-9012-e202c85a9ce9","position":1,"name":null,"type":null,"sqlType":null,"isAlwaysReadOnly":false,"chapter":null,"allowableValues":null}},{"allowedValue":null,"valueText":null,"valueNumeric":null,"valueBool":null,"valueDate":null,"comments":null,"attributeField":{"id":"820b8341-dcc1-4d67-b1f8-57d000827939","position":1,"name":null,"type":null,"sqlType":null,"isAlwaysReadOnly":false,"chapter":null,"allowableValues":null}},{"allowedValue":null,"valueText":null,"valueNumeric":null,"valueBool":null,"valueDate":null,"comments":null,"attributeField":{"id":"dc53a1fa-c2d6-4a22-9d15-54e54d279a3b","position":1,"name":null,"type":null,"sqlType":null,"isAlwaysReadOnly":false,"chapter":null,"allowableValues":null}},{"allowedValue":null,"valueText":null,"valueNumeric":null,"valueBool":null,"valueDate":null,"comments":null,"attributeField":{"id":"b7db29f8-78b4-48ea-b2da-5859ccdef6cd","position":1,"name":null,"type":null,"sqlType":null,"isAlwaysReadOnly":false,"chapter":null,"allowableValues":null}},{"allowedValue":null,"valueText":null,"valueNumeric":null,"valueBool":null,"valueDate":null,"comments":null,"attributeField":{"id":"6664a82e-5d22-489e-8ae7-4420b2c0a0f0","position":1,"name":null,"type":null,"sqlType":null,"isAlwaysReadOnly":false,"chapter":null,"allowableValues":null}},{"allowedValue":null,"valueText":null,"valueNumeric":null,"valueBool":null,"valueDate":null,"comments":null,"attributeField":{"id":"a6428be7-39ef-47aa-a62d-0aa924c30823","position":1,"name":null,"type":null,"sqlType":null,"isAlwaysReadOnly":false,"chapter":null,"allowableValues":null}},{"allowedValue":null,"valueText":null,"valueNumeric":null,"valueBool":null,"valueDate":null,"comments":null,"attributeField":{"id":"ec62d39a-baa3-48dd-83f0-20a5c80d2e94","position":1,"name":null,"type":null,"sqlType":null,"isAlwaysReadOnly":false,"chapter":null,"allowableValues":null}},{"allowedValue":null,"valueText":null,"valueNumeric":null,"valueBool":null,"valueDate":null,"comments":null,"attributeField":{"id":"cc82bbb0-1c86-422a-b385-9ebfb81e9c68","position":1,"name":null,"type":null,"sqlType":null,"isAlwaysReadOnly":false,"chapter":null,"allowableValues":null}},{"allowedValue":null,"valueText":null,"valueNumeric":null,"valueBool":null,"valueDate":null,"comments":null,"attributeField":{"id":"1d0ef01b-4d9d-4133-b9a1-aaa1ea1f0a29","position":1,"name":null,"type":null,"sqlType":null,"isAlwaysReadOnly":false,"chapter":null,"allowableValues":null}},{"allowedValue":null,"valueText":null,"valueNumeric":null,"valueBool":null,"valueDate":null,"comments":null,"attributeField":{"id":"8e8a0951-9ca4-4156-9ca0-ee6491d1a91b","position":1,"name":null,"type":null,"sqlType":null,"isAlwaysReadOnly":false,"chapter":null,"allowableValues":null}},{"allowedValue":null,"valueText":null,"valueNumeric":null,"valueBool":null,"valueDate":null,"comments":null,"attributeField":{"id":"7a5474b4-ad27-43a7-ac3c-b6289c76bb6d","position":1,"name":null,"type":null,"sqlType":null,"isAlwaysReadOnly":false,"chapter":null,"allowableValues":null}},{"allowedValue":null,"valueText":null,"valueNumeric":null,"valueBool":null,"valueDate":null,"comments":null,"attributeField":{"id":"bb0f15cc-be92-4800-a6c6-350bc226d41c","position":1,"name":null,"type":null,"sqlType":null,"isAlwaysReadOnly":false,"chapter":null,"allowableValues":null}}],"asset":{"knwlType":{"id":"7165a2a0-c0d3-4153-a0fd-74ab98301b79","name":"Bridge","color":"#3EBCBD","icon":"bridge","attributeFields":[]},"comments":"toto","imageUrl":null,"id":"d3f3a4f0-4b3e-4aa4-9887-9c3ad6022586","name":"ETOBICOKE CREEK BRIDGE WIDENING (EB & WB)","number":"37 - 237/2"},"routings":null,"photos":null,"latitude":null,"longitude":null,"allow":{"actOn":true,"edit":true,"delete":false,"copy":true,"check":true,"lockedFields":["number"]},"taskParent":null,"assetComponentId":null,"inspectionSheetId":null,"attributeFieldId":null},"taskOrder":null,"document":null,"businessRules":[{"users":[{"id":"8fd6c0a9-ea53-4bad-aa06-b9d78ec2de6c","firstName":"Vincent","lastName":"Morisseau","imageUrl":null,"name":"Vincent Morisseau"}],"id":"dd93063d-34ad-4b90-89b6-19b44b22c7c5","name":"Incomplete","color":"#CAD739","icon":"inspection","position":6}],"id":"850d50e4-f818-44cd-88dc-eaac862dd1ad","userFrom":{"id":"8fd6c0a9-ea53-4bad-aa06-b9d78ec2de6c","firstName":"Vincent","lastName":"Morisseau","imageUrl":null,"name":"Vincent Morisseau"},"userTo":{"id":"8fd6c0a9-ea53-4bad-aa06-b9d78ec2de6c","firstName":"Vincent","lastName":"Morisseau","imageUrl":null,"name":"Vincent Morisseau"},"asset":{"id":"d3f3a4f0-4b3e-4aa4-9887-9c3ad6022586","name":"ETOBICOKE CREEK BRIDGE WIDENING (EB & WB)","number":"37 - 237/2"},"dateSent":"2017-11-20T10:14:20.7913529+01:00","MailSent":false,"knwlType":{"id":"61d7cf54-7b0c-4f7a-ab42-d2158994890e","name":"Xxx","color":"#0F0F9B","icon":"flag","attributeFields":null},"knwlStatu":{"users":[{"id":"8fd6c0a9-ea53-4bad-aa06-b9d78ec2de6c","firstName":"Vincent","lastName":"Morisseau","imageUrl":null,"name":"Vincent Morisseau"}],"id":"dd93063d-34ad-4b90-89b6-19b44b22c7c5","name":"Incomplete","color":"#CAD739","icon":"inspection","position":6},"isActive":false,"position":0}
		-- the procedure can be customized : using simple replace
					-- set @returnRoutingJson=replace(@routingJson,'"comments":null','"comments":"please add comments"');

		-- include script here
		select @returnRoutingJson;
	END TRY  
	
	BEGIN CATCH 
		RETURN 'Sql Error- Number:' + cast (ERROR_NUMBER() as nvarchar(max)) + ' ;Message:' + ERROR_MESSAGE();
	END CATCH;

END
GO
