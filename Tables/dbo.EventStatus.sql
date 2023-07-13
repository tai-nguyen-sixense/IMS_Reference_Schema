CREATE TABLE [dbo].[EventStatus]
(
[Id] [uniqueidentifier] NOT NULL,
[Name] [nvarchar] (4000) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Icon] [nvarchar] (4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Color] [nvarchar] (4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Position] [int] NOT NULL,
[IsAnActiveStatus] [bit] NOT NULL,
[IsRetired] [bit] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[EventStatus] ADD CONSTRAINT [PK_EventStatus] PRIMARY KEY NONCLUSTERED ([Id]) ON [PRIMARY]
GO
