CREATE TABLE [dbo].[InspectionPhoto_Audit]
(
[AuditId] [uniqueidentifier] NOT NULL,
[DateLinked] [datetime] NULL,
[InspectionPhotoId] [uniqueidentifier] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[InspectionPhoto_Audit] ADD CONSTRAINT [PK_InspectionPhoto_Audit] PRIMARY KEY NONCLUSTERED ([AuditId], [InspectionPhotoId]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[InspectionPhoto_Audit] ADD CONSTRAINT [FK_InspectionPhoto_Audit_Audit] FOREIGN KEY ([AuditId]) REFERENCES [dbo].[Audit] ([Id])
GO
ALTER TABLE [dbo].[InspectionPhoto_Audit] ADD CONSTRAINT [FK_InspectionPhoto_Audit_InspectionPhoto] FOREIGN KEY ([InspectionPhotoId]) REFERENCES [dbo].[InspectionPhoto] ([Id])
GO
