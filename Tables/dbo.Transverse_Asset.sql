CREATE TABLE [dbo].[Transverse_Asset]
(
[TransverseId] [uniqueidentifier] NOT NULL,
[AssetId] [uniqueidentifier] NOT NULL,
[DateLinked] [datetime] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Transverse_Asset] ADD CONSTRAINT [PK_TransverseAsset] PRIMARY KEY NONCLUSTERED ([TransverseId], [AssetId]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Transverse_Asset] ADD CONSTRAINT [FK_Transverse_Asset_Asset] FOREIGN KEY ([AssetId]) REFERENCES [dbo].[Asset] ([Id])
GO
ALTER TABLE [dbo].[Transverse_Asset] ADD CONSTRAINT [FK_Transverse_Asset_Transverse] FOREIGN KEY ([TransverseId]) REFERENCES [dbo].[Transverse] ([Id])
GO
