CREATE TABLE [dbo].[InspectionDrawing_AssetComponent]
(
[InspectionDrawingId] [uniqueidentifier] NOT NULL,
[AssetComponentId] [uniqueidentifier] NOT NULL,
[DateLinked] [datetime] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[InspectionDrawing_AssetComponent] ADD CONSTRAINT [PK_InspectionDrawing_AssetComponent] PRIMARY KEY NONCLUSTERED ([InspectionDrawingId], [AssetComponentId]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[InspectionDrawing_AssetComponent] ADD CONSTRAINT [FK_InspectionDrawing_AssetComponent_AssetComponent] FOREIGN KEY ([AssetComponentId]) REFERENCES [dbo].[AssetComponent] ([Id])
GO
ALTER TABLE [dbo].[InspectionDrawing_AssetComponent] ADD CONSTRAINT [FK_InspectionDrawing_AssetComponent_InspectionDrawing] FOREIGN KEY ([InspectionDrawingId]) REFERENCES [dbo].[InspectionDrawing] ([Id])
GO
