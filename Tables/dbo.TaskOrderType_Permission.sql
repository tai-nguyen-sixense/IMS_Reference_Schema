CREATE TABLE [dbo].[TaskOrderType_Permission]
(
[Id] [uniqueidentifier] NOT NULL,
[UserGroupId] [uniqueidentifier] NOT NULL,
[TaskOrderTypeId] [uniqueidentifier] NULL,
[View] [bit] NULL,
[Check] [bit] NULL,
[Create] [bit] NULL,
[Copy] [bit] NULL,
[Edit] [bit] NULL,
[Delete] [bit] NULL,
[DateLinked] [datetime] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[TaskOrderType_Permission] ADD CONSTRAINT [PK_TaskOrderType_Permission] PRIMARY KEY NONCLUSTERED ([Id]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[TaskOrderType_Permission] ADD CONSTRAINT [FK_TaskOrderType_Permission_TaskOrderType] FOREIGN KEY ([TaskOrderTypeId]) REFERENCES [dbo].[TaskOrderType] ([Id])
GO
ALTER TABLE [dbo].[TaskOrderType_Permission] ADD CONSTRAINT [FK_TaskOrderType_Permission_UserGroup] FOREIGN KEY ([UserGroupId]) REFERENCES [dbo].[UserGroup] ([Id])
GO
