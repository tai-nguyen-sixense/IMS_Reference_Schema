SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


-- =============================================
-- Author:		Vincent Morisseau
-- Create date: 2017-11-17
-- Description:	Return allow in json format when user get an photo
-- InPut:		@Id = Photo.Id, @allowJson= default allow in json format, @UserId = Loggged User Id
-- OutPut:		allow in json format nvarchar(max) or error in string format
-- Error:		in case of error, the details are logged in Files\log folder
-- =============================================

CREATE PROCEDURE [dbo].[ImsProcPhotoAllow] @Id uniqueidentifier,@allowJson nvarchar(max), @UserId uniqueidentifier
	
AS
BEGIN

	Declare @returnAlowJson as nvarchar(max);
    
	BEGIN TRY  
		SET @returnAlowJson=@allowJson;

        -- @allowJson is something like :
		--{"actOn":true,"edit":true,"delete":true,"copy":true,"check":true,"lockedFields":["number","imageUrl"]}
		--{"actOn":true,"edit":true,"delete":true,"copy":true,"check":true,"lockedFields":[]}
		--for example using @UserId, the actOn can be replaced:
		--		SET @returnAlowJson=REPLACE(@returnAlowJson,'"actOn":true','"actOn":false');

		-- include script here
		select @returnAlowJson;
	END TRY  
	
	BEGIN CATCH 
		RETURN 'Sql Error- Number:' + cast (ERROR_NUMBER() as nvarchar(max)) + ' ;Message:' + ERROR_MESSAGE();
	END CATCH;

END
GO
