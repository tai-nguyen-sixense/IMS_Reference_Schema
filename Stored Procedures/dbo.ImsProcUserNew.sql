SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

-- =============================================
-- Author:		Vincent Morisseau
-- Create date: 2017-11-17
-- Description:	Return user in json format when user creates a new user
-- InPut:		@Id = User.Id, @userJson= default user in json format, @UserId = Loggged User Id
-- OutPut:		user in json format nvarchar(max) or error in string format
-- Error:		in case of error, the details are logged in Files\log folder
-- =============================================

CREATE PROCEDURE [dbo].[ImsProcUserNew] @Id uniqueidentifier,@userJson nvarchar(max), @UserId uniqueidentifier
	
AS
BEGIN

	Declare @returnUserJson as nvarchar(max);
    
	BEGIN TRY  
		SET @returnUserJson=@userJson;
        -- @userJson is something like 
		--  {"allow":{"actOn":true,"edit":true,"delete":true,"copy":true,"check":true,"lockedFields":[]},"userGroups":null,"phone":null,"status":"Valid","username":null,"password":null,"initial":null,"active":false,"badge":null,"expires":"2018-11-20T10:28:44.4797386+01:00","contact":null,"teamRoles":null,"email":null,"organization":null,"id":"f9fb7146-3cb6-4484-b32f-ccb6fee886d7","firstName":null,"lastName":null,"imageUrl":null,"name":null}
		-- the procedure can be customized :
		--    - or using simple replace
					-- set @returnUserJson=replace(@userJson,'"name":null','"name":"default name for user"');
		--    - or rewrite the user object
					-- set @returnUserJson='{"allow":{"actOn":true,"edit":true,"delete":true,"copy":true,"check":true,"lockedFields":[]},"userGroups":null,"phone":null,"status":"Valid","username":null,"password":null,"initial":null,"active":false,"badge":null,"expires":"2018-11-20T10:28:44.4797386+01:00","contact":null,"teamRoles":null,"email":null,"organization":null,"id":"f9fb7146-3cb6-4484-b32f-ccb6fee886d7","firstName":null,"lastName":null,"imageUrl":null,"name":null}';

		-- include script here
		select @returnUserJson;
	END TRY  
	
	BEGIN CATCH 
		RETURN 'Sql Error- Number:' + cast (ERROR_NUMBER() as nvarchar(max)) + ' ;Message:' + ERROR_MESSAGE();
	END CATCH;

END
GO
