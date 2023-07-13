CREATE TABLE [dbo].[EventPriority]
(
[Id] [uniqueidentifier] NOT NULL,
[Name] [nvarchar] (4000) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Icon] [nvarchar] (4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Color] [nvarchar] (4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Position] [int] NOT NULL,
[IsRetired] [bit] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[EventPriority] ADD CONSTRAINT [PK_EventPriority] PRIMARY KEY NONCLUSTERED ([Id]) ON [PRIMARY]
GO
