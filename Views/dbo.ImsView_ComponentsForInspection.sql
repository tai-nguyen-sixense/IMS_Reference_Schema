SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE view [dbo].[ImsView_ComponentsForInspection] as 
SELECT     dbo.Inspection.Id AS InspectionId, dbo.AssetComponent.Id AS ComponentId
FROM         dbo.Inspection INNER JOIN
dbo.InspectionMaster AS im ON dbo.Inspection.InspectionMasterId = im.Id INNER JOIN
dbo.AssetComponent ON im.AssetId = dbo.AssetComponent.AssetId
WHERE      (dbo.AssetComponent.Id NOT IN
(SELECT     AssetComponentId
FROM          dbo.InspectionMaster_ExcludedComponents imec
WHERE      (im.Id = imec.InspectionMasterId)
UNION
(SELECT     AssetComponent.Id
FROM         InspectionMaster_ExcludedComponents AS imec INNER JOIN
AssetComponent ON imec.AssetComponentId = AssetComponent.FatherId
WHERE     (im.Id = imec.InspectionMasterId))
UNION
(SELECT     AssetComponent_1.Id AS Expr1
FROM         InspectionMaster_ExcludedComponents AS imec INNER JOIN
AssetComponent ON imec.AssetComponentId = AssetComponent.FatherId INNER JOIN
AssetComponent AS AssetComponent_1 ON AssetComponent.Id = AssetComponent_1.FatherId
WHERE     (im.Id = imec.InspectionMasterId))))
GO
EXEC sp_addextendedproperty N'MS_DiagramPane1', N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[41] 4[10] 2[31] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Inspection"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 114
               Right = 211
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "im"
            Begin Extent = 
               Top = 6
               Left = 249
               Bottom = 114
               Right = 413
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "AssetComponent"
            Begin Extent = 
               Top = 6
               Left = 451
               Bottom = 114
               Right = 620
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 2100
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
', 'SCHEMA', N'dbo', 'VIEW', N'ImsView_ComponentsForInspection', NULL, NULL
GO
DECLARE @xp int
SELECT @xp=1
EXEC sp_addextendedproperty N'MS_DiagramPaneCount', @xp, 'SCHEMA', N'dbo', 'VIEW', N'ImsView_ComponentsForInspection', NULL, NULL
GO
