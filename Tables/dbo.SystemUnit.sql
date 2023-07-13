CREATE TABLE [dbo].[SystemUnit]
(
[Id] [uniqueidentifier] NOT NULL,
[Code] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Label] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[SystemUnit] ADD CONSTRAINT [PK_SystemUnit] PRIMARY KEY NONCLUSTERED ([Id]) ON [PRIMARY]
GO
