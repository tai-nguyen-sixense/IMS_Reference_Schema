CREATE TABLE [dbo].[User_Role_Team]
(
[UserId] [uniqueidentifier] NOT NULL,
[RoleId] [uniqueidentifier] NOT NULL,
[TeamId] [uniqueidentifier] NOT NULL,
[AffectedDate] [smalldatetime] NOT NULL,
[ExpirationDate] [smalldatetime] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[User_Role_Team] ADD CONSTRAINT [PK_User_Role_Team] PRIMARY KEY NONCLUSTERED ([UserId], [RoleId], [TeamId]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[User_Role_Team] ADD CONSTRAINT [FK_User_Role_Team_Role] FOREIGN KEY ([RoleId]) REFERENCES [dbo].[Role] ([Id])
GO
ALTER TABLE [dbo].[User_Role_Team] ADD CONSTRAINT [FK_User_Role_Team_Team] FOREIGN KEY ([TeamId]) REFERENCES [dbo].[Team] ([Id])
GO
ALTER TABLE [dbo].[User_Role_Team] ADD CONSTRAINT [FK_User_Role_Team_User] FOREIGN KEY ([UserId]) REFERENCES [dbo].[User] ([Id])
GO
