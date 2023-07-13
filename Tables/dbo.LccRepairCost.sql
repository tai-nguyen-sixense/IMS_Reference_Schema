CREATE TABLE [dbo].[LccRepairCost]
(
[ActivityTypeId] [uniqueidentifier] NOT NULL,
[AttributeFieldId] [uniqueidentifier] NOT NULL,
[SubScenarioValue] [nvarchar] (128) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[ComponentTypeId] [uniqueidentifier] NOT NULL,
[Cost] [numeric] (18, 2) NULL,
[Unit] [varchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[LccRepairCost] ADD CONSTRAINT [PK_LccRepairCost] PRIMARY KEY NONCLUSTERED ([ActivityTypeId], [AttributeFieldId], [SubScenarioValue], [ComponentTypeId]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[LccRepairCost] ADD CONSTRAINT [FK_LccCost_ActivityType] FOREIGN KEY ([ActivityTypeId]) REFERENCES [dbo].[ActivityType] ([Id])
GO
ALTER TABLE [dbo].[LccRepairCost] ADD CONSTRAINT [FK_LccCost_AttributeField] FOREIGN KEY ([AttributeFieldId]) REFERENCES [dbo].[AttributeField] ([Id])
GO
ALTER TABLE [dbo].[LccRepairCost] ADD CONSTRAINT [FK_LccRepairCost_ComponentType] FOREIGN KEY ([ComponentTypeId]) REFERENCES [dbo].[ComponentType] ([Id])
GO
