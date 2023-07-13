CREATE TABLE [dbo].[SummaryType]
(
[Id] [uniqueidentifier] NOT NULL,
[Name] [nvarchar] (4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[SummaryType] ADD CONSTRAINT [PK_SummaryType] PRIMARY KEY NONCLUSTERED ([Id]) ON [PRIMARY]
GO
