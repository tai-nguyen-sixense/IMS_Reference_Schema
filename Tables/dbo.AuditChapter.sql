CREATE TABLE [dbo].[AuditChapter]
(
[Id] [uniqueidentifier] NOT NULL,
[Name] [nvarchar] (4000) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[FatherId] [uniqueidentifier] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AuditChapter] ADD CONSTRAINT [PK_AuditChapter] PRIMARY KEY NONCLUSTERED ([Id]) ON [PRIMARY]
GO
