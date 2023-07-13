CREATE TABLE [dbo].[Linear_AssetPosition]
(
[Id] [uniqueidentifier] NOT NULL,
[AssetId] [uniqueidentifier] NOT NULL,
[ReferenceAssetId] [uniqueidentifier] NOT NULL,
[PositionXBegin] [float] NOT NULL,
[PositionYBegin] [float] NULL,
[PositionXEnd] [float] NULL,
[PositionYEnd] [float] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Linear_AssetPosition] ADD CONSTRAINT [PK_Linear_AssetPosition] PRIMARY KEY NONCLUSTERED ([Id]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Linear_AssetPosition] ADD CONSTRAINT [UC_Linear_AssetPosition_Asset_ReferenceAsset] UNIQUE NONCLUSTERED ([AssetId], [ReferenceAssetId]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Linear_AssetPosition] ADD CONSTRAINT [FK_Linear_AssetPosition_Asset] FOREIGN KEY ([AssetId]) REFERENCES [dbo].[Asset] ([Id])
GO
ALTER TABLE [dbo].[Linear_AssetPosition] ADD CONSTRAINT [FK_Linear_AssetPosition_ReferenceAsset] FOREIGN KEY ([ReferenceAssetId]) REFERENCES [dbo].[Asset] ([Id])
GO
