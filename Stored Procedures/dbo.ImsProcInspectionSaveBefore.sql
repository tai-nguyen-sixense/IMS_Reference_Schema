SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


-- =============================================
-- Author:		Vincent Morisseau
-- Create date: 2017-11-15
-- Description:	Run before saving by the api
-- InPut:		@Id = Inspection.Id, @inspectionJson= default inspection in json format, @UserId = Loggged User Id
-- OutPut:		inspection in json format nvarchar(max) or error in string format
-- Error:		in case of error, the details are logged in Files\log folder
-- =============================================

CREATE PROCEDURE [dbo].[ImsProcInspectionSaveBefore] @Id uniqueidentifier, @inspectionJson nvarchar(max), @UserId uniqueidentifier
	
AS
BEGIN
Declare @returnInspectionJson as nvarchar(max);
    
	BEGIN TRY  
		SET @returnInspectionJson=@inspectionJson;
        -- @inspectionJson is something like 
		--  {"attributeValues":null,"asset":{"knwlType":{"id":"7165a2a0-c0d3-4153-a0fd-74ab98301b79","name":"Bridge","color":"#3EBCBD","icon":"bridge","attributeFields":[]},"comments":"toto","imageUrl":null,"id":"4b933481-2149-471b-b2c9-df955504644d","name":"GURNEY CREEK WHITEMAN BRIDGE","number":" 1 -  85/"},"routings":null,"photos":null,"latitude":null,"longitude":null,"allow":{"actOn":true,"edit":true,"delete":true,"copy":true,"check":true,"lockedFields":["number"]},"taskParent":null,"assetComponentId":null,"inspectionSheetId":null,"attributeFieldId":null,"description":null,"comments":null,"knwlStatu":{"id":"236bc2a6-78c0-47e0-b4f0-85c3308d4b22","name":"Open","color":"#0F0F9B","icon":"inspection","position":1},"knwlPriority":null,"date":"2017-11-17T18:51:53.7505489+01:00","imageUrl":null,"assetComponent":null,"attributeValue":null,"id":"05e26a44-aab8-4dcb-8a02-74d108a1b0cf","route":"inspection","number":null,"knwlType":{"id":"a9c2b7dd-094a-468a-a6b4-6a6e2c2a18ac","name":"Regular OSIM","color":"#38E4DB","icon":"inspection","attributeFields":[]}}
		-- the procedure can be customized : using simple replace
					-- set @returnInspectionJson=replace(@inspectionJson,'"comments":null','"comments":"please add comments"');

		-- include script here
		select @returnInspectionJson;
	END TRY  
	
	BEGIN CATCH 
		RETURN 'Sql Error- Number:' + cast (ERROR_NUMBER() as nvarchar(max)) + ' ;Message:' + ERROR_MESSAGE();
	END CATCH;

END
GO
