CREATE TABLE [dbo].[TaskOrderPriority]
(
[Id] [uniqueidentifier] NOT NULL,
[Name] [nvarchar] (4000) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Icon] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Color] [nvarchar] (4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Position] [int] NOT NULL,
[IsRetired] [bit] NOT NULL CONSTRAINT [DF_TaskOrderPriority_IsRetired] DEFAULT ((0))
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[TaskOrderPriority] ADD CONSTRAINT [PK_TaskOrderPriority] PRIMARY KEY NONCLUSTERED ([Id]) ON [PRIMARY]
GO
