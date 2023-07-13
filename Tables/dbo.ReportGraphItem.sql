CREATE TABLE [dbo].[ReportGraphItem]
(
[Id] [uniqueidentifier] NOT NULL,
[ReportGraphId] [uniqueidentifier] NOT NULL,
[Type] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Position] [int] NOT NULL,
[ExcludeWhenSubReportGraph] [bit] NOT NULL,
[WhitePage] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[FlowDataGraphId] [uniqueidentifier] NULL,
[SubReportGraphId] [uniqueidentifier] NULL,
[ReportModelId] [uniqueidentifier] NULL,
[ChapterName] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ReportGraphItem] ADD CONSTRAINT [PK_ReportGraphItem] PRIMARY KEY NONCLUSTERED ([Id]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ReportGraphItem] ADD CONSTRAINT [FK_ReportGraphItem_FlowDataGraph] FOREIGN KEY ([FlowDataGraphId]) REFERENCES [dbo].[FlowDataGraph] ([Id])
GO
ALTER TABLE [dbo].[ReportGraphItem] ADD CONSTRAINT [FK_ReportGraphItem_ReportGraph] FOREIGN KEY ([ReportGraphId]) REFERENCES [dbo].[ReportGraph] ([Id])
GO
ALTER TABLE [dbo].[ReportGraphItem] ADD CONSTRAINT [FK_ReportGraphItem_ReportModel] FOREIGN KEY ([ReportModelId]) REFERENCES [dbo].[ReportModel] ([Id])
GO
ALTER TABLE [dbo].[ReportGraphItem] ADD CONSTRAINT [FK_ReportGraphItem_SubReportGraph] FOREIGN KEY ([SubReportGraphId]) REFERENCES [dbo].[ReportGraph] ([Id])
GO
