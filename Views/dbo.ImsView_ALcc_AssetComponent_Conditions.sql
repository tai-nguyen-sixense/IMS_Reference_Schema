SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO










CREATE VIEW [dbo].[ImsView_ALcc_AssetComponent_Conditions]
AS
SELECT dbo.Asset.Id AS AssetId, dbo.Asset.Name AS AssetName, dbo.Asset.Number AS AssetNumber, dbo.AssetType.Id AS AssetTypeId, dbo.AssetType.Name AS AssetTypeName, dbo.AssetComponent.Id AS AssetComponentId, dbo.AssetComponent.Name AS AssetComponentName, 
             dbo.ComponentType.Id AS ComponentTypeId, dbo.ComponentType.Name AS ComponentTypeName, dbo.Inspection.Id AS InspectionId, dbo.Inspection.DateFrom AS InspectionDate, (CASE WHEN dbo.V_ALcc_AssetComponent_Conditions_RawData.Excellent IS NULL 
             THEN 0 ELSE CAST(dbo.V_ALcc_AssetComponent_Conditions_RawData.Excellent AS float) END) AS Condition1, (CASE WHEN dbo.V_ALcc_AssetComponent_Conditions_RawData.Good IS NULL 
             THEN 0 ELSE CAST(dbo.V_ALcc_AssetComponent_Conditions_RawData.Good AS float) END) AS Condition2, (CASE WHEN dbo.V_ALcc_AssetComponent_Conditions_RawData.Fair IS NULL 
             THEN 0 ELSE CAST(dbo.V_ALcc_AssetComponent_Conditions_RawData.Fair AS float) END) AS Condition3, (CASE WHEN dbo.V_ALcc_AssetComponent_Conditions_RawData.Poor IS NULL 
             THEN 0 ELSE CAST(dbo.V_ALcc_AssetComponent_Conditions_RawData.Poor AS float) END) AS Condition4, CAST(Quantity.Value AS float) AS TotalQuantity, Unit.Value AS Unit,CAST(Age.Value as INT) as YearBuilt
FROM   dbo.V_ALcc_AssetComponent_Conditions_RawData INNER JOIN
             dbo.Inspection ON dbo.V_ALcc_AssetComponent_Conditions_RawData.InspectionId = dbo.Inspection.Id INNER JOIN
             dbo.AssetComponent ON dbo.V_ALcc_AssetComponent_Conditions_RawData.AssetComponentId = dbo.AssetComponent.Id INNER JOIN
             dbo.ComponentType ON dbo.AssetComponent.ComponentTypeId = dbo.ComponentType.Id INNER JOIN
             dbo.Asset ON dbo.AssetComponent.AssetId = dbo.Asset.Id INNER JOIN
             dbo.AssetType ON dbo.Asset.AssetTypeId = dbo.AssetType.Id LEFT OUTER JOIN
             dbo.ComponentAttributeValue AS Quantity ON dbo.AssetComponent.Id = Quantity.AssetComponentId AND Quantity.AttributeFieldId = '04FA61A8-06AB-4C3B-8F1F-491C8D28EE79' LEFT OUTER JOIN
             dbo.ComponentAttributeValue AS Unit ON dbo.AssetComponent.Id = Unit.AssetComponentId AND Unit.AttributeFieldId = 'C4C6D9FB-681C-4751-A0AC-B3FFE9A6E8B9' INNER JOIN
             dbo.AssetAttributeValue AS Age ON dbo.Asset.Id = Age.AssetId AND Age.AttributeFieldId = 'BB8A14FC-8B6C-4F27-8E3E-B033A17F9649'

			 WHERE YEAR(Inspection.DateFrom) - CAST(Age.Value as INT) >=0
GO
