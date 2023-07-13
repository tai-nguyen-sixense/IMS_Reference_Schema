SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

-- =============================================
-- Author:		Vincent Morisseau
-- Create date: 2017-11-17
-- Description:	Return photo in json format when user creates a new photo
-- InPut:		@Id = Photo.Id, @photoJson= default photo in json format, @UserId = Loggged User Id
-- OutPut:		photo in json format nvarchar(max) or error in string format
-- Error:		in case of error, the details are logged in Files\log folder
-- =============================================

CREATE PROCEDURE [dbo].[ImsProcPhotoNew] @Id uniqueidentifier,@photoJson nvarchar(max), @UserId uniqueidentifier
	
AS
BEGIN

	Declare @returnPhotoJson as nvarchar(max);
    
	BEGIN TRY  
		SET @returnPhotoJson=@photoJson;
        -- @photoJson is something like 
		--  {"id":"9d1f3c5e-160e-4f11-83ae-4e1dc8183740","name":null,"comments":null,"imageUrl":null,"downloadUrl":null,"date":"2017-11-17T19:06:32.0585101+01:00","asset":{"knwlType":{"id":"7165a2a0-c0d3-4153-a0fd-74ab98301b79","name":"Bridge","color":"#3EBCBD","icon":"bridge","attributeFields":[]},"comments":"Soprema Soprajoints failed and are leaking.","imageUrl":null,"id":"2f20f775-42ec-4df7-b253-a56621965212","name":"WEST STREET UNDERPASS","number":" 1 -  43/"},"knwlType":{"id":"158a895c-9483-49ce-a9aa-1d6fc192c289","name":"General","color":"#0F0F9B","icon":"flag","attributeFields":null},"allow":{"actOn":true,"edit":true,"delete":true,"copy":true,"check":true,"lockedFields":[]},"downloadName":null}
		-- the procedure can be customized :
		--    - or using simple replace
					-- set @returnPhotoJson=replace(@photoJson,'"name":null','"name":"default name for photo"');
		--    - or rewrite the photo object
					-- set @returnPhotoJson='{"id":"9d1f3c5e-160e-4f11-83ae-4e1dc8183740","name":null,"comments":null,"imageUrl":null,"downloadUrl":null,"date":"2017-11-17T19:06:32.0585101+01:00","asset":{"knwlType":{"id":"7165a2a0-c0d3-4153-a0fd-74ab98301b79","name":"Bridge","color":"#3EBCBD","icon":"bridge","attributeFields":[]},"comments":"Soprema Soprajoints failed and are leaking.","imageUrl":null,"id":"2f20f775-42ec-4df7-b253-a56621965212","name":"WEST STREET UNDERPASS","number":" 1 -  43/"},"knwlType":{"id":"158a895c-9483-49ce-a9aa-1d6fc192c289","name":"General","color":"#0F0F9B","icon":"flag","attributeFields":null},"allow":{"actOn":true,"edit":true,"delete":true,"copy":true,"check":true,"lockedFields":[]},"downloadName":null}';

		-- include script here
		select @returnPhotoJson;
	END TRY  
	
	BEGIN CATCH 
		RETURN 'Sql Error- Number:' + cast (ERROR_NUMBER() as nvarchar(max)) + ' ;Message:' + ERROR_MESSAGE();
	END CATCH;

END
GO
