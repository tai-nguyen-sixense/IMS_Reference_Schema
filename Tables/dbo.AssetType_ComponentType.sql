CREATE TABLE [dbo].[AssetType_ComponentType]
(
[AssetTypeId] [uniqueidentifier] NOT NULL,
[ComponentTypeId] [uniqueidentifier] NOT NULL,
[Position] [int] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AssetType_ComponentType] ADD CONSTRAINT [PK_AssetType_ComponentType] PRIMARY KEY NONCLUSTERED ([AssetTypeId], [ComponentTypeId]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AssetType_ComponentType] ADD CONSTRAINT [FK_AssetType_ComponentType_AssetType] FOREIGN KEY ([AssetTypeId]) REFERENCES [dbo].[AssetType] ([Id])
GO
ALTER TABLE [dbo].[AssetType_ComponentType] ADD CONSTRAINT [FK_AssetType_ComponentType_ComponentType] FOREIGN KEY ([ComponentTypeId]) REFERENCES [dbo].[ComponentType] ([Id])
GO
