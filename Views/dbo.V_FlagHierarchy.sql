SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


create view [dbo].[V_FlagHierarchy] as
SELECT        dbo.Flag.Id AS FId, dbo.Flag.PriorityId AS FPriorityId, dbo.Flag.FlagDate AS FFlagDate, Flag_1.Id AS F1Id, Flag_1.PriorityId AS F1PriorityId, 
                         Flag_1.FlagDate AS F1FlagDate, Flag_2.Id AS F2Id, Flag_2.PriorityId AS F2PriorityId, Flag_2.FlagDate AS F2FlagDate, Flag_3.Id AS F3Id, 
                         Flag_3.PriorityId AS F3PriorityId, Flag_3.FlagDate AS F3FlagDate
FROM            dbo.Flag AS Flag_1 RIGHT OUTER JOIN
                         dbo.Flag ON Flag_1.Id = dbo.Flag.PreviousInspectionFlagId LEFT OUTER JOIN
                         dbo.Flag AS Flag_2 LEFT OUTER JOIN
                         dbo.Flag AS Flag_3 ON Flag_2.PreviousInspectionFlagId = Flag_3.Id ON Flag_1.PreviousInspectionFlagId = Flag_2.Id
GO
