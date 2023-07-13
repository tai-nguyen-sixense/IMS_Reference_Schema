CREATE TABLE [dbo].[NavigationDrawing_Asset]
(
[NavigationDrawingId] [uniqueidentifier] NOT NULL,
[AssetId] [uniqueidentifier] NOT NULL,
[LastModified] [smalldatetime] NOT NULL,
[Shapes] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[NavigationDrawing_Asset] ADD CONSTRAINT [PK_NavigationDrawingAsset] PRIMARY KEY NONCLUSTERED ([NavigationDrawingId], [AssetId]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[NavigationDrawing_Asset] ADD CONSTRAINT [FK_NavigationDrawing_AssetId] FOREIGN KEY ([AssetId]) REFERENCES [dbo].[Asset] ([Id])
GO
ALTER TABLE [dbo].[NavigationDrawing_Asset] ADD CONSTRAINT [FK_NavigationDrawingId_Asset] FOREIGN KEY ([NavigationDrawingId]) REFERENCES [dbo].[NavigationDrawing] ([Id])
GO
