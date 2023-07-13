CREATE TABLE [dbo].[AssetType_Chapter_Attribute_Favorite]
(
[AssetTypeId] [uniqueidentifier] NOT NULL,
[ChapterId] [uniqueidentifier] NOT NULL,
[AttributeFieldId] [uniqueidentifier] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AssetType_Chapter_Attribute_Favorite] ADD CONSTRAINT [PK_AssetType_Chapter_Attribute_Favorite] PRIMARY KEY NONCLUSTERED ([AssetTypeId], [ChapterId], [AttributeFieldId]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AssetType_Chapter_Attribute_Favorite] ADD CONSTRAINT [FK_AssetType_Chapter_Attribute_Favorite_AssetType] FOREIGN KEY ([AssetTypeId]) REFERENCES [dbo].[AssetType] ([Id])
GO
ALTER TABLE [dbo].[AssetType_Chapter_Attribute_Favorite] ADD CONSTRAINT [FK_AssetType_Chapter_Attribute_Favorite_AttributeField] FOREIGN KEY ([AttributeFieldId]) REFERENCES [dbo].[AttributeField] ([Id])
GO
ALTER TABLE [dbo].[AssetType_Chapter_Attribute_Favorite] ADD CONSTRAINT [FK_AssetType_Chapter_Attribute_Favorite_Chapter] FOREIGN KEY ([ChapterId]) REFERENCES [dbo].[Chapter] ([Id])
GO
