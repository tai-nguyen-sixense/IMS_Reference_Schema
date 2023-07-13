CREATE TABLE [dbo].[EventType]
(
[Id] [uniqueidentifier] NOT NULL,
[Name] [nvarchar] (4000) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Icon] [nvarchar] (4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Color] [nvarchar] (4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Position] [int] NOT NULL,
[IsRetired] [bit] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[EventType] ADD CONSTRAINT [PK_EventType] PRIMARY KEY NONCLUSTERED ([Id]) ON [PRIMARY]
GO
