SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE VIEW [dbo].[ImsView_RoutingEmailAttributeFieldValues]
AS
SELECT DISTINCT asse.AssetId AS AssetId, STUFF
                             ((SELECT        ',  ' + UPPER(AttributeField.Name) + ' - ' + Rtrim(AssetAttributeValue.value)
                                 FROM            dbo.Asset INNER JOIN
                                                          dbo.AssetAttributeValue ON dbo.Asset.Id = dbo.AssetAttributeValue.AssetId INNER JOIN
                                                          dbo.AttributeField ON dbo.AssetAttributeValue.AttributeFieldId = dbo.AttributeField.Id LEFT OUTER JOIN
                                                          dbo.AllowableValue ON dbo.AssetAttributeValue.AttributeFieldId = dbo.AllowableValue.AttributeFieldId AND 
                                                          dbo.AssetAttributeValue.Value = dbo.AllowableValue.Value
                                 WHERE        dbo.AssetAttributeValue.AssetId = asse.aSSETid /*and (dbo.Asset.IsActive = 'true')  */ AND 
                                                          (AttributeField.id = '72A56ED8-24D1-4B8C-B95A-D2ADD0052A5F' OR
                                                          AttributeField.id = '196EB2C7-86AC-4905-927B-3FA4D75285BC' OR
                                                          AttributeField.id = 'F3E8174A-AEA1-4E2F-8C3C-6F29048D7413') AND ValueVersionid = 'E4A8C67A-E941-4071-BA2B-0E8716D8D166' FOR 
                                                          XML PATH('')), 1, 3, '') AS Value
FROM            AssetAttributeValue asse
GO
