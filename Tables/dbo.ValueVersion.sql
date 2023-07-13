CREATE TABLE [dbo].[ValueVersion]
(
[Id] [uniqueidentifier] NOT NULL,
[Code] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Label] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[VersionIndex] [int] NOT NULL,
[IsDefaultVersion] [bit] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ValueVersion] ADD CONSTRAINT [PK_ValueVersion] PRIMARY KEY NONCLUSTERED ([Id]) ON [PRIMARY]
GO
