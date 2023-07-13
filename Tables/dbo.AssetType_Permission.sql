CREATE TABLE [dbo].[AssetType_Permission]
(
[Id] [uniqueidentifier] NOT NULL,
[UserGroupId] [uniqueidentifier] NOT NULL,
[AssetTypeId] [uniqueidentifier] NULL,
[View] [bit] NULL,
[Check] [bit] NULL,
[Create] [bit] NULL,
[Copy] [bit] NULL,
[Edit] [bit] NULL,
[Delete] [bit] NULL,
[DateLinked] [datetime] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AssetType_Permission] ADD CONSTRAINT [PK_AssetType_Permission] PRIMARY KEY NONCLUSTERED ([Id]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AssetType_Permission] ADD CONSTRAINT [FK_AssetType_Permission_AssetType] FOREIGN KEY ([AssetTypeId]) REFERENCES [dbo].[AssetType] ([Id])
GO
ALTER TABLE [dbo].[AssetType_Permission] ADD CONSTRAINT [FK_AssetType_Permission_UserGroup] FOREIGN KEY ([UserGroupId]) REFERENCES [dbo].[UserGroup] ([Id])
GO
