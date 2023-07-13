CREATE TABLE [dbo].[InspectionDrawingShape]
(
[DefectId] [uniqueidentifier] NULL,
[InspectionDrawingId] [uniqueidentifier] NOT NULL,
[SerializedShapes] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[LastModified] [smalldatetime] NOT NULL,
[UserId] [uniqueidentifier] NOT NULL,
[Id] [uniqueidentifier] NOT NULL,
[FlagId] [uniqueidentifier] NULL,
[AssetComponentId] [uniqueidentifier] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[InspectionDrawingShape] ADD CONSTRAINT [PK_InspectionDrawingShapeId] PRIMARY KEY CLUSTERED ([Id]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[InspectionDrawingShape] ADD CONSTRAINT [FK_InspectionDrawingShape_AssetComponent] FOREIGN KEY ([AssetComponentId]) REFERENCES [dbo].[AssetComponent] ([Id])
GO
ALTER TABLE [dbo].[InspectionDrawingShape] ADD CONSTRAINT [FK_InspectionDrawingShape_Defect] FOREIGN KEY ([DefectId]) REFERENCES [dbo].[Defect] ([Id])
GO
ALTER TABLE [dbo].[InspectionDrawingShape] ADD CONSTRAINT [FK_InspectionDrawingShape_Flag] FOREIGN KEY ([FlagId]) REFERENCES [dbo].[Flag] ([Id])
GO
ALTER TABLE [dbo].[InspectionDrawingShape] ADD CONSTRAINT [FK_InspectionDrawingShape_InspectionDrawing] FOREIGN KEY ([InspectionDrawingId]) REFERENCES [dbo].[InspectionDrawing] ([Id])
GO
ALTER TABLE [dbo].[InspectionDrawingShape] ADD CONSTRAINT [FK_InspectionDrawingShape_User] FOREIGN KEY ([UserId]) REFERENCES [dbo].[User] ([Id])
GO
