CREATE TABLE [dbo].[OversizeLoadItinerary_Asset]
(
[OversizeLoadItineraryId] [uniqueidentifier] NOT NULL,
[AssetId] [uniqueidentifier] NOT NULL,
[AssetIndex] [numeric] (18, 0) NOT NULL,
[IsUnder] [bit] NOT NULL,
[MaxHeight] [numeric] (18, 0) NOT NULL,
[MaxWeight] [numeric] (18, 0) NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[OversizeLoadItinerary_Asset] ADD CONSTRAINT [PK_OversizeLoadItinerary_Asset] PRIMARY KEY NONCLUSTERED ([OversizeLoadItineraryId], [AssetId]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[OversizeLoadItinerary_Asset] ADD CONSTRAINT [FK_OversizeLoadItinerary_Asset_Asset] FOREIGN KEY ([AssetId]) REFERENCES [dbo].[Asset] ([Id])
GO
ALTER TABLE [dbo].[OversizeLoadItinerary_Asset] ADD CONSTRAINT [FK_OversizeLoadItinerary_Asset_OversizeLoadItinerary] FOREIGN KEY ([OversizeLoadItineraryId]) REFERENCES [dbo].[OversizeLoadItinerary] ([Id])
GO
EXEC sp_addextendedproperty N'MS_Description', N'Deprecated Silverlight?', 'SCHEMA', N'dbo', 'TABLE', N'OversizeLoadItinerary_Asset', NULL, NULL
GO
