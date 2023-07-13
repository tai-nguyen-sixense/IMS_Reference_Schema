CREATE TABLE [dbo].[AssetType_Chapter]
(
[AssetTypeId] [uniqueidentifier] NOT NULL,
[ChapterId] [uniqueidentifier] NOT NULL,
[Position] [int] NOT NULL,
[FatherId] [uniqueidentifier] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AssetType_Chapter] ADD CONSTRAINT [PK_AssetTypeChapter] PRIMARY KEY NONCLUSTERED ([AssetTypeId], [ChapterId]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AssetType_Chapter] ADD CONSTRAINT [FK_AssetType_Chapter_AssetType] FOREIGN KEY ([AssetTypeId]) REFERENCES [dbo].[AssetType] ([Id])
GO
ALTER TABLE [dbo].[AssetType_Chapter] ADD CONSTRAINT [FK_AssetType_Chapter_Chapter] FOREIGN KEY ([ChapterId]) REFERENCES [dbo].[Chapter] ([Id])
GO
