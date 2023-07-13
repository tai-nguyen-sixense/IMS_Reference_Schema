CREATE TABLE [dbo].[ALccScenari_Activity]
(
[ALccScenariId] [uniqueidentifier] NOT NULL,
[ActivityId] [uniqueidentifier] NOT NULL,
[Comments] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ALccScenari_Activity] ADD CONSTRAINT [PK_ALccScenari_Activity] PRIMARY KEY NONCLUSTERED ([ALccScenariId], [ActivityId]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ALccScenari_Activity] ADD CONSTRAINT [FK_ALccScenari_Activity_Activity] FOREIGN KEY ([ActivityId]) REFERENCES [dbo].[Activity] ([Id])
GO
ALTER TABLE [dbo].[ALccScenari_Activity] ADD CONSTRAINT [FK_ALccScenari_Activity_ALccScenari] FOREIGN KEY ([ALccScenariId]) REFERENCES [dbo].[ALccScenari] ([Id])
GO
