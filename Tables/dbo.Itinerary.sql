CREATE TABLE [dbo].[Itinerary]
(
[Id] [uniqueidentifier] NOT NULL,
[Name] [nvarchar] (4000) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Number] [nvarchar] (4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Comments] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ItineraryStatusId] [uniqueidentifier] NOT NULL,
[Height] [float] NULL,
[Width] [float] NULL,
[Load] [float] NULL,
[RequestDate] [datetime] NULL,
[TravelDate] [datetime] NULL,
[UserId] [uniqueidentifier] NOT NULL,
[LastModified] [datetime] NOT NULL,
[ItinerariesList] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[hasReturn] [bit] NULL,
[AxlesLength] [float] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Itinerary] ADD CONSTRAINT [PK_Itinerary] PRIMARY KEY NONCLUSTERED ([Id]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Itinerary] ADD CONSTRAINT [FK_Itinerary_ItineraryStatus] FOREIGN KEY ([ItineraryStatusId]) REFERENCES [dbo].[ItineraryStatus] ([Id])
GO
ALTER TABLE [dbo].[Itinerary] ADD CONSTRAINT [FK_Itinerary_User] FOREIGN KEY ([UserId]) REFERENCES [dbo].[User] ([Id])
GO
