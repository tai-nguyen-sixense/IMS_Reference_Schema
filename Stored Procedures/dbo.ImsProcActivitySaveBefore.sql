SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


-- =============================================
-- Author:		Vincent Morisseau
-- Create date: 2017-11-15
-- Description:	Run before saving by the api
-- InPut:		@Id = Activity.Id, @activityJson= default activity in json format, @UserId = Loggged User Id
-- OutPut:		activity in json format nvarchar(max) or error in string format
-- Error:		in case of error, the details are logged in Files\log folder
-- =============================================

CREATE PROCEDURE [dbo].[ImsProcActivitySaveBefore] @Id uniqueidentifier, @activityJson nvarchar(max), @UserId uniqueidentifier
	
AS
BEGIN
Declare @returnActivityJson as nvarchar(max);
    
	BEGIN TRY  
		SET @returnActivityJson=@activityJson;
        -- @activityJson is something like 
		--  {"attributeValues":null,"asset":{"knwlType":{"id":"7165a2a0-c0d3-4153-a0fd-74ab98301b79","name":"Bridge","color":"#3EBCBD","icon":"bridge","attributeFields":[]},"comments":"Soprema Soprajoints failed and are leaking.","imageUrl":null,"id":"2f20f775-42ec-4df7-b253-a56621965212","name":"WEST STREET UNDERPASS","number":" 1 -  43/"},"routings":null,"photos":null,"latitude":null,"longitude":null,"allow":{"actOn":true,"edit":true,"delete":true,"copy":true,"check":true,"lockedFields":[]},"taskParent":null,"assetComponentId":null,"inspectionSheetId":null,"attributeFieldId":null,"description":null,"comments":null,"knwlStatu":{"id":"c12d109c-c7de-4466-bcd5-06ee25c7b65d","name":"Xxx","color":"#0F0F9B","icon":"activity","position":1},"knwlPriority":{"id":"7b83d55e-6b36-474e-bc56-55edd934b82a","name":"Xxx","color":"#0F0F9B","icon":"flag"},"date":"2017-11-17T19:05:07.0683121+01:00","imageUrl":null,"assetComponent":null,"attributeValue":null,"id":"9146550e-89c1-4b61-aba9-aa5db2e84d28","route":"activity","number":null,"knwlType":{"id":"dc5a4663-2759-4b35-8306-e05d66acc1f0","name":"Xxx","color":"#0F0F9B","icon":"activity","attributeFields":[]}}
		-- the procedure can be customized : using simple replace
					-- set @returnActivityJson=replace(@activityJson,'"comments":null','"comments":"please add comments"');

		-- include script here
		select @returnActivityJson;
	END TRY  
	
	BEGIN CATCH 
		RETURN 'Sql Error- Number:' + cast (ERROR_NUMBER() as nvarchar(max)) + ' ;Message:' + ERROR_MESSAGE();
	END CATCH;

END
GO
