CREATE TABLE [dbo].[ALccScenari]
(
[Id] [uniqueidentifier] NOT NULL,
[ALccScenariTypeId] [uniqueidentifier] NOT NULL,
[Name] [nvarchar] (4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Comments] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[BeginYear] [int] NULL,
[EndYear] [int] NULL,
[Budget] [float] NULL,
[PercentEscalation] [float] NULL,
[IsAModel] [bit] NOT NULL,
[TotalCostActivities] [float] NULL,
[TotalCostMaintenances] [float] NULL,
[BCI] [float] NULL,
[ConstraintType] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ALccScenari] ADD CONSTRAINT [PK_ALccScenari] PRIMARY KEY NONCLUSTERED ([Id]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ALccScenari] ADD CONSTRAINT [FK_ALccScenari_ALccScenariType] FOREIGN KEY ([ALccScenariTypeId]) REFERENCES [dbo].[ALccScenariType] ([Id])
GO
EXEC sp_addextendedproperty N'MS_Description', N'The start year of the scenario', 'SCHEMA', N'dbo', 'TABLE', N'ALccScenari', 'COLUMN', N'BeginYear'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Maximum budget allowed by the client for this scenario', 'SCHEMA', N'dbo', 'TABLE', N'ALccScenari', 'COLUMN', N'Budget'
GO
EXEC sp_addextendedproperty N'MS_Description', N'General comments for the scenario', 'SCHEMA', N'dbo', 'TABLE', N'ALccScenari', 'COLUMN', N'Comments'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The end year of the scenario', 'SCHEMA', N'dbo', 'TABLE', N'ALccScenari', 'COLUMN', N'EndYear'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Name of the scenario', 'SCHEMA', N'dbo', 'TABLE', N'ALccScenari', 'COLUMN', N'Name'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The total cost of the repair activities created for this scenario once it has run', 'SCHEMA', N'dbo', 'TABLE', N'ALccScenari', 'COLUMN', N'TotalCostActivities'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The total cost of the maintenance activities created for this scenario once it has run', 'SCHEMA', N'dbo', 'TABLE', N'ALccScenari', 'COLUMN', N'TotalCostMaintenances'
GO
