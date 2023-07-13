SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


-- =============================================
-- Author:		Scanprint IMS Dev Team
-- Create date: 2020-05-04
-- Description:	Return contract in json format when user creates a new contract
-- InPut:		@Id = Contract.Id, @contractJson= default contract in json format, @UserId = Loggged User Id
-- OutPut:		contract in json format nvarchar(max) or error in string format
-- Error:		in case of error, the details are logged in Files\log folder
-- =============================================

CREATE PROCEDURE [dbo].[ImsProcContractNew] @Id uniqueidentifier,@contractJson nvarchar(max), @UserId uniqueidentifier
	
AS
BEGIN

	Declare @returnContractJson as nvarchar(max);
    
	BEGIN TRY  
		SET @returnContractJson=@contractJson;
        -- @contractJson is something like 
		--  {"assets":null,"allow":{"actOn":true,"edit":true,"delete":true,"copy":true,"check":true,"lockedFields":[]},"address":null,"email":null,"website":null,"phone":null,"fax":null,"contract":null,"id":"d25e00e5-c5f8-4237-a940-aaff40e5b111","fathersName":null,"name":null,"comments":null}
		-- the procedure can be customized :
		--    - or using simple replace
					-- set @returnContractJson=replace(@contractJson,'"name":null','"name":"default name for contract"');
		--    - or rewrite the contract object
					-- set @returnContractJson='{"assets":null,"allow":{"actOn":true,"edit":true,"delete":true,"copy":true,"check":true,"lockedFields":[]},"address":null,"email":null,"website":null,"phone":null,"fax":null,"contract":null,"id":"d25e00e5-c5f8-4237-a940-aaff40e5b111","fathersName":null,"name":null,"comments":null}';

		-- include script here
		select @returnContractJson;
	END TRY  
	
	BEGIN CATCH 
		RETURN 'Sql Error- Number:' + cast (ERROR_NUMBER() as nvarchar(max)) + ' ;Message:' + ERROR_MESSAGE();
	END CATCH;

END
GO
