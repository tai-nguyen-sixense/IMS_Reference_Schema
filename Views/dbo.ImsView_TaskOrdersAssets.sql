SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE VIEW [dbo].[ImsView_TaskOrdersAssets]
AS
SELECT        TaskOrder_Audit.TaskOrderId,Audit.AssetId 
FROM            TaskOrder_Audit INNER JOIN
                         Audit ON TaskOrder_Audit.AuditId = Audit.Id
UNION
SELECT       TaskOrder_Flag.TaskOrderId,Flag.AssetId
FROM            TaskOrder_Flag INNER JOIN
                         Flag ON TaskOrder_Flag.FlagId = Flag.Id
UNION
SELECT        TaskOrder_Activity.TaskOrderId,Activity.AssetId
FROM            TaskOrder_Activity INNER JOIN
                         Activity ON TaskOrder_Activity.ActivityId = Activity.Id
UNION
SELECT        TaskOrder_Inspection.TaskOrderId, InspectionMaster.AssetId
FROM            TaskOrder_Inspection INNER JOIN
                         Inspection ON TaskOrder_Inspection.InspectionId = Inspection.Id INNER JOIN
                         InspectionMaster ON Inspection.InspectionMasterId = InspectionMaster.Id
GO
