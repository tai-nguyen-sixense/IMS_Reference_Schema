CREATE TABLE [dbo].[LinkedTypes]
(
[Id] [uniqueidentifier] NOT NULL,
[Name] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Color] [nvarchar] (4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Icon] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[LinkedTypes] ADD CONSTRAINT [PK_LinkedTypes] PRIMARY KEY CLUSTERED ([Id]) ON [PRIMARY]
GO
