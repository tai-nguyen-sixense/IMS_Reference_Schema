CREATE TABLE [dbo].[ALccScenari_Budget]
(
[ALccScenariId] [uniqueidentifier] NOT NULL,
[Year] [int] NOT NULL,
[Budget] [float] NULL,
[CostActivities] [float] NULL,
[CostMaintenances] [float] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ALccScenari_Budget] ADD CONSTRAINT [PK_ALccScenari_Budget] PRIMARY KEY NONCLUSTERED ([ALccScenariId], [Year]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ALccScenari_Budget] ADD CONSTRAINT [FK_ALccScenari_Budget_ALccScenari] FOREIGN KEY ([ALccScenariId]) REFERENCES [dbo].[ALccScenari] ([Id])
GO
