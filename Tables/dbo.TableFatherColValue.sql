CREATE TABLE [dbo].[TableFatherColValue]
(
[Id] [uniqueidentifier] NOT NULL,
[Position] [int] NOT NULL,
[Value] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[TableRevisionId] [uniqueidentifier] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[TableFatherColValue] ADD CONSTRAINT [PK_TableFatherColValue] PRIMARY KEY CLUSTERED ([Id]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[TableFatherColValue] ADD CONSTRAINT [FK_TableFatherColValue_TableRevision] FOREIGN KEY ([TableRevisionId]) REFERENCES [dbo].[TableRevision] ([Id])
GO
