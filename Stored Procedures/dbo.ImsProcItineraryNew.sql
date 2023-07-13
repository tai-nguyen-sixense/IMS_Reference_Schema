SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

-- =============================================
-- Author:		Scanprint IMS Dev Team
-- Create date: 2021-11-02
-- Description:	Return itinerary in json format when user creates a new itinerary
-- InPut:		@Id = Itinerary.Id, @itineraryJson= default itinerary in json format, @UserId = Loggged User Id
-- OutPut:		itinerary in json format nvarchar(max) or error in string format
-- Error:		in case of error, the details are logged in Files\log folder
-- =============================================

CREATE PROCEDURE [dbo].[ImsProcItineraryNew] @Id uniqueidentifier,@itineraryJson nvarchar(max), @UserId uniqueidentifier
	
AS
BEGIN

	Declare @returnItineraryJson as nvarchar(max);
    
	BEGIN TRY  
		SET @returnItineraryJson=@itineraryJson;
        -- @itineraryJson is something like 
		--  {"knwlStatu": {...},  "comments": null, "requestDate": null, "travelDate": null, "height": 0, "width": 0, "load": 0, "itinerariesList": "[{origin: {adress:Xxxx, location:{lat:000, lng:000}}, waypoints:[], waypointsForAgm:[], destination: {adress:Xxxx, location:{lat:000, lng:000}}, routeInfo:{distance:000, duration:000}, isReturn:false, overview_path: [] ]", "hasReturn": false, "id": "bcce17d6-dcbf-4df9-9321-0314d1ddb639", "name": "Itinerary", "number": null }
		-- the procedure can be customized :
		--    - or using simple replace
					-- set @returnItineraryJson=replace(@itineraryJson,'"name":null','"name":"default name for itinerary"');
		--    - or rewrite the itinerary object
					-- set @returnItineraryJson='{"knwlStatu": {...},  "comments": null, "requestDate": null, "travelDate": null, "height": 0, "width": 0, "load": 0, "itinerariesList": "[{origin: {adress:Xxxx, location:{lat:000, lng:000}}, waypoints:[], waypointsForAgm:[], destination: {adress:Xxxx, location:{lat:000, lng:000}}, routeInfo:{distance:000, duration:000}, isReturn:false, overview_path: [] ]", "hasReturn": false, "id": "bcce17d6-dcbf-4df9-9321-0314d1ddb639", "name": "Itinerary", "number": null }';

		-- include script here
		select @returnItineraryJson;
	END TRY  
	
	BEGIN CATCH 
		RETURN 'Sql Error- Number:' + cast (ERROR_NUMBER() as nvarchar(max)) + ' ;Message:' + ERROR_MESSAGE();
	END CATCH;

END
GO
