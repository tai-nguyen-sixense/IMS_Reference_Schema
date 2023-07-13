CREATE TABLE [dbo].[InspectionPhoto_Flag]
(
[FlagId] [uniqueidentifier] NOT NULL,
[DateLinked] [datetime] NULL,
[InspectionPhotoId] [uniqueidentifier] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[InspectionPhoto_Flag] ADD CONSTRAINT [PK_InspectionPhoto_Flag] PRIMARY KEY NONCLUSTERED ([FlagId], [InspectionPhotoId]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[InspectionPhoto_Flag] ADD CONSTRAINT [FK_InspectionPhoto_Flag_Flag1] FOREIGN KEY ([FlagId]) REFERENCES [dbo].[Flag] ([Id])
GO
ALTER TABLE [dbo].[InspectionPhoto_Flag] ADD CONSTRAINT [FK_InspectionPhoto_Flag_InspectionPhoto] FOREIGN KEY ([InspectionPhotoId]) REFERENCES [dbo].[InspectionPhoto] ([Id])
GO
