SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

 
CREATE VIEW [dbo].[V_TaskOrderNumber]
AS
SELECT        t1.FlagId, STUFF
                             ((SELECT        ' - ' + t2.Value
                                 FROM            (SELECT        TaskOrder_Flag.FlagId, TaskOrder.Number AS Value
                                                           FROM            TaskOrder_Flag INNER JOIN
                                                                                     TaskOrder ON TaskOrder_Flag.TaskOrderId = TaskOrder.Id INNER JOIN
                                                                                     [User] ON [TaskOrder_Flag].UserId = [User].Id INNER JOIN
                                                                                     Flag ON Flag.Id = TaskOrder_Flag.FlagId) t2
                                 WHERE        t1.FlagId = t2.FlagId FOR XML PATH(''), TYPE ).value('.', 'varchar(max)'), 1, 2, '') AS TaskOrderNumber
FROM            (SELECT        TaskOrder_Flag.FlagId, TaskOrder.Number AS Value
                          FROM            TaskOrder_Flag INNER JOIN
                                                    TaskOrder ON TaskOrder_Flag.TaskOrderId = TaskOrder.Id INNER JOIN
                                                    [User] ON [TaskOrder_Flag].UserId = [User].Id INNER JOIN
                                                    Flag ON Flag.Id = TaskOrder_Flag.FlagId) t1
GROUP BY t1.FlagId
GO
