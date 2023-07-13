SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


-- =============================================
-- Author:		Vincent Morisseau
-- Create date: 2017-11-15
-- Description:	Run before saving by the api
-- InPut:		@Id = Document.Id, @documentJson= default document in json format, @UserId = Loggged User Id
-- OutPut:		document in json format nvarchar(max) or error in string format
-- Error:		in case of error, the details are logged in Files\log folder
-- =============================================

CREATE PROCEDURE [dbo].[ImsProcDocumentSaveBefore] @Id uniqueidentifier, @documentJson nvarchar(max), @UserId uniqueidentifier
	
AS
BEGIN
Declare @returnDocumentJson as nvarchar(max);
    
	BEGIN TRY  
		SET @returnDocumentJson=@documentJson;
        -- @documentJson is something like 
		--  {"attributeValues":null,"asset":{"knwlType":{"id":"7165a2a0-c0d3-4153-a0fd-74ab98301b79","name":"Bridge","color":"#3EBCBD","icon":"bridge","attributeFields":[]},"comments":"toto","imageUrl":null,"id":"4b933481-2149-471b-b2c9-df955504644d","name":"GURNEY CREEK WHITEMAN BRIDGE","number":" 1 -  85/"},"allow":{"actOn":true,"edit":true,"delete":true,"copy":true,"check":true,"lockedFields":[]},"id":"29fdb90c-a5bd-4b2f-9719-5f83be87faaa","name":null,"comments":null,"knwlType":{"id":"1daf060d-a227-4047-ae3f-009b912604a6","name":"Report","color":"#0F0F9B","icon":"flag","attributeFields":null},"date":"2017-11-17T18:48:09.5406681+01:00","currentRevision":{"id":"f8e41335-5106-475e-b2fb-c570d5a6b080","comments":null,"knwlRevision":{"id":"f0300553-92f8-4871-8bc0-8a1116ed68bc","name":"Xxx"},"knwlStatu":{"id":"de67dd2c-77ee-48d0-8c09-b666fc511184","name":"Xxx","color":"#0F0F9B","icon":"flag","position":1},"date":"2017-11-17T18:48:09.5406681+01:00","downloadUrl":null,"downloadName":null},"downloadUrl":null,"imageUrl":null,"downloadName":null}
		-- the procedure can be customized : using simple replace
					-- set @returnDocumentJson=replace(@documentJson,'"comments":null','"comments":"please add comments"');

		-- include script here
		select @returnDocumentJson;
	END TRY  
	
	BEGIN CATCH 
		RETURN 'Sql Error- Number:' + cast (ERROR_NUMBER() as nvarchar(max)) + ' ;Message:' + ERROR_MESSAGE();
	END CATCH;

END
GO
