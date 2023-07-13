CREATE TABLE [dbo].[FlagPriority]
(
[Id] [uniqueidentifier] NOT NULL,
[Value] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Name] [nvarchar] (4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Color] [nvarchar] (4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Icon] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Position] [int] NULL,
[TaskOrderMsgType] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[IsRetired] [bit] NOT NULL CONSTRAINT [DF_FlagPriority_IsRetired] DEFAULT ((0))
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[FlagPriority] ADD CONSTRAINT [PK_FlagPriority] PRIMARY KEY NONCLUSTERED ([Id]) ON [PRIMARY]
GO
