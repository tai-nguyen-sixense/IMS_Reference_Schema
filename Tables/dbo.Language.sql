CREATE TABLE [dbo].[Language]
(
[Id] [uniqueidentifier] NOT NULL,
[Name] [nvarchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Position] [int] NOT NULL,
[Locale] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Currency] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Language] ADD CONSTRAINT [PK_Language] PRIMARY KEY NONCLUSTERED ([Id]) ON [PRIMARY]
GO
