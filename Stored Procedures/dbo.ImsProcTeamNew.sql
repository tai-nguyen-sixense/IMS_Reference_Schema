SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

-- =============================================
-- Author:		Vincent Morisseau
-- Create date: 2017-11-17
-- Description:	Return team in json format when user creates a new team
-- InPut:		@Id = Team.Id, @teamJson= default team in json format, @UserId = Loggged User Id
-- OutPut:		team in json format nvarchar(max) or error in string format
-- Error:		in case of error, the details are logged in Files\log folder
-- =============================================

CREATE PROCEDURE [dbo].[ImsProcTeamNew] @Id uniqueidentifier,@teamJson nvarchar(max), @UserId uniqueidentifier
	
AS
BEGIN

	Declare @returnTeamJson as nvarchar(max);
    
	BEGIN TRY  
		SET @returnTeamJson=@teamJson;
        -- @teamJson is something like 
		--  {"users":[],"allow":{"actOn":true,"edit":true,"delete":true,"copy":true,"check":true,"lockedFields":[]},"email":null,"id":"873be33e-d918-454b-8434-1a80d29cf658","name":null,"imageUrl":null,"isActive":true}
		-- the procedure can be customized :
		--    - or using simple replace
					-- set @returnTeamJson=replace(@teamJson,'"name":null','"name":"default name for team"');
		--    - or rewrite the team object
					-- set @returnTeamJson='{"users":[],"allow":{"actOn":true,"edit":true,"delete":true,"copy":true,"check":true,"lockedFields":[]},"email":null,"id":"873be33e-d918-454b-8434-1a80d29cf658","name":null,"imageUrl":null,"isActive":true}';

		-- include script here
		select @returnTeamJson;
	END TRY  
	
	BEGIN CATCH 
		RETURN 'Sql Error- Number:' + cast (ERROR_NUMBER() as nvarchar(max)) + ' ;Message:' + ERROR_MESSAGE();
	END CATCH;

END
GO
