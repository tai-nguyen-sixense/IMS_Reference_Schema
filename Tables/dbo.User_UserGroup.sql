CREATE TABLE [dbo].[User_UserGroup]
(
[UserGroupId] [uniqueidentifier] NOT NULL,
[UserId] [uniqueidentifier] NOT NULL,
[AffectedDate] [datetime] NOT NULL,
[ExpirationDate] [datetime] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[User_UserGroup] ADD CONSTRAINT [PK_User_UserGroup] PRIMARY KEY NONCLUSTERED ([UserGroupId], [UserId]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[User_UserGroup] ADD CONSTRAINT [FK_User_UserGroup_User] FOREIGN KEY ([UserId]) REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[User_UserGroup] ADD CONSTRAINT [FK_User_UserGroup_UserGroup] FOREIGN KEY ([UserGroupId]) REFERENCES [dbo].[UserGroup] ([Id])
GO
