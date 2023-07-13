CREATE TABLE [dbo].[BR_AuditStatus]
(
[Id] [uniqueidentifier] NOT NULL,
[RoleFromId] [uniqueidentifier] NOT NULL,
[AuditStatusFromId] [uniqueidentifier] NOT NULL,
[AuditStatusToId] [uniqueidentifier] NOT NULL,
[RoleToId] [uniqueidentifier] NOT NULL,
[SameTeamOnly] [bit] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[BR_AuditStatus] ADD CONSTRAINT [PK_BR_AuditStatus] PRIMARY KEY CLUSTERED ([Id]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[BR_AuditStatus] ADD CONSTRAINT [FK_BR_AuditStatus_AuditStatus] FOREIGN KEY ([AuditStatusFromId]) REFERENCES [dbo].[AuditStatus] ([Id])
GO
ALTER TABLE [dbo].[BR_AuditStatus] ADD CONSTRAINT [FK_BR_AuditStatus_AuditStatus1] FOREIGN KEY ([AuditStatusToId]) REFERENCES [dbo].[AuditStatus] ([Id])
GO
ALTER TABLE [dbo].[BR_AuditStatus] ADD CONSTRAINT [FK_BR_AuditStatus_Role] FOREIGN KEY ([RoleFromId]) REFERENCES [dbo].[Role] ([Id])
GO
ALTER TABLE [dbo].[BR_AuditStatus] ADD CONSTRAINT [FK_BR_AuditStatus_Role1] FOREIGN KEY ([RoleToId]) REFERENCES [dbo].[Role] ([Id])
GO
