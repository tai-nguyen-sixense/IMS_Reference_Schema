SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

-- =============================================
-- Author:		Vincent Morisseau
-- Create date: 2017-11-17
-- Description:	Return audit in json format when user creates a new audit
-- InPut:		@Id = Audit.Id, @auditJson= default audit in json format, @UserId = Loggged User Id
-- OutPut:		audit in json format nvarchar(max) or error in string format
-- Error:		in case of error, the details are logged in Files\log folder
-- =============================================

CREATE PROCEDURE [dbo].[ImsProcAuditNew] @Id uniqueidentifier,@auditJson nvarchar(max), @UserId uniqueidentifier
	
AS
BEGIN

	Declare @returnAuditJson as nvarchar(max);
    
	BEGIN TRY  
		SET @returnAuditJson=@auditJson;
        -- @auditJson is something like 
		--  {"attributeValues":null,"asset":{"knwlType":{"id":"7165a2a0-c0d3-4153-a0fd-74ab98301b79","name":"Bridge","color":"#3EBCBD","icon":"bridge","attributeFields":[]},"comments":"Soprema Soprajoints failed and are leaking.","imageUrl":null,"id":"2f20f775-42ec-4df7-b253-a56621965212","name":"WEST STREET UNDERPASS","number":" 1 -  43/"},"routings":null,"photos":null,"latitude":null,"longitude":null,"allow":{"actOn":true,"edit":true,"delete":true,"copy":true,"check":true,"lockedFields":[]},"taskParent":null,"assetComponentId":null,"inspectionSheetId":null,"attributeFieldId":null,"description":null,"comments":null,"knwlStatu":{"id":"fa1dcc5b-06d1-4ebe-8c3d-c8d632e9e9b1","name":"Open","color":"#0F0F9B","icon":"inspection","position":1},"knwlPriority":null,"date":"2017-11-17T19:03:43.3988869+01:00","imageUrl":null,"assetComponent":null,"attributeValue":null,"id":"f4603513-b73a-4383-82ba-e6fb5267414d","route":"audit","number":null,"knwlType":{"id":"acbc9369-39d9-4080-90c0-db36b5174e96","name":"Incident","color":"#0F0F9B","icon":"inspection","attributeFields":[]}}
		-- the procedure can be customized :
		--    - or using simple replace
					-- set @returnAuditJson=replace(@auditJson,'"number":null','"number":"default number for audit"');
		--    - or rewrite the audit object
					-- set @returnAuditJson='{"attributeValues":null,"asset":{"knwlType":{"id":"7165a2a0-c0d3-4153-a0fd-74ab98301b79","name":"Bridge","color":"#3EBCBD","icon":"bridge","attributeFields":[]},"comments":"Soprema Soprajoints failed and are leaking.","imageUrl":null,"id":"2f20f775-42ec-4df7-b253-a56621965212","name":"WEST STREET UNDERPASS","number":" 1 -  43/"},"routings":null,"photos":null,"latitude":null,"longitude":null,"allow":{"actOn":true,"edit":true,"delete":true,"copy":true,"check":true,"lockedFields":[]},"taskParent":null,"assetComponentId":null,"inspectionSheetId":null,"attributeFieldId":null,"description":null,"comments":null,"knwlStatu":{"id":"fa1dcc5b-06d1-4ebe-8c3d-c8d632e9e9b1","name":"Open","color":"#0F0F9B","icon":"inspection","position":1},"knwlPriority":null,"date":"2017-11-17T19:03:43.3988869+01:00","imageUrl":null,"assetComponent":null,"attributeValue":null,"id":"f4603513-b73a-4383-82ba-e6fb5267414d","route":"audit","number":null,"knwlType":{"id":"acbc9369-39d9-4080-90c0-db36b5174e96","name":"Incident","color":"#0F0F9B","icon":"inspection","attributeFields":[]}}';

		-- include script here
		select @returnAuditJson;
	END TRY  
	
	BEGIN CATCH 
		RETURN 'Sql Error- Number:' + cast (ERROR_NUMBER() as nvarchar(max)) + ' ;Message:' + ERROR_MESSAGE();
	END CATCH;

END
GO
