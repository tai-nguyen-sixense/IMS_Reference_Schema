CREATE TABLE [dbo].[TaskType_Permission]
(
[Id] [uniqueidentifier] NOT NULL,
[UserGroupId] [uniqueidentifier] NOT NULL,
[FlagTypeId] [uniqueidentifier] NULL,
[ActivityTypeId] [uniqueidentifier] NULL,
[AuditTypeId] [uniqueidentifier] NULL,
[InspectionTypeId] [uniqueidentifier] NULL,
[DefectTypeId] [uniqueidentifier] NULL,
[View] [bit] NULL,
[Check] [bit] NULL,
[Create] [bit] NULL,
[Copy] [bit] NULL,
[Edit] [bit] NULL,
[Delete] [bit] NULL,
[DateLinked] [datetime] NOT NULL,
[Iterate] [bit] NULL,
[SendEmail] [bit] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[TaskType_Permission] ADD CONSTRAINT [PK_TaskType_Permission] PRIMARY KEY NONCLUSTERED ([Id]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[TaskType_Permission] ADD CONSTRAINT [FK_TaskType_Permission_ActivityType] FOREIGN KEY ([ActivityTypeId]) REFERENCES [dbo].[ActivityType] ([Id])
GO
ALTER TABLE [dbo].[TaskType_Permission] ADD CONSTRAINT [FK_TaskType_Permission_AuditType] FOREIGN KEY ([AuditTypeId]) REFERENCES [dbo].[AuditType] ([Id])
GO
ALTER TABLE [dbo].[TaskType_Permission] ADD CONSTRAINT [FK_TaskType_Permission_DefectType] FOREIGN KEY ([DefectTypeId]) REFERENCES [dbo].[DefectType] ([Id])
GO
ALTER TABLE [dbo].[TaskType_Permission] ADD CONSTRAINT [FK_TaskType_Permission_FlagType] FOREIGN KEY ([FlagTypeId]) REFERENCES [dbo].[FlagType] ([Id])
GO
ALTER TABLE [dbo].[TaskType_Permission] ADD CONSTRAINT [FK_TaskType_Permission_InspectionType] FOREIGN KEY ([InspectionTypeId]) REFERENCES [dbo].[InspectionType] ([Id])
GO
ALTER TABLE [dbo].[TaskType_Permission] ADD CONSTRAINT [FK_TaskType_Permission_UserGroup] FOREIGN KEY ([UserGroupId]) REFERENCES [dbo].[UserGroup] ([Id])
GO
