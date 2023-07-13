CREATE TABLE [dbo].[InspectionPhoto_Defect]
(
[DefectId] [uniqueidentifier] NOT NULL,
[DateLinked] [datetime] NULL,
[InspectionPhotoId] [uniqueidentifier] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[InspectionPhoto_Defect] ADD CONSTRAINT [PK_InspectionPhoto_Defect] PRIMARY KEY NONCLUSTERED ([DefectId], [InspectionPhotoId]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[InspectionPhoto_Defect] ADD CONSTRAINT [FK_InspectionPhoto_Defect_Defect1] FOREIGN KEY ([DefectId]) REFERENCES [dbo].[Defect] ([Id])
GO
ALTER TABLE [dbo].[InspectionPhoto_Defect] ADD CONSTRAINT [FK_InspectionPhoto_Defect_InspectionPhoto] FOREIGN KEY ([InspectionPhotoId]) REFERENCES [dbo].[InspectionPhoto] ([Id])
GO
