CREATE TABLE [dbo].[DrawingPolygon]
(
[DrawingId] [uniqueidentifier] NOT NULL,
[ComponentId] [uniqueidentifier] NOT NULL,
[SerializedPolygons] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[DrawingPolygon] ADD CONSTRAINT [PK_DrawingPolygon] PRIMARY KEY NONCLUSTERED ([DrawingId], [ComponentId]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[DrawingPolygon] ADD CONSTRAINT [FK_DrawingPolygon_AssetComponent] FOREIGN KEY ([ComponentId]) REFERENCES [dbo].[AssetComponent] ([Id])
GO
ALTER TABLE [dbo].[DrawingPolygon] ADD CONSTRAINT [FK_DrawingPolygon_Drawing] FOREIGN KEY ([DrawingId]) REFERENCES [dbo].[Drawing] ([Id])
GO
