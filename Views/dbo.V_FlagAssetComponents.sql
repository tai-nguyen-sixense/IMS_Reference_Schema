SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

 
CREATE VIEW [dbo].[V_FlagAssetComponents]
AS
SELECT        t1.FlagId, STUFF
                             ((SELECT        ' - ' + t2.Value
                                 FROM            (SELECT       Flag_AssetComponent_InspectionPoint.FlagId, AssetComponent.Name AS Value
                                                           FROM            Flag_AssetComponent_InspectionPoint INNER JOIN
                                                                                     AssetComponent ON Flag_AssetComponent_InspectionPoint.AssetComponentId = AssetComponent.Id) t2
                                 WHERE        t1.FlagId = t2.FlagId
                                 FOR XML PATH(''), TYPE ).value('.', 'varchar(max)'), 1, 2, '') AS Components
FROM            (SELECT        Flag_AssetComponent_InspectionPoint.FlagId, AssetComponent.Name  AS Value
                          FROM            Flag_AssetComponent_InspectionPoint INNER JOIN
                                                    AssetComponent ON Flag_AssetComponent_InspectionPoint.AssetComponentId = AssetComponent.Id) t1
GROUP BY t1.FlagId
GO
