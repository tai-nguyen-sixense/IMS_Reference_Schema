CREATE TABLE [dbo].[Chapter]
(
[Id] [uniqueidentifier] NOT NULL,
[Name] [nvarchar] (4000) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[MustBeIterated] [bit] NOT NULL,
[ExternalDbIterationFieldName] [nvarchar] (64) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[FatherId] [uniqueidentifier] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Chapter] ADD CONSTRAINT [PK_Chapter] PRIMARY KEY NONCLUSTERED ([Id]) ON [PRIMARY]
GO
