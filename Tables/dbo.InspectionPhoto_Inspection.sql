CREATE TABLE [dbo].[InspectionPhoto_Inspection]
(
[InspectionId] [uniqueidentifier] NOT NULL,
[InspectionPhotoId] [uniqueidentifier] NOT NULL,
[DateLinked] [datetime] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[InspectionPhoto_Inspection] ADD CONSTRAINT [PK_InspectionPhoto_Inspection] PRIMARY KEY NONCLUSTERED ([InspectionId], [InspectionPhotoId]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[InspectionPhoto_Inspection] ADD CONSTRAINT [FK_InspectionPhoto_Inspection_Inspection] FOREIGN KEY ([InspectionId]) REFERENCES [dbo].[Inspection] ([Id])
GO
ALTER TABLE [dbo].[InspectionPhoto_Inspection] ADD CONSTRAINT [FK_InspectionPhoto_Inspection_InspectionPhoto] FOREIGN KEY ([InspectionPhotoId]) REFERENCES [dbo].[InspectionPhoto] ([Id])
GO
