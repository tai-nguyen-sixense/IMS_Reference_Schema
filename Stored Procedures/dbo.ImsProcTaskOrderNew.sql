SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

-- =============================================
-- Author:		Vincent Morisseau
-- Create date: 2017-11-17
-- Description:	Return taskOrder in json format when user creates a new taskOrder
-- InPut:		@Id = TaskOrder.Id, @taskOrderJson= default taskOrder in json format, @UserId = Loggged User Id
-- OutPut:		taskOrder in json format nvarchar(max) or error in string format
-- Error:		in case of error, the details are logged in Files\log folder
-- =============================================

CREATE PROCEDURE [dbo].[ImsProcTaskOrderNew] @Id uniqueidentifier,@taskOrderJson nvarchar(max), @UserId uniqueidentifier
	
AS
BEGIN

	Declare @returnTaskOrderJson as nvarchar(max);
    
	BEGIN TRY  
		SET @returnTaskOrderJson=@taskOrderJson;
        -- @taskOrderJson is something like 
		--  {"latitude":null,"longitude":null,"polyline":null,"attributeValues":null,"isActive":true,"allow":{"actOn":true,"edit":true,"delete":true,"copy":true,"lockedFields":["number"]},"taskOrders":null,"knwlType":{"id":"7165a2a0-c0d3-4153-a0fd-74ab98301b79","name":"Bridge","color":"#3EBCBD","icon":"bridge","attributeFields":[]},"comments":null,"imageUrl":null,"id":"7148B006-1722-4482-88BC-652D4100C373","name":null,"number":null}
		-- the procedure can be customized :
		--    - or using simple replace
					-- set @returnTaskOrderJson=replace(@taskOrderJson,'"name":null','"name":"default name for taskOrder"');
		--    - or rewrite the taskOrder object
					-- set @returnTaskOrderJson='{"latitude":null,"longitude":null,"polyline":null,"attributeValues":null,"isActive":true,"allow":{"actOn":true,"edit":true,"delete":true,"copy":true,"lockedFields":["number"]},"taskOrders":null,"knwlType":{"id":"7165a2a0-c0d3-4153-a0fd-74ab98301b79","name":"Bridge","color":"#3EBCBD","icon":"bridge","attributeFields":[]},"comments":null,"imageUrl":null,"id":"' +  cast(@Id as nvarchar(max)) + '","name":"full new taskOrder","number":null}';

		-- include script here
		select @returnTaskOrderJson;
	END TRY  
	
	BEGIN CATCH 
		RETURN 'Sql Error- Number:' + cast (ERROR_NUMBER() as nvarchar(max)) + ' ;Message:' + ERROR_MESSAGE();
	END CATCH;

END
GO
