CREATE TABLE [dbo].[InspectionDocument_Audit]
(
[InspectionDocumentId] [uniqueidentifier] NOT NULL,
[AuditId] [uniqueidentifier] NOT NULL,
[DateLinked] [datetime] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[InspectionDocument_Audit] ADD CONSTRAINT [PK_InspectionDocument_Audit] PRIMARY KEY NONCLUSTERED ([InspectionDocumentId], [AuditId]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[InspectionDocument_Audit] ADD CONSTRAINT [FK_InspectionDocument_Audit_Audit] FOREIGN KEY ([AuditId]) REFERENCES [dbo].[Audit] ([Id])
GO
ALTER TABLE [dbo].[InspectionDocument_Audit] ADD CONSTRAINT [FK_InspectionDocument_Audit_InspectionDocument] FOREIGN KEY ([InspectionDocumentId]) REFERENCES [dbo].[InspectionDocument] ([Id])
GO
