CREATE TABLE [dbo].[AnalysisType]
(
[Id] [uniqueidentifier] NOT NULL,
[Name] [nvarchar] (1000) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Color] [nvarchar] (1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Icon] [nvarchar] (1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AnalysisType] ADD CONSTRAINT [PK_AnalysisType] PRIMARY KEY NONCLUSTERED ([Id]) ON [PRIMARY]
GO
