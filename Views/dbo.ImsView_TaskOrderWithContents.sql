SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE VIEW [dbo].[ImsView_TaskOrderWithContents]
AS
SELECT        dbo.TaskOrder.Id, dbo.TaskOrder.Number, dbo.TaskOrder.AssignmentDate, dbo.TaskOrder.AssignedToId, dbo.TaskOrder.Duration, dbo.TaskOrder.Comments, 
                         dbo.TaskOrder.DueDate, dbo.TaskOrder.ContractId, dbo.TaskOrder.TaskOrderPriorityId, dbo.TaskOrder.TaskOrderStatusId, dbo.TaskOrder.LastModified, 
                         dbo.TaskOrder.EstimatedCost, dbo.TaskOrder.ActualCost, dbo.TaskOrder.UserId, dbo.TaskOrder.PercentageComplete, dbo.TaskOrder.ProjectManagerId, 
                         dbo.TaskOrder.RequestId, FlagsCount.Flags, ActivitiesCount.Activities, AuditsCount.Audits, InspectionsCount.Inspections
FROM            dbo.TaskOrder LEFT OUTER JOIN
                             (SELECT        TaskOrderId, COUNT(*) AS Audits
                               FROM            dbo.TaskOrder_Audit
                               GROUP BY TaskOrderId) AS AuditsCount ON dbo.TaskOrder.Id = AuditsCount.TaskOrderId LEFT OUTER JOIN
                             (SELECT        TaskOrderId, COUNT(*) AS Activities
                               FROM            dbo.TaskOrder_Activity
                               GROUP BY TaskOrderId) AS ActivitiesCount ON dbo.TaskOrder.Id = ActivitiesCount.TaskOrderId LEFT OUTER JOIN
                             (SELECT        TaskOrderId, COUNT(*) AS Flags
                               FROM            dbo.TaskOrder_Flag
                               GROUP BY TaskOrderId) AS FlagsCount ON dbo.TaskOrder.Id = FlagsCount.TaskOrderId LEFT OUTER JOIN
                             (SELECT        TaskOrderId, COUNT(*) AS Inspections
                               FROM            dbo.TaskOrder_Inspection
                               GROUP BY TaskOrderId) AS InspectionsCount ON dbo.TaskOrder.Id = InspectionsCount.TaskOrderId
GO
