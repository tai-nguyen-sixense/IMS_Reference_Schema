CREATE TABLE [dbo].[ActivityPriority]
(
[Id] [uniqueidentifier] NOT NULL,
[Name] [nvarchar] (4000) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Icon] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Color] [nvarchar] (4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Position] [int] NOT NULL,
[IsRetired] [bit] NOT NULL CONSTRAINT [DF_ActivityPriority_IsRetired] DEFAULT ((0))
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ActivityPriority] ADD CONSTRAINT [PK_ActivityPriority] PRIMARY KEY NONCLUSTERED ([Id]) ON [PRIMARY]
GO
