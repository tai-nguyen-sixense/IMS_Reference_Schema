CREATE TABLE [dbo].[NavigationDrawing_AssetComponent]
(
[NavigationDrawingId] [uniqueidentifier] NOT NULL,
[AssetComponentId] [uniqueidentifier] NOT NULL,
[LabelPosition] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ComponentShape] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[IsHorizontal] [bit] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[NavigationDrawing_AssetComponent] ADD CONSTRAINT [PK_NavigationDrawing_AssetComponent] PRIMARY KEY NONCLUSTERED ([NavigationDrawingId], [AssetComponentId]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[NavigationDrawing_AssetComponent] ADD CONSTRAINT [FK_NavigationDrawing_AssetComponent_AssetComponent] FOREIGN KEY ([AssetComponentId]) REFERENCES [dbo].[AssetComponent] ([Id])
GO
ALTER TABLE [dbo].[NavigationDrawing_AssetComponent] ADD CONSTRAINT [FK_NavigationDrawing_AssetComponent_NavigationDrawing] FOREIGN KEY ([NavigationDrawingId]) REFERENCES [dbo].[NavigationDrawing] ([Id])
GO
