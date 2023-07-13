CREATE TABLE [dbo].[ReportParameterUser]
(
[ReportId] [uniqueidentifier] NOT NULL,
[Name] [nvarchar] (4000) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[SqlType] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Description] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[DefaultValue] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ShowParameter] [bit] NOT NULL CONSTRAINT [DF__ReportPar__ShowP__76F68FE1] DEFAULT ((1))
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ReportParameterUser] ADD CONSTRAINT [PK_ReportParameters] PRIMARY KEY NONCLUSTERED ([ReportId], [Name]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ReportParameterUser] ADD CONSTRAINT [FK_ReportParameters_Report] FOREIGN KEY ([ReportId]) REFERENCES [dbo].[ReportModel] ([Id])
GO
