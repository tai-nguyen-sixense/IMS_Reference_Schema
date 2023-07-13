SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE VIEW [dbo].[ImsView_OverallCalendar]

AS

SELECT dbo.Flag.Id AS EntityId, 'Flag' AS EntityName, 'Evénement' AS EntityGroup, dbo.Flag.AssetId, dbo.Asset.Name AS AssetName, dbo.Asset.Number AS AssetNumber,

dbo.AssetType.Name AS AssetTypeName, dbo.AssetType.Color AS AssetTypeColor, dbo.Flag.FlagDate AS DateFrom, dbo.Flag.FlagDate AS DateTo,

dbo.Flag.Number AS Name, dbo.FlagType.Name AS TypeName, dbo.FlagType.Color AS TypeColor, dbo.FlagStatus.Name AS StatuName,

dbo.FlagStatus.Color AS StatuColor, dbo.FlagPriority.Name AS PriorityName, dbo.FlagPriority.Color AS PriorityColor, dbo.Flag.Comments AS Comments,

'' AS LandmarkAssetName, '' AS LandmarkAssetNumber, 0 AS LandmarkFrom, 0 AS LandmarkTo, 0 AS DayPeriod, 0 AS NumberHours,

dbo.[User].FirstName AS UserFirstName, dbo.[User].LastName AS UserLastName,TaskOrder_Flag.TaskOrderId

FROM dbo.Flag INNER JOIN

dbo.Asset ON dbo.Flag.AssetId = dbo.Asset.Id INNER JOIN

dbo.FlagType ON dbo.Flag.FlagTypeId = dbo.FlagType.Id INNER JOIN

dbo.FlagStatus ON dbo.Flag.FlagStatusId = dbo.FlagStatus.Id INNER JOIN

dbo.FlagPriority ON dbo.Flag.PriorityId = dbo.FlagPriority.Id INNER JOIN

dbo.[User] ON dbo.Flag.AuthorId = dbo.[User].Id INNER JOIN

dbo.AssetType ON dbo.Asset.AssetTypeId = dbo.AssetType.Id LEFT OUTER JOIN

dbo.TaskOrder_Flag ON dbo.Flag.Id = dbo.TaskOrder_Flag.FlagId

UNION

SELECT dbo.Activity.Id AS EntityId, 'Activity' AS EntityName, 'Travaux' AS EntityGroup, dbo.Activity.AssetId, dbo.Asset.Name AS AssetName,

dbo.Asset.Number AS AssetNumber, dbo.AssetType.Name AS AssetTypeName, dbo.AssetType.Color AS AssetTypeColor, dbo.Activity.DateFrom AS DateFrom,

dbo.Activity.DateTo AS DateTo, dbo.Activity.Number AS Name, dbo.ActivityType.Name AS TypeName, dbo.ActivityType.Color AS TypeColor,

dbo.ActivityStatus.Name AS StatuName, dbo.ActivityStatus.Color AS StatuColor, dbo.ActivityPriority.Name AS PriorityName, dbo.ActivityPriority.Color AS PriorityColor,

dbo.Activity.Comments AS Comments, '' AS LandmarkAssetName, '' AS LandmarkAssetNumber, 0 AS LandmarkFrom, 0 AS LandmarkTo, 0 AS DayPeriod,

0 AS NumberHours, dbo.[User].FirstName AS UserFirstName, dbo.[User].LastName AS UserLastName,TaskOrder_Activity.TaskOrderId

FROM dbo.Activity INNER JOIN

dbo.Asset ON dbo.Activity.AssetId = dbo.Asset.Id INNER JOIN

dbo.ActivityType ON dbo.Activity.ActivityTypeId = dbo.ActivityType.Id INNER JOIN

dbo.ActivityStatus ON dbo.Activity.ActivityStatusId = dbo.ActivityStatus.Id INNER JOIN

dbo.ActivityPriority ON dbo.Activity.ActivityPriorityId = dbo.ActivityPriority.Id INNER JOIN

dbo.[User] ON dbo.Activity.AuthorId = dbo.[User].Id INNER JOIN

dbo.AssetType ON dbo.Asset.AssetTypeId = dbo.AssetType.Id LEFT OUTER JOIN

dbo.TaskOrder_Activity ON dbo.Activity.Id = dbo.TaskOrder_Activity.ActivityId

UNION

SELECT dbo.Audit.Id AS EntityId, 'Audit' AS EntityName, 'Audit' AS EntityGroup, dbo.Audit.AssetId, dbo.Asset.Name AS AssetName, dbo.Asset.Number AS AssetNumber,

dbo.AssetType.Name AS AssetTypeName, dbo.AssetType.Color AS AssetTypeColor, dbo.Audit.AuditDate AS DateFrom, dbo.Audit.AuditDate AS DateTo,

'Audit' AS Name, dbo.AuditType.Name AS TypeName, dbo.AuditType.Color AS TypeColor, dbo.AuditStatus.Name AS StatuName, dbo.AuditStatus.Color AS StatuColor,

'' AS PriorityName, '' AS PriorityColor, dbo.Audit.Comments AS Comments, '' AS LandmarkAssetName, '' AS LandmarkAssetNumber, 0 AS LandmarkFrom,

0 AS LandmarkTo, 0 AS DayPeriod, 0 AS NumberHours, dbo.[User].FirstName AS UserFirstName, dbo.[User].LastName AS UserLastName,TaskOrder_Audit.TaskOrderId

FROM dbo.Audit INNER JOIN

dbo.Asset ON dbo.Audit.AssetId = dbo.Asset.Id INNER JOIN

dbo.AuditType ON dbo.Audit.AuditTypeId = dbo.AuditType.Id INNER JOIN

dbo.AuditStatus ON dbo.Audit.AuditStatusId = dbo.AuditStatus.Id INNER JOIN

dbo.[User] ON dbo.Audit.AuditorId = dbo.[User].Id INNER JOIN

dbo.AssetType ON dbo.Asset.AssetTypeId = dbo.AssetType.Id LEFT OUTER JOIN

dbo.TaskOrder_Audit ON dbo.Audit.Id = dbo.TaskOrder_Audit.AuditId

UNION

SELECT Inspection.Id AS EntityId, 'Inspection' AS EntityName, 'Inspection' AS EntityGroup, dbo.InspectionMaster.AssetId, Asset.Name AS AssetName,

Asset.Number AS AssetNumber, AssetType.Name AS AssetTypeName, AssetType.Color AS AssetTypeColor, dbo.Inspection.DateFrom AS DateFrom,

dbo.Inspection.DateTo AS DateTo, 'Inspection' AS Name, InspectionType.Name AS TypeName, InspectionType.Color AS TypeColor,

InspectionStatus.Name AS StatuName, InspectionStatus.Color AS StatuColor, '' AS PriorityName, '' AS PriorityColor, Inspection.Comments, '' AS LandmarkAssetName,

'' AS LandmarkAssetNumber, 0 AS LandmarkFrom, 0 AS LandmarkTo, 0 AS DayPeriod, 0 AS NumberHours, [User].FirstName AS UserFirstName,

[User].LastName AS UserLastName,TaskOrder_Inspection.TaskOrderId

FROM Inspection INNER JOIN

InspectionMaster ON Inspection.InspectionMasterId = InspectionMaster.Id INNER JOIN

Asset ON InspectionMaster.AssetId = Asset.Id INNER JOIN

AssetType ON Asset.AssetTypeId = AssetType.Id INNER JOIN

InspectionType ON InspectionMaster.InspectionTypeId = InspectionType.Id INNER JOIN

InspectionStatus ON Inspection.InspectionStatusId = InspectionStatus.Id INNER JOIN

[User] ON Inspection.TeamLeaderId = [User].Id LEFT OUTER JOIN

dbo.TaskOrder_Inspection ON dbo.Inspection.Id = dbo.TaskOrder_Inspection.InspectionId
GO
EXEC sp_addextendedproperty N'MS_DiagramPane1', N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[21] 4[4] 2[43] 3) )"
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
         Begin Table = "Flag"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 211
               Right = 259
            End
            DisplayFlags = 280
            TopColumn = 10
         End
         Begin Table = "Asset"
            Begin Extent = 
               Top = 48
               Left = 314
               Bottom = 283
               Right = 519
            End
            DisplayFlags = 280
            TopColumn = 6
         End
         Begin Table = "FlagType"
            Begin Extent = 
               Top = 6
               Left = 540
               Bottom = 135
               Right = 710
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "FlagStatus"
            Begin Extent = 
               Top = 6
               Left = 748
               Bottom = 135
               Right = 925
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "AssetType"
            Begin Extent = 
               Top = 138
               Left = 557
               Bottom = 267
               Right = 783
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
      Begin ColumnWidths = 12
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin Colu', 'SCHEMA', N'dbo', 'VIEW', N'ImsView_OverallCalendar', NULL, NULL
GO
EXEC sp_addextendedproperty N'MS_DiagramPane2', N'mnWidths = 11
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
', 'SCHEMA', N'dbo', 'VIEW', N'ImsView_OverallCalendar', NULL, NULL
GO
DECLARE @xp int
SELECT @xp=2
EXEC sp_addextendedproperty N'MS_DiagramPaneCount', @xp, 'SCHEMA', N'dbo', 'VIEW', N'ImsView_OverallCalendar', NULL, NULL
GO
