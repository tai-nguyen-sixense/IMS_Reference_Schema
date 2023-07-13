CREATE TABLE [dbo].[ReviewType]
(
[Id] [uniqueidentifier] NOT NULL,
[Name] [nvarchar] (4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ReviewType] ADD CONSTRAINT [PK_ReviewType] PRIMARY KEY NONCLUSTERED ([Id]) ON [PRIMARY]
GO
