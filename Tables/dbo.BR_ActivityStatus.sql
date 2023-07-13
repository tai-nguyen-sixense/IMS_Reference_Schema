CREATE TABLE [dbo].[BR_ActivityStatus]
(
[Id] [uniqueidentifier] NOT NULL,
[RoleFromId] [uniqueidentifier] NOT NULL,
[ActivityStatusFromId] [uniqueidentifier] NOT NULL,
[ActivityStatusToId] [uniqueidentifier] NOT NULL,
[RoleToId] [uniqueidentifier] NOT NULL,
[SameTeamOnly] [bit] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[BR_ActivityStatus] ADD CONSTRAINT [PK_BR_ActivityStatus] PRIMARY KEY CLUSTERED ([Id]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[BR_ActivityStatus] ADD CONSTRAINT [FK_BR_ActivityStatus_ActivityStatus] FOREIGN KEY ([ActivityStatusFromId]) REFERENCES [dbo].[ActivityStatus] ([Id])
GO
ALTER TABLE [dbo].[BR_ActivityStatus] ADD CONSTRAINT [FK_BR_ActivityStatus_ActivityStatus1] FOREIGN KEY ([ActivityStatusToId]) REFERENCES [dbo].[ActivityStatus] ([Id])
GO
ALTER TABLE [dbo].[BR_ActivityStatus] ADD CONSTRAINT [FK_BR_ActivityStatus_Role] FOREIGN KEY ([RoleFromId]) REFERENCES [dbo].[Role] ([Id])
GO
ALTER TABLE [dbo].[BR_ActivityStatus] ADD CONSTRAINT [FK_BR_ActivityStatus_Role1] FOREIGN KEY ([RoleToId]) REFERENCES [dbo].[Role] ([Id])
GO
