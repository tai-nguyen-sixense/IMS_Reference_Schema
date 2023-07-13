CREATE TABLE [dbo].[ItineraryRestrictionPoint]
(
[Id] [uniqueidentifier] NOT NULL,
[ItineraryId] [uniqueidentifier] NOT NULL,
[LinkId] [uniqueidentifier] NULL,
[Asset1Id] [uniqueidentifier] NOT NULL,
[Asset2Id] [uniqueidentifier] NOT NULL,
[Status] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[IsReturn] [bit] NOT NULL,
[DateLinked] [datetime] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ItineraryRestrictionPoint] ADD CONSTRAINT [PK_ItineraryRestrictionPoint] PRIMARY KEY NONCLUSTERED ([Id]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ItineraryRestrictionPoint] ADD CONSTRAINT [FK_Asset1_ItineraryRestrictionPoint] FOREIGN KEY ([Asset1Id]) REFERENCES [dbo].[Asset] ([Id])
GO
ALTER TABLE [dbo].[ItineraryRestrictionPoint] ADD CONSTRAINT [FK_Asset2_ItineraryRestrictionPoint] FOREIGN KEY ([Asset2Id]) REFERENCES [dbo].[Asset] ([Id])
GO
ALTER TABLE [dbo].[ItineraryRestrictionPoint] ADD CONSTRAINT [FK_AssetAsset_ItineraryRestrictionPoint] FOREIGN KEY ([LinkId]) REFERENCES [dbo].[Asset_Asset] ([Id])
GO
ALTER TABLE [dbo].[ItineraryRestrictionPoint] ADD CONSTRAINT [FK_Itinerary_ItineraryRestrictionPoint] FOREIGN KEY ([ItineraryId]) REFERENCES [dbo].[Itinerary] ([Id])
GO
