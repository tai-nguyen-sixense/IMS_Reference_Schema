CREATE TABLE [dbo].[InspectionPhoto_InspectionPoint]
(
[InspectionPointId] [uniqueidentifier] NOT NULL,
[DateLinked] [datetime] NULL,
[InspectionPhotoId] [uniqueidentifier] NOT NULL,
[InspectionPointCommentId] [uniqueidentifier] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[InspectionPhoto_InspectionPoint] ADD CONSTRAINT [PK_InspectionPhoto_InspectionPoint] PRIMARY KEY NONCLUSTERED ([InspectionPointId], [InspectionPhotoId]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[InspectionPhoto_InspectionPoint] ADD CONSTRAINT [FK_InspectionPhoto_InspectionPoint_InspectionPhoto] FOREIGN KEY ([InspectionPhotoId]) REFERENCES [dbo].[InspectionPhoto] ([Id])
GO
ALTER TABLE [dbo].[InspectionPhoto_InspectionPoint] ADD CONSTRAINT [FK_InspectionPhoto_InspectionPoint_InspectionPoint] FOREIGN KEY ([InspectionPointId]) REFERENCES [dbo].[InspectionPoint] ([Id])
GO
ALTER TABLE [dbo].[InspectionPhoto_InspectionPoint] ADD CONSTRAINT [FK_InspectionPhoto_InspectionPoint_InspectionPointComment] FOREIGN KEY ([InspectionPointCommentId]) REFERENCES [dbo].[InspectionPointComment] ([Id])
GO
