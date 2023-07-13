CREATE TABLE [dbo].[Linear_AssetCache]
(
[AssetId] [uniqueidentifier] NOT NULL,
[ReferenceAssetFatherId] [uniqueidentifier] NULL,
[ReferenceAssetFatherName] [nvarchar] (4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ReferenceAssetId] [uniqueidentifier] NOT NULL,
[ReferenceAssetName] [nvarchar] (4000) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[PositionXBegin] [float] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Linear_AssetCache] ADD CONSTRAINT [PK_Linear_AssetCache] PRIMARY KEY NONCLUSTERED ([AssetId]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Linear_AssetCache] ADD CONSTRAINT [FK_Linear_AssetCache_Asset] FOREIGN KEY ([AssetId]) REFERENCES [dbo].[Asset] ([Id])
GO
ALTER TABLE [dbo].[Linear_AssetCache] ADD CONSTRAINT [FK_Linear_AssetCache_ReferenceAsset] FOREIGN KEY ([ReferenceAssetId]) REFERENCES [dbo].[Asset] ([Id])
GO
ALTER TABLE [dbo].[Linear_AssetCache] ADD CONSTRAINT [FK_Linear_AssetCache_ReferenceAssetFather] FOREIGN KEY ([ReferenceAssetFatherId]) REFERENCES [dbo].[Asset] ([Id])
GO
