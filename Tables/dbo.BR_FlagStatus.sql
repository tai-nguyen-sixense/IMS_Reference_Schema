CREATE TABLE [dbo].[BR_FlagStatus]
(
[Id] [uniqueidentifier] NOT NULL,
[RoleFromId] [uniqueidentifier] NOT NULL,
[FlagStatusFromId] [uniqueidentifier] NOT NULL,
[FlagStatusToId] [uniqueidentifier] NOT NULL,
[RoleToId] [uniqueidentifier] NOT NULL,
[SameTeamOnly] [bit] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[BR_FlagStatus] ADD CONSTRAINT [PK_BR_FlagStatus] PRIMARY KEY NONCLUSTERED ([Id]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[BR_FlagStatus] ADD CONSTRAINT [FK_BR_FlagStatus_FlagStatus] FOREIGN KEY ([FlagStatusFromId]) REFERENCES [dbo].[FlagStatus] ([Id])
GO
ALTER TABLE [dbo].[BR_FlagStatus] ADD CONSTRAINT [FK_BR_FlagStatus_FlagStatus1] FOREIGN KEY ([FlagStatusToId]) REFERENCES [dbo].[FlagStatus] ([Id])
GO
ALTER TABLE [dbo].[BR_FlagStatus] ADD CONSTRAINT [FK_BR_FlagStatus_Role] FOREIGN KEY ([RoleFromId]) REFERENCES [dbo].[Role] ([Id])
GO
ALTER TABLE [dbo].[BR_FlagStatus] ADD CONSTRAINT [FK_BR_FlagStatus_Role1] FOREIGN KEY ([RoleToId]) REFERENCES [dbo].[Role] ([Id])
GO
