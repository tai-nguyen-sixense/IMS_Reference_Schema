CREATE TABLE [dbo].[UserGroup]
(
[Id] [uniqueidentifier] NOT NULL,
[Name] [nvarchar] (4000) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[InheritedFromId] [uniqueidentifier] NULL,
[HasAdminPrivileges] [bit] NOT NULL,
[HasPowerPrivileges] [bit] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[UserGroup] ADD CONSTRAINT [PK_UserGroup] PRIMARY KEY NONCLUSTERED ([Id]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[UserGroup] ADD CONSTRAINT [FK_UserGroup_UserGroup] FOREIGN KEY ([InheritedFromId]) REFERENCES [dbo].[UserGroup] ([Id])
GO
