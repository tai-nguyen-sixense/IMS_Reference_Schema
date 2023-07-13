CREATE TABLE [dbo].[ComponentChapter]
(
[Id] [uniqueidentifier] NOT NULL,
[Name] [nvarchar] (4000) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[FatherId] [uniqueidentifier] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ComponentChapter] ADD CONSTRAINT [PK_ComponentChapter] PRIMARY KEY NONCLUSTERED ([Id]) WITH (FILLFACTOR=80) ON [PRIMARY]
GO
