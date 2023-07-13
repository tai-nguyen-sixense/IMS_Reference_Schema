CREATE TABLE [dbo].[TaskOrderType_TaskType]
(
[Id] [uniqueidentifier] NOT NULL,
[TaskOrderTypeId] [uniqueidentifier] NOT NULL,
[FlagTypeId] [uniqueidentifier] NULL,
[ActivityTypeId] [uniqueidentifier] NULL,
[AuditTypeId] [uniqueidentifier] NULL,
[InspectionTypeId] [uniqueidentifier] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[TaskOrderType_TaskType] ADD CONSTRAINT [PK_TaskOrderType_TaskType] PRIMARY KEY NONCLUSTERED ([Id]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[TaskOrderType_TaskType] ADD CONSTRAINT [FK_TaskOrderType_ActivityType] FOREIGN KEY ([ActivityTypeId]) REFERENCES [dbo].[ActivityType] ([Id])
GO
ALTER TABLE [dbo].[TaskOrderType_TaskType] ADD CONSTRAINT [FK_TaskOrderType_AuditType] FOREIGN KEY ([AuditTypeId]) REFERENCES [dbo].[AuditType] ([Id])
GO
ALTER TABLE [dbo].[TaskOrderType_TaskType] ADD CONSTRAINT [FK_TaskOrderType_FlagType] FOREIGN KEY ([FlagTypeId]) REFERENCES [dbo].[FlagType] ([Id])
GO
ALTER TABLE [dbo].[TaskOrderType_TaskType] ADD CONSTRAINT [FK_TaskOrderType_InspectionType] FOREIGN KEY ([InspectionTypeId]) REFERENCES [dbo].[InspectionType] ([Id])
GO
ALTER TABLE [dbo].[TaskOrderType_TaskType] ADD CONSTRAINT [FK_TaskOrderType_TaskType] FOREIGN KEY ([TaskOrderTypeId]) REFERENCES [dbo].[TaskOrderType] ([Id])
GO
