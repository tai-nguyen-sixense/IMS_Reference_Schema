CREATE TABLE [dbo].[InspectionDocument_Flag]
(
[InspectionDocumentId] [uniqueidentifier] NOT NULL,
[FlagId] [uniqueidentifier] NOT NULL,
[DateLinked] [datetime] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[InspectionDocument_Flag] ADD CONSTRAINT [PK_InspectionDocument_Flag] PRIMARY KEY NONCLUSTERED ([InspectionDocumentId], [FlagId]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[InspectionDocument_Flag] ADD CONSTRAINT [FK_InspectionDocument_Flag_Flag] FOREIGN KEY ([FlagId]) REFERENCES [dbo].[Flag] ([Id])
GO
ALTER TABLE [dbo].[InspectionDocument_Flag] ADD CONSTRAINT [FK_InspectionDocument_Flag_InspectionDocument] FOREIGN KEY ([InspectionDocumentId]) REFERENCES [dbo].[InspectionDocument] ([Id])
GO
