SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

 
CREATE VIEW [dbo].[V_Flag_TaskOrderFlag]
AS
SELECT     t1.FlagId,t1.DateLinked,  STUFF
                          ((SELECT     ' - ' + t2.Value
                              FROM         (SELECT     TaskOrder_Flag.FlagId, 
                                                                            [user].FirstName + ' ' + [User].LastName + ' Linked Repair ' + Flag.Numberbis + ' to ' + TaskOrder.Number + ' on ' + CONVERT(NVARCHAR(10), 
                                                                            DateLinked) AS Value
                                                     FROM          TaskOrder_Flag INNER JOIN
                                                                            TaskOrder ON TaskOrder_Flag.TaskOrderId = TaskOrder.Id INNER JOIN
                                                                            [User] ON [TaskOrder_Flag].UserId = [User].Id INNER JOIN
                                                                            Flag ON Flag.Id = TaskOrder_Flag.FlagId) t2
                              WHERE     t1.FlagId = t2.FlagId FOR XML PATH(''), TYPE ).value('.', 'varchar(max)'), 1, 2, '') AS TaskOrderLinkInformation
FROM         (SELECT     TaskOrder_Flag.FlagId, TaskOrder_Flag.DateLinked,
                                              [user].FirstName + ' ' + [User].LastName + ' Linked Repair ' + Flag.Numberbis + ' to ' + TaskOrder.Number + ' on ' + CONVERT(NVARCHAR(10), DateLinked) 
                                              AS Value
                       FROM          TaskOrder_Flag INNER JOIN
                                              TaskOrder ON TaskOrder_Flag.TaskOrderId = TaskOrder.Id INNER JOIN
                                              [User] ON [TaskOrder_Flag].UserId = [User].Id INNER JOIN
                                              Flag ON Flag.Id = TaskOrder_Flag.FlagId) t1
GROUP BY t1.FlagId, t1.DateLinked
GO
