CREATE TABLE [dbo].[BIReport]
(
[Id] [uniqueidentifier] NOT NULL,
[Name] [nvarchar] (4000) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Uri] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[BIReport] ADD CONSTRAINT [PK_BiReport] PRIMARY KEY NONCLUSTERED ([Id]) ON [PRIMARY]
GO
