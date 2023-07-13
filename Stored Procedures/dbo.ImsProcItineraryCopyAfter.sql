SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

-- =============================================
-- Author:		Scanprint IMS Dev Team
-- Create date: 2021-11-03
-- Description:	Run after Copy by the api
-- InPut:		@Id = Itinerary.Id, @UserId = Logged User Id
-- OutPut:		1 or error in string format
-- Error:		in case of error, the details are logged in Files\log folder
-- =============================================

CREATE PROCEDURE [dbo].[ImsProcItineraryCopyAfter] @ItineraryId uniqueidentifier, @NewItineraryId uniqueidentifier, @UserId uniqueidentifier
	
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
