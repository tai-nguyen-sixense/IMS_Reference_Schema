CREATE TABLE [dbo].[AssetType]
(
[Id] [uniqueidentifier] NOT NULL,
[Name] [nvarchar] (4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Number] [nvarchar] (4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Icon] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Color] [nvarchar] (4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Position] [int] NOT NULL,
[ManagementRestrictedTo] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[IsEquipment] [bit] NOT NULL,
[VisibleZoomInGis] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[FatherId] [uniqueidentifier] NULL,
[IsLinear] [bit] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AssetType] ADD CONSTRAINT [PK_AssetType] PRIMARY KEY NONCLUSTERED ([Id]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AssetType] ADD CONSTRAINT [FK_AssetType_AssetType] FOREIGN KEY ([FatherId]) REFERENCES [dbo].[AssetType] ([Id])
GO
