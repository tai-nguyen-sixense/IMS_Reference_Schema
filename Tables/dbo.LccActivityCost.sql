CREATE TABLE [dbo].[LccActivityCost]
(
[ActivityTypeId] [uniqueidentifier] NOT NULL,
[AttributeFieldId] [uniqueidentifier] NOT NULL,
[SubScenarioValue] [nvarchar] (128) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Frequency] [numeric] (18, 2) NOT NULL,
[Cost] [numeric] (18, 6) NULL,
[MaintenanceLevel] [numeric] (18, 2) NULL,
[Comments] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[LccActivityCost] ADD CONSTRAINT [PK_LccActivityCost_1] PRIMARY KEY NONCLUSTERED ([ActivityTypeId], [AttributeFieldId], [SubScenarioValue]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[LccActivityCost] ADD CONSTRAINT [FK_LccActivityCost_ActivityType] FOREIGN KEY ([ActivityTypeId]) REFERENCES [dbo].[ActivityType] ([Id])
GO
ALTER TABLE [dbo].[LccActivityCost] ADD CONSTRAINT [FK_LccActivityCost_AttributeField] FOREIGN KEY ([AttributeFieldId]) REFERENCES [dbo].[AttributeField] ([Id])
GO
