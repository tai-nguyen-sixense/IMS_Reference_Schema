SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
 
CREATE VIEW [dbo].[ImsView_InspectionPointDuplicate]
AS
SELECT        NEWID() AS Id, COUNT(Id) AS Count, InspectionId, InspectionSheetId, AttributeFieldId, AssetComponentId
FROM            dbo.InspectionPoint
GROUP BY InspectionId, InspectionSheetId, AttributeFieldId, AssetComponentId
HAVING        (COUNT(Id) > 1)
GO
