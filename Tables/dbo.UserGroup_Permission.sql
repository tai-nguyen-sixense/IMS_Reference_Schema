CREATE TABLE [dbo].[UserGroup_Permission]
(
[UserGroupId] [uniqueidentifier] NOT NULL,
[DateLinked] [datetime] NULL,
[PermissionId] [uniqueidentifier] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[UserGroup_Permission] ADD CONSTRAINT [PK_UserGroup_Permission] PRIMARY KEY NONCLUSTERED ([UserGroupId], [PermissionId]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[UserGroup_Permission] ADD CONSTRAINT [FK_UserGroup_Permission_Permission] FOREIGN KEY ([PermissionId]) REFERENCES [dbo].[Permission] ([Id])
GO
ALTER TABLE [dbo].[UserGroup_Permission] ADD CONSTRAINT [FK_UserGroup_Permission_UserGroup] FOREIGN KEY ([UserGroupId]) REFERENCES [dbo].[UserGroup] ([Id])
GO
