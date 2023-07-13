CREATE TABLE [dbo].[Role_Version]
(
[RoleId] [uniqueidentifier] NOT NULL,
[VersionId] [uniqueidentifier] NOT NULL,
[CanEdit] [bit] NOT NULL,
[CanView] [bit] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Role_Version] ADD CONSTRAINT [PK_Role_Version] PRIMARY KEY NONCLUSTERED ([RoleId], [VersionId]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Role_Version] ADD CONSTRAINT [FK_Role_Version_Role] FOREIGN KEY ([RoleId]) REFERENCES [dbo].[Role] ([Id])
GO
ALTER TABLE [dbo].[Role_Version] ADD CONSTRAINT [FK_Role_Version_ValueVersion] FOREIGN KEY ([VersionId]) REFERENCES [dbo].[ValueVersion] ([Id])
GO
