CREATE TABLE [dbo].[FavoriteAsset]
(
[UserId] [uniqueidentifier] NOT NULL,
[AssetId] [uniqueidentifier] NOT NULL,
[LinkDate] [datetime] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[FavoriteAsset] ADD CONSTRAINT [PK_FavoriteAsset] PRIMARY KEY NONCLUSTERED ([UserId], [AssetId]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[FavoriteAsset] ADD CONSTRAINT [FK_FavoriteAsset_Asset] FOREIGN KEY ([AssetId]) REFERENCES [dbo].[Asset] ([Id])
GO
ALTER TABLE [dbo].[FavoriteAsset] ADD CONSTRAINT [FK_FavoriteAsset_User] FOREIGN KEY ([UserId]) REFERENCES [dbo].[User] ([Id])
GO
