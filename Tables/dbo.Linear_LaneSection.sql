CREATE TABLE [dbo].[Linear_LaneSection]
(
[Id] [uniqueidentifier] NOT NULL,
[AssetId] [uniqueidentifier] NOT NULL,
[ReferenceAssetId] [uniqueidentifier] NOT NULL,
[PositionXBegin] [float] NOT NULL,
[PositionXEnd] [float] NOT NULL,
[PositionYBegin] [float] NOT NULL,
[PositionYEnd] [float] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Linear_LaneSection] ADD CONSTRAINT [PK_Linear_LaneSection] PRIMARY KEY NONCLUSTERED ([Id]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Linear_LaneSection] ADD CONSTRAINT [FK_Linear_LaneSection_Asset] FOREIGN KEY ([AssetId]) REFERENCES [dbo].[Asset] ([Id])
GO
ALTER TABLE [dbo].[Linear_LaneSection] ADD CONSTRAINT [FK_Linear_LaneSection_ReferenceAsset] FOREIGN KEY ([ReferenceAssetId]) REFERENCES [dbo].[Asset] ([Id])
GO
