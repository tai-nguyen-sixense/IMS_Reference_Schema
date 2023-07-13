CREATE TABLE [dbo].[TaskOrderType]
(
[Id] [uniqueidentifier] NOT NULL,
[Name] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Icon] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Color] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Position] [int] NOT NULL,
[IsRetired] [bit] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[TaskOrderType] ADD CONSTRAINT [PK_TaskOrderType] PRIMARY KEY NONCLUSTERED ([Id]) ON [PRIMARY]
GO
