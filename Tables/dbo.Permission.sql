CREATE TABLE [dbo].[Permission]
(
[Name] [nvarchar] (4000) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Description] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Id] [uniqueidentifier] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Permission] ADD CONSTRAINT [PK_Permission] PRIMARY KEY NONCLUSTERED ([Id]) ON [PRIMARY]
GO
