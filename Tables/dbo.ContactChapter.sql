CREATE TABLE [dbo].[ContactChapter]
(
[Id] [uniqueidentifier] NOT NULL,
[Name] [nvarchar] (400) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[FatherId] [uniqueidentifier] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ContactChapter] ADD CONSTRAINT [PK_ContactChapter] PRIMARY KEY NONCLUSTERED ([Id]) ON [PRIMARY]
GO
