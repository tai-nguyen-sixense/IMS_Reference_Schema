SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

-- =============================================
-- Author:		ScanPrint IMS
-- Create date: 2020-04-24
-- Description:	Run before unlinking flag and taskOrder
-- InPut:		@TaskOrderId = TaskOrder_Flag.TaskOrderId, @FlagId = TaskOrder_Flag.FlagId, @UserId = Logged User Id
-- OutPut:		1 or error in string format
-- Error:		in case of error, the details are logged in Files\log folder
-- =============================================

CREATE PROCEDURE [dbo].[ImsProcTaskOrderFlagUnlinkBefore] @TaskOrderId uniqueidentifier, @FlagId uniqueidentifier, @UserId uniqueidentifier
	
AS
BEGIN
	BEGIN TRY 
		-- include script here
		select 1;
	END TRY  
	
	BEGIN CATCH 
		RETURN 'Sql Error- Number:' + cast (ERROR_NUMBER() as nvarchar(max)) + ' ;Message:' + ERROR_MESSAGE();
	END CATCH;

END
GO
