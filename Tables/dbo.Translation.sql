CREATE TABLE [dbo].[Translation]
(
[Id] [uniqueidentifier] NOT NULL,
[LanguageId] [uniqueidentifier] NOT NULL,
[Type] [nvarchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[LinkId] [uniqueidentifier] NULL,
[Code] [nvarchar] (4000) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Value] [nvarchar] (4000) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Translation] ADD CONSTRAINT [PK_Translation] PRIMARY KEY NONCLUSTERED ([Id]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Translation] ADD CONSTRAINT [FK_Translation_Language] FOREIGN KEY ([LanguageId]) REFERENCES [dbo].[Language] ([Id])
GO
