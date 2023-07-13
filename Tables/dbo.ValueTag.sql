CREATE TABLE [dbo].[ValueTag]
(
[Id] [uniqueidentifier] NOT NULL,
[Name] [nvarchar] (4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[IsArchived] [bit] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ValueTag] ADD CONSTRAINT [PK_ValueTag] PRIMARY KEY NONCLUSTERED ([Id]) ON [PRIMARY]
GO
