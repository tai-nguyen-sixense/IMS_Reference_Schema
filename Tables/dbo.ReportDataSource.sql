CREATE TABLE [dbo].[ReportDataSource]
(
[ReportId] [uniqueidentifier] NOT NULL,
[DataSetName] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[SelectMethodCommand] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[SelectParameter] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Description] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[IsRequired] [bit] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ReportDataSource] ADD CONSTRAINT [PK_ReportDataSource] PRIMARY KEY NONCLUSTERED ([ReportId], [DataSetName]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ReportDataSource] ADD CONSTRAINT [FK_ReportDataSource_Report] FOREIGN KEY ([ReportId]) REFERENCES [dbo].[ReportModel] ([Id])
GO
