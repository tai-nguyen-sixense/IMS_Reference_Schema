CREATE TABLE [dbo].[BR_DocumentRevisionStatus]
(
[Id] [uniqueidentifier] NOT NULL,
[RoleFromId] [uniqueidentifier] NOT NULL,
[RevisionStatusFromId] [uniqueidentifier] NOT NULL,
[RevisionStatusToId] [uniqueidentifier] NOT NULL,
[RoleToId] [uniqueidentifier] NOT NULL,
[SameTeamOnly] [bit] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[BR_DocumentRevisionStatus] ADD CONSTRAINT [PK_BR_RevisionStatus] PRIMARY KEY NONCLUSTERED ([Id]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[BR_DocumentRevisionStatus] ADD CONSTRAINT [FK_BR_RevisionStatus_RevisionStatus] FOREIGN KEY ([RevisionStatusFromId]) REFERENCES [dbo].[RevisionStatus] ([Id])
GO
ALTER TABLE [dbo].[BR_DocumentRevisionStatus] ADD CONSTRAINT [FK_BR_RevisionStatus_RevisionStatus1] FOREIGN KEY ([RevisionStatusToId]) REFERENCES [dbo].[RevisionStatus] ([Id])
GO
ALTER TABLE [dbo].[BR_DocumentRevisionStatus] ADD CONSTRAINT [FK_BR_RevisionStatus_Role] FOREIGN KEY ([RoleFromId]) REFERENCES [dbo].[Role] ([Id])
GO
ALTER TABLE [dbo].[BR_DocumentRevisionStatus] ADD CONSTRAINT [FK_BR_RevisionStatus_Role1] FOREIGN KEY ([RoleToId]) REFERENCES [dbo].[Role] ([Id])
GO
