CREATE TABLE [dbo].[LinkedTypes_AssetTypes]
(
[Id] [uniqueidentifier] NOT NULL,
[LinkedTypesId] [uniqueidentifier] NOT NULL,
[AssetType1Id] [uniqueidentifier] NOT NULL,
[AssetType2Id] [uniqueidentifier] NOT NULL,
[Comments] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[LinkedTypes_AssetTypes] ADD CONSTRAINT [PK_LinkedTypes_AssetTypes] PRIMARY KEY CLUSTERED ([Id]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[LinkedTypes_AssetTypes] ADD CONSTRAINT [FK_LinkedTypes_AssetTypes_AssetType1] FOREIGN KEY ([AssetType1Id]) REFERENCES [dbo].[AssetType] ([Id])
GO
ALTER TABLE [dbo].[LinkedTypes_AssetTypes] ADD CONSTRAINT [FK_LinkedTypes_AssetTypes_AssetType2] FOREIGN KEY ([AssetType2Id]) REFERENCES [dbo].[AssetType] ([Id])
GO
ALTER TABLE [dbo].[LinkedTypes_AssetTypes] ADD CONSTRAINT [FK_LinkedTypes_AssetTypes_LinkedTypesId] FOREIGN KEY ([LinkedTypesId]) REFERENCES [dbo].[LinkedTypes] ([Id])
GO
