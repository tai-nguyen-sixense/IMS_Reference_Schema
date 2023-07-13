SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE view [dbo].[ImsView_MonitoringFilesData] as 
SELECT        TOP (100) PERCENT NEWID() AS Id, gYear, gMonth, gWeek, gDay, AssetId, AcquisitionUnitName,AcquisitionUnitId, TimeScale,StatusId,PriorityId,TypeId, SUM(FileCount) AS FileCount
FROM            (SELECT        DATEPART(year, dbo.MonitoringFile.Date) AS gYear, CASE WHEN (TimeScale = 'Month' OR
            TimeScale = 'Week' OR
            TimeScale = 'Day' OR
            TimeScale = 'Event') THEN DATEPART(month, dbo.MonitoringFile.Date) END AS gMonth, CASE WHEN (TimeScale = 'Week' OR
            TimeScale = 'Day' OR
            TimeScale = 'Event') THEN DATEPART(week, dbo.MonitoringFile.Date) END AS gWeek, CASE WHEN (TimeScale = 'Day' OR
            TimeScale = 'Event') THEN DATEPART(day, dbo.MonitoringFile.Date) END AS gDay, dbo.MonitoringFile.AssetId, 
            dbo.AssetComponent.Name as AcquisitionUnitName, 
            dbo.AssetComponent.Id as AcquisitionUnitId, 
            dbo.MonitoringFileType.TimeScale, 
            dbo.MonitoringFileStatus.Id as StatusId, 
            dbo.MonitoringFilePriority.Id as PriorityId, 
            dbo.MonitoringFileType.Id as TypeId, 
COUNT(*) AS FileCount
    FROM            dbo.MonitoringFile INNER JOIN
       dbo.AssetComponent ON dbo.MonitoringFile.AssetComponentId = dbo.AssetComponent.Id INNER JOIN
       dbo.MonitoringFileType ON dbo.MonitoringFile.MonitoringFileTypeId = dbo.MonitoringFileType.Id INNER JOIN
       dbo.MonitoringFileStatus ON dbo.MonitoringFile.MonitoringFileStatusId = dbo.MonitoringFileStatus.Id INNER JOIN
       dbo.MonitoringFilePriority ON dbo.MonitoringFile.MonitoringFilePriorityId = dbo.MonitoringFilePriority.Id
    GROUP BY dbo.MonitoringFile.Date, 
dbo.AssetComponent.Name,
dbo.AssetComponent.Id,
dbo.MonitoringFileType.TimeScale,
dbo.MonitoringFileStatus.Id,
dbo.MonitoringFilePriority.Id,
dbo.MonitoringFileType.Id, 
dbo.MonitoringFile.AssetId) AS aaa
GROUP BY gYear, gMonth, gWeek, gDay, AssetId,AcquisitionUnitName,AcquisitionUnitId, TimeScale,StatusId,PriorityId,TypeId
ORDER BY gYear, gMonth, gWeek, gDay, AssetId
GO
