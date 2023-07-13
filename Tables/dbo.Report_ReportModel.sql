CREATE TABLE [dbo].[Report_ReportModel]
(
[ReportId] [uniqueidentifier] NOT NULL,
[ReportModelId] [uniqueidentifier] NULL,
[Position] [int] NOT NULL,
[DocumentTypeId] [uniqueidentifier] NULL,
[InspectionDocumentTypeId] [uniqueidentifier] NULL,
[FlagTypeId] [uniqueidentifier] NULL,
[Id] [uniqueidentifier] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Report_ReportModel] ADD CONSTRAINT [PK_Report_ReportModel] PRIMARY KEY NONCLUSTERED ([Id]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Report_ReportModel] ADD CONSTRAINT [FK_Report_ReportModel_DocumentType] FOREIGN KEY ([DocumentTypeId]) REFERENCES [dbo].[DocumentType] ([Id])
GO
ALTER TABLE [dbo].[Report_ReportModel] ADD CONSTRAINT [FK_Report_ReportModel_FlagType] FOREIGN KEY ([FlagTypeId]) REFERENCES [dbo].[FlagType] ([Id])
GO
ALTER TABLE [dbo].[Report_ReportModel] ADD CONSTRAINT [FK_Report_ReportModel_InspectionDocumentType] FOREIGN KEY ([InspectionDocumentTypeId]) REFERENCES [dbo].[InspectionDocumentType] ([Id])
GO
ALTER TABLE [dbo].[Report_ReportModel] ADD CONSTRAINT [FK_Report_ReportModel_Report] FOREIGN KEY ([ReportId]) REFERENCES [dbo].[Report] ([Id])
GO
ALTER TABLE [dbo].[Report_ReportModel] ADD CONSTRAINT [FK_Report_ReportModel_ReportModel] FOREIGN KEY ([ReportModelId]) REFERENCES [dbo].[ReportModel] ([Id])
GO
