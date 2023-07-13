SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

		CREATE VIEW [dbo].[ImsView_Map21CustomData] AS 
		SELECT Id as AssetComponentId, '' as CustomData 
		FROM AssetComponent;
GO
