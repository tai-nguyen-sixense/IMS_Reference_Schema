CREATE TABLE [dbo].[FlowDataStatus]
(
[Id] [uniqueidentifier] NOT NULL,
[Name] [nvarchar] (4000) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Icon] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Color] [nvarchar] (4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[MarkerType] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[MarkerSize] [int] NULL,
[IsAnActiveStatus] [bit] NOT NULL,
[Position] [int] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[FlowDataStatus] ADD CONSTRAINT [PK_FlowDataStatus] PRIMARY KEY NONCLUSTERED ([Id]) ON [PRIMARY]
GO
