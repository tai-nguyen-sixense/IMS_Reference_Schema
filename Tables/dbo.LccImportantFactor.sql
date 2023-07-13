CREATE TABLE [dbo].[LccImportantFactor]
(
[SubScenarioValue] [nvarchar] (128) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[AttributeFieldId] [uniqueidentifier] NOT NULL,
[ActivityTypeId] [uniqueidentifier] NOT NULL,
[ImportantFactor] [numeric] (18, 4) NULL,
[ComponentTypeId] [uniqueidentifier] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[LccImportantFactor] ADD CONSTRAINT [PK__LccImpor__80C43B7D8EB87120] PRIMARY KEY NONCLUSTERED ([SubScenarioValue], [AttributeFieldId], [ActivityTypeId], [ComponentTypeId]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[LccImportantFactor] ADD CONSTRAINT [FK_LccImportantFactor_ActivityType] FOREIGN KEY ([ActivityTypeId]) REFERENCES [dbo].[ActivityType] ([Id])
GO
ALTER TABLE [dbo].[LccImportantFactor] ADD CONSTRAINT [FK_LccImportantFactor_AttributeField] FOREIGN KEY ([AttributeFieldId]) REFERENCES [dbo].[AttributeField] ([Id])
GO
ALTER TABLE [dbo].[LccImportantFactor] ADD CONSTRAINT [FK_LccImportantFactor_ComponentType] FOREIGN KEY ([ComponentTypeId]) REFERENCES [dbo].[ComponentType] ([Id])
GO
