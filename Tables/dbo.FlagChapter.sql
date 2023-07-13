CREATE TABLE [dbo].[FlagChapter]
(
[Id] [uniqueidentifier] NOT NULL,
[Name] [nvarchar] (4000) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[FatherId] [uniqueidentifier] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[FlagChapter] ADD CONSTRAINT [PK_FlagChapter] PRIMARY KEY NONCLUSTERED ([Id]) ON [PRIMARY]
GO
