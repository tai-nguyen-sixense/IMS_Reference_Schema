SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE VIEW [dbo].[ImsView_HomogeneousZones]
AS
SELECT dbo.HomogeneousZone.Id AS HomogeneousZoneId, dbo.HomogeneousZoneAnalysis.AnalysisDate AS HomogeneousZoneDate, dbo.HomogeneousZone.AssetId AS HomogeneousZoneAssetId, dbo.HomogeneousZoneAttributeValue.AttributeFieldId AS HomogeneousZoneAttributeFieldId, 
             dbo.Landmark.PositionZ + dbo.HomogeneousZone.DeltaBeginX AS HomogeneousZonePositionBegin, Landmark_1.PositionZ + dbo.HomogeneousZone.DeltaEndX AS HomogeneousZonePositionEnd, dbo.HomogeneousZone.Comments AS HomogeneousZoneComments, 
             dbo.HomogeneousZoneAttributeValue.Value AS HomogeneousZoneValue, dbo.HomogeneousZoneAttributeValue.ValueNumeric AS HomogeneousZoneValueNumeric, dbo.HomogeneousZoneAttributeValue.ValueDate AS HomogeneousZoneValueDate, 
             dbo.HomogeneousZoneAttributeValue.Comments AS HomogeneousZoneValueComments
FROM   dbo.HomogeneousZone INNER JOIN
             dbo.HomogeneousZoneAnalysis ON dbo.HomogeneousZone.HomogeneousZoneAnalysisId = dbo.HomogeneousZoneAnalysis.Id INNER JOIN
             dbo.HomogeneousZoneAttributeValue ON dbo.HomogeneousZone.Id = dbo.HomogeneousZoneAttributeValue.HomogeneousZoneId INNER JOIN
             dbo.Landmark ON dbo.HomogeneousZone.LandmarkBeginId = dbo.Landmark.Id INNER JOIN
             dbo.Landmark AS Landmark_1 ON dbo.HomogeneousZone.LandmarkEndId = Landmark_1.Id
GO
EXEC sp_addextendedproperty N'MS_DiagramPane1', N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
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
         Begin Table = "HomogeneousZone"
            Begin Extent = 
               Top = 9
               Left = 57
               Bottom = 510
               Right = 472
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "HomogeneousZoneAnalysis"
            Begin Extent = 
               Top = 324
               Left = 1470
               Bottom = 521
               Right = 1692
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "HomogeneousZoneAttributeValue"
            Begin Extent = 
               Top = 312
               Left = 786
               Bottom = 509
               Right = 1065
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Landmark"
            Begin Extent = 
               Top = 26
               Left = 964
               Bottom = 223
               Right = 1186
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Landmark_1"
            Begin Extent = 
               Top = 9
               Left = 1351
               Bottom = 206
               Right = 1573
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
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
 ', 'SCHEMA', N'dbo', 'VIEW', N'ImsView_HomogeneousZones', NULL, NULL
GO
EXEC sp_addextendedproperty N'MS_DiagramPane2', N'        Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
', 'SCHEMA', N'dbo', 'VIEW', N'ImsView_HomogeneousZones', NULL, NULL
GO
DECLARE @xp int
SELECT @xp=2
EXEC sp_addextendedproperty N'MS_DiagramPaneCount', @xp, 'SCHEMA', N'dbo', 'VIEW', N'ImsView_HomogeneousZones', NULL, NULL
GO
