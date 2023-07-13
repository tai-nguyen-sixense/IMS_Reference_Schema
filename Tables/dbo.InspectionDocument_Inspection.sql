CREATE TABLE [dbo].[InspectionDocument_Inspection]
(
[InspectionDocumentId] [uniqueidentifier] NOT NULL,
[InspectionId] [uniqueidentifier] NOT NULL,
[DateLinked] [datetime] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[InspectionDocument_Inspection] ADD CONSTRAINT [PK_InspectionDocument_Inspection] PRIMARY KEY NONCLUSTERED ([InspectionDocumentId], [InspectionId]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[InspectionDocument_Inspection] ADD CONSTRAINT [FK_InspectionDocument_Inspection_Inspection] FOREIGN KEY ([InspectionId]) REFERENCES [dbo].[Inspection] ([Id])
GO
ALTER TABLE [dbo].[InspectionDocument_Inspection] ADD CONSTRAINT [FK_InspectionDocument_Inspection_InspectionDocument] FOREIGN KEY ([InspectionDocumentId]) REFERENCES [dbo].[InspectionDocument] ([Id])
GO
