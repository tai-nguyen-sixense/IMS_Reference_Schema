CREATE TABLE [dbo].[RevisionStatus]
(
[Id] [uniqueidentifier] NOT NULL,
[Name] [nvarchar] (4000) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Icon] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Color] [nvarchar] (4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Position] [int] NOT NULL,
[IsAnActiveStatus] [bit] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[RevisionStatus] ADD CONSTRAINT [PK_RevisionStatus] PRIMARY KEY NONCLUSTERED ([Id]) ON [PRIMARY]
GO
