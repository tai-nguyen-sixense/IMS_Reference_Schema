CREATE TABLE [dbo].[Scenario_Activity]
(
[ScenarioId] [uniqueidentifier] NOT NULL,
[ActivityId] [uniqueidentifier] NOT NULL,
[DateLinked] [datetime] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Scenario_Activity] ADD CONSTRAINT [PK_ScenarioActivity] PRIMARY KEY NONCLUSTERED ([ScenarioId], [ActivityId]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Scenario_Activity] ADD CONSTRAINT [FK_Scenario_Activity_Activity] FOREIGN KEY ([ActivityId]) REFERENCES [dbo].[Activity] ([Id])
GO
ALTER TABLE [dbo].[Scenario_Activity] ADD CONSTRAINT [FK_Scenario_Activity_Scenario] FOREIGN KEY ([ScenarioId]) REFERENCES [dbo].[Scenario] ([Id])
GO
