CREATE TABLE [dbo].[GisTileSource]
(
[Id] [uniqueidentifier] NOT NULL,
[Name] [nvarchar] (4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Url] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Layers] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[HasFeatureInfos] [bit] NOT NULL CONSTRAINT [DF__GisTileSo__HasFe__357DD23F] DEFAULT ('0'),
[Auth] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[GisTileSource] ADD CONSTRAINT [PK_GisTileSource] PRIMARY KEY NONCLUSTERED ([Id]) ON [PRIMARY]
GO
