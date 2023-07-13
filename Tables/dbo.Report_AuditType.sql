CREATE TABLE [dbo].[Report_AuditType]
(
[ReportId] [uniqueidentifier] NOT NULL,
[AuditTypeId] [uniqueidentifier] NOT NULL,
[LinkedOn] [date] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Report_AuditType] ADD CONSTRAINT [PK_Report_AuditType] PRIMARY KEY NONCLUSTERED ([ReportId], [AuditTypeId]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Report_AuditType] ADD CONSTRAINT [FK_Report_AuditType_AuditType] FOREIGN KEY ([AuditTypeId]) REFERENCES [dbo].[AuditType] ([Id])
GO
ALTER TABLE [dbo].[Report_AuditType] ADD CONSTRAINT [FK_Report_AuditType_Report] FOREIGN KEY ([ReportId]) REFERENCES [dbo].[Report] ([Id])
GO
