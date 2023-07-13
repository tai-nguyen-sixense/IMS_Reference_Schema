SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


-- =============================================
-- Author:		Vincent Morisseau
-- Create date: 2017-11-15
-- Description:	Run before saving by the api
-- InPut:		@Id = Job.Id, @jobJson= default job in json format, @UserId = Loggged User Id
-- OutPut:		job in json format nvarchar(max) or error in string format
-- Error:		in case of error, the details are logged in Files\log folder
-- =============================================

CREATE PROCEDURE [dbo].[ImsProcJobSaveBefore] @Id uniqueidentifier, @jobJson nvarchar(max), @UserId uniqueidentifier
	
AS
BEGIN
Declare @returnJobJson as nvarchar(max);
    
	BEGIN TRY  
		SET @returnJobJson=@jobJson;
        -- @jobJson is something like 
		--  {"linkedUsers":[{"user":{"id":"8fd6c0a9-ea53-4bad-aa06-b9d78ec2de6c","firstName":"Vincent","lastName":"Morisseau","imageUrl":null,"name":"Vincent Morisseau"},"linked":true}],"asset":{"knwlType":{"id":"7165a2a0-c0d3-4153-a0fd-74ab98301b79","name":"Bridge","color":"#3EBCBD","icon":"bridge","attributeFields":[]},"comments":"toto","imageUrl":null,"id":"edf0ef0b-3f7a-4769-988e-bf81eaa63e8d","name":"RAMP 403S - 401E (CORE) OVER 401 EB COLL & RAMP W-DIXIE RD","number":"24 - 465/1"},"taskParent":{"id":"1c43dd24-5e37-451f-a0bc-00244dff8b24","route":"inspection","number":"63462751","knwlType":{"id":"bc47cf56-570a-4fda-8afa-ba49e2cff096","name":"Enhanced OSIM","color":"#DE4F34","icon":"inspection","attributeFields":[]}},"allow":{"actOn":true,"edit":true,"delete":true,"copy":true,"check":true,"lockedFields":[]},"knwlWeather":{"id":"c843b234-1dae-4be8-a7aa-19d66685a2b1","name":"Sunny","color":"#7EFD96","icon":"activity"},"temperature":0.0,"comments":null,"date":"2017-11-20T10:25:59.5132066+01:00","dateTo":"2017-11-20T12:25:59.5132066+01:00","imageUrl":null,"id":"78960b40-9285-48bc-af58-138011e82173","route":"job","number":null,"knwlType":{"id":"ce084ce7-9db2-45b2-bd8b-a377e5b7c5ee","name":"On-Site","color":"#521859","icon":"activity","attributeFields":null}}
		-- the procedure can be customized : using simple replace
					-- set @returnJobJson=replace(@jobJson,'"comments":null','"comments":"please add comments"');

		-- include script here
		select @returnJobJson;
	END TRY  
	
	BEGIN CATCH 
		RETURN 'Sql Error- Number:' + cast (ERROR_NUMBER() as nvarchar(max)) + ' ;Message:' + ERROR_MESSAGE();
	END CATCH;

END
GO
