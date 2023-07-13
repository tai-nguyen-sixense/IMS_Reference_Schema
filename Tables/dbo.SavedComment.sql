CREATE TABLE [dbo].[SavedComment]
(
[Id] [uniqueidentifier] NOT NULL,
[Comment] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Type] [nvarchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[SavedComment] ADD CONSTRAINT [PK_SavedComment] PRIMARY KEY NONCLUSTERED ([Id]) ON [PRIMARY]
GO
