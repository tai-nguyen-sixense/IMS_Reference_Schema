CREATE TABLE [dbo].[InspectionPhoto_Activity]
(
[ActivityId] [uniqueidentifier] NOT NULL,
[DateLinked] [datetime] NULL,
[InspectionPhotoId] [uniqueidentifier] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[InspectionPhoto_Activity] ADD CONSTRAINT [PK_InspectionPhoto_Activity] PRIMARY KEY NONCLUSTERED ([ActivityId], [InspectionPhotoId]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[InspectionPhoto_Activity] ADD CONSTRAINT [FK_InspectionPhoto_Activity_Activity1] FOREIGN KEY ([ActivityId]) REFERENCES [dbo].[Activity] ([Id])
GO
ALTER TABLE [dbo].[InspectionPhoto_Activity] ADD CONSTRAINT [FK_InspectionPhoto_Activity_InspectionPhoto] FOREIGN KEY ([InspectionPhotoId]) REFERENCES [dbo].[InspectionPhoto] ([Id])
GO
