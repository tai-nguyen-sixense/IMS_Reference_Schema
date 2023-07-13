SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


CREATE VIEW [dbo].[V_REPORT_GENERAL_Component_hierarchy]
AS
SELECT     dbo.AssetComponent.Id, dbo.AssetComponent.Name, dbo.AssetComponent.Number, dbo.AssetComponent.Position, AssetComponent_1.Name AS N1Name, 
                      AssetComponent_1.Number AS N1Number, AssetComponent_1.Position AS N1Position, AssetComponent_2.Name AS N2Name, 
                      AssetComponent_2.Number AS N2Number, AssetComponent_2.Position AS N2Position, AssetComponent_3.Name AS N3Name, 
                      AssetComponent_3.Number AS N3Number, AssetComponent_3.Position AS N3Position, AssetComponent_4.Name AS N4Name, 
                      AssetComponent_4.Number AS N4Number, AssetComponent_4.Position AS Expr1, AssetComponent_5.Name AS N5Name, AssetComponent_5.Number AS N5Number, 
                      AssetComponent_5.Position AS N5Position, CASE WHEN AssetComponent_3.Name IS NULL THEN ISNULL(AssetComponent_1.Number + '.', '') 
                      + ISNULL(dbo.AssetComponent.Number + ' - ', '') + dbo.AssetComponent.Name ELSE ISNULL(AssetComponent_2.Number + '.', '') 
                      + ISNULL(AssetComponent_1.Number + ' - ', '') + AssetComponent_1.Name END AS MainElement, CASE WHEN AssetComponent_3.Name IS NULL 
                      THEN AssetComponent_1.Name ELSE AssetComponent_2.Name END AS SubElement, CASE WHEN AssetComponent_3.Name IS NULL 
                      THEN AssetComponent_2.Name ELSE AssetComponent_3.Name END AS MasterElement, CASE WHEN AssetComponent_3.Position IS NULL 
                      THEN AssetComponent_2.Position ELSE AssetComponent_3.Position END AS MasterPosition, ISNULL(AssetComponent_4.Name + '/', '') 
                      + ISNULL(AssetComponent_3.Name + '/', '') + ISNULL(AssetComponent_2.Name + '/', '') + ISNULL(AssetComponent_1.Name + '/', '') 
                      + ISNULL(dbo.AssetComponent.Name, '') AS ComponentTreeView
FROM         dbo.AssetComponent AS AssetComponent_4 RIGHT OUTER JOIN
                      dbo.AssetComponent AS AssetComponent_3 ON AssetComponent_4.Id = AssetComponent_3.FatherId RIGHT OUTER JOIN
                      dbo.AssetComponent AS AssetComponent_2 ON AssetComponent_3.Id = AssetComponent_2.FatherId RIGHT OUTER JOIN
                      dbo.AssetComponent AS AssetComponent_1 ON AssetComponent_2.Id = AssetComponent_1.FatherId RIGHT OUTER JOIN
                      dbo.AssetComponent ON AssetComponent_1.Id = dbo.AssetComponent.FatherId LEFT OUTER JOIN
                      dbo.AssetComponent AS AssetComponent_5 ON AssetComponent_4.FatherId = AssetComponent_5.Id
GO
