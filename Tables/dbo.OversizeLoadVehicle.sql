CREATE TABLE [dbo].[OversizeLoadVehicle]
(
[Id] [uniqueidentifier] NOT NULL,
[Number] [nvarchar] (4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[RequestDate] [datetime] NULL,
[Applicant] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Comments] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Height] [numeric] (18, 0) NULL,
[Weight] [numeric] (18, 0) NULL,
[OversizeLoadItineraryId] [uniqueidentifier] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[OversizeLoadVehicle] ADD CONSTRAINT [PK_OversizeLoadVehicle] PRIMARY KEY NONCLUSTERED ([Id]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[OversizeLoadVehicle] ADD CONSTRAINT [FK_OversizeLoadVehicle_OversizeLoadItinerary] FOREIGN KEY ([OversizeLoadItineraryId]) REFERENCES [dbo].[OversizeLoadItinerary] ([Id])
GO
EXEC sp_addextendedproperty N'MS_Description', N'Deprecated Silverlight?', 'SCHEMA', N'dbo', 'TABLE', N'OversizeLoadVehicle', NULL, NULL
GO
