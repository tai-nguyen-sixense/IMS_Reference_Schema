CREATE TABLE [dbo].[TableFatherRowValue]
(
[Id] [uniqueidentifier] NOT NULL,
[Position] [int] NOT NULL,
[Value] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[TableRevisionId] [uniqueidentifier] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[TableFatherRowValue] ADD CONSTRAINT [PK_TableFatherRowValue] PRIMARY KEY CLUSTERED ([Id]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[TableFatherRowValue] ADD CONSTRAINT [FK_TableFatherRowValue_TableRevision] FOREIGN KEY ([TableRevisionId]) REFERENCES [dbo].[TableRevision] ([Id])
GO
