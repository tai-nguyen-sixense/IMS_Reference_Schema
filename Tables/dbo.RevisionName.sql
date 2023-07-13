CREATE TABLE [dbo].[RevisionName]
(
[Id] [uniqueidentifier] NOT NULL,
[Name] [nvarchar] (4000) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Position] [int] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[RevisionName] ADD CONSTRAINT [PK_RevisionName] PRIMARY KEY NONCLUSTERED ([Id]) ON [PRIMARY]
GO
