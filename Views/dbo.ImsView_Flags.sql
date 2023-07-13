SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE VIEW [dbo].[ImsView_Flags]
AS
SELECT DISTINCT 
                         F.Id AS FlagId, F.AssetId, F.InspectionId, F.FlagTypeId, F.Number, F.FlagStatusId, F.Comments, F.FlagDate, F.AuthorId, F.LastModified, F.UserId, 
                         F.PreviousInspectionFlagId, F.PriorityId, F.NumberBis, F.CommentsBis, F.StatusBisId, F.AuditId, F.ExcludeFromReport, F.MainReviewerId, dbo.Asset.IsActive, 
                         CASE WHEN V_Flag_TaskOrderFlag.FlagId = F.Id THEN CAST(1 AS bit) ELSE CAST(0 AS bit) END AS IsLinkedToTaskOrder, dbo.Asset.Name AS AssetName, 
                         dbo.Asset.Number AS AssetNumber, dbo.V_FlagHierarchy.F1PriorityId, dbo.V_FlagHierarchy.F1Id, dbo.V_FlagHierarchy.F1FlagDate, dbo.V_FlagHierarchy.F2Id, 
                         dbo.V_FlagHierarchy.F2PriorityId, dbo.V_FlagHierarchy.F2FlagDate, dbo.V_FlagHierarchy.F3Id, dbo.V_FlagHierarchy.F3PriorityId, dbo.V_FlagHierarchy.F3FlagDate, 
                         dbo.V_Flag_Landmark.LandmarksLinked, dbo.V_FlagAssetComponents.Components AS ComponentsLinked, dbo.V_Flag_TaskOrderFlag.TaskOrderLinkInformation, 
                         CASE WHEN V_TaskOrderNumber.FlagId = F.Id THEN V_TaskOrderNumber.TaskOrderNumber END AS TaskOrderNumber, 
                         dbo.V_Flag_TaskOrderFlag.DateLinked
FROM            dbo.V_FlagAssetComponents RIGHT OUTER JOIN
                         dbo.V_Flag_TaskOrderFlag RIGHT OUTER JOIN
                         dbo.Flag AS F LEFT OUTER JOIN
                         dbo.V_TaskOrderNumber ON F.Id = dbo.V_TaskOrderNumber.FlagId ON dbo.V_Flag_TaskOrderFlag.FlagId = F.Id ON 
                         dbo.V_FlagAssetComponents.FlagId = F.Id LEFT OUTER JOIN
                         dbo.V_Flag_Landmark ON F.Id = dbo.V_Flag_Landmark.FlagId LEFT OUTER JOIN
                         dbo.Asset ON F.AssetId = dbo.Asset.Id LEFT OUTER JOIN
                         dbo.V_FlagHierarchy ON F.Id = dbo.V_FlagHierarchy.FId
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
         Begin Table = "V_FlagAssetComponents"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 101
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "V_Flag_TaskOrderFlag"
            Begin Extent = 
               Top = 6
               Left = 246
               Bottom = 118
               Right = 474
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "F"
            Begin Extent = 
               Top = 120
               Left = 38
               Bottom = 249
               Right = 259
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "V_TaskOrderNumber"
            Begin Extent = 
               Top = 252
               Left = 38
               Bottom = 347
               Right = 225
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "V_Flag_Landmark"
            Begin Extent = 
               Top = 252
               Left = 263
               Bottom = 347
               Right = 445
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Asset"
            Begin Extent = 
               Top = 348
               Left = 38
               Bottom = 477
               Right = 243
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "V_FlagHierarchy"
            Begin Extent = 
               Top = 120
               Left = 297
               Bottom = 249
               Right = 467
    ', 'SCHEMA', N'dbo', 'VIEW', N'ImsView_Flags', NULL, NULL
GO
EXEC sp_addextendedproperty N'MS_DiagramPane2', N'        End
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
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
', 'SCHEMA', N'dbo', 'VIEW', N'ImsView_Flags', NULL, NULL
GO
DECLARE @xp int
SELECT @xp=2
EXEC sp_addextendedproperty N'MS_DiagramPaneCount', @xp, 'SCHEMA', N'dbo', 'VIEW', N'ImsView_Flags', NULL, NULL
GO
