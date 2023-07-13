CREATE TABLE [dbo].[WorkDetails]
(
[Id] [uniqueidentifier] NOT NULL,
[StartDate] [datetime] NULL,
[EndDate] [datetime] NULL,
[AssignmentDate] [datetime] NULL,
[ActualCost] [money] NULL,
[CostDifference] [money] NULL,
[ActualDuration] [int] NULL,
[PercentageComplete] [int] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[WorkDetails] ADD CONSTRAINT [PK_WorkDetails] PRIMARY KEY NONCLUSTERED ([Id]) ON [PRIMARY]
GO
