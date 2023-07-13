CREATE TABLE [dbo].[Filter]
(
[Id] [uniqueidentifier] NOT NULL,
[Name] [nvarchar] (4000) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[LastModified] [smalldatetime] NOT NULL,
[UserId] [uniqueidentifier] NOT NULL,
[AssetName] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AssetNumber] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[IsAssetArchived] [bit] NULL,
[IsAssetMyFavorite] [bit] NOT NULL,
[AssetComments] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AssetTypes] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[IsPublic] [bit] NOT NULL,
[IsStartupFilter] [bit] NOT NULL,
[RootAssetId] [uniqueidentifier] NULL,
[PositionXBegin] [float] NULL,
[PositionXEnd] [float] NULL,
[ContactId] [uniqueidentifier] NULL,
[ComponentTypes] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[FatherWithChilds] [bit] NOT NULL,
[FatherIds] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[West] [float] NULL,
[East] [float] NULL,
[North] [float] NULL,
[South] [float] NULL,
[Clauses] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Filter] ADD CONSTRAINT [PK_Filter] PRIMARY KEY NONCLUSTERED ([Id]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Filter] ADD CONSTRAINT [FK_Filter_Contact] FOREIGN KEY ([ContactId]) REFERENCES [dbo].[Contact] ([Id])
GO
ALTER TABLE [dbo].[Filter] ADD CONSTRAINT [FK_Filter_User] FOREIGN KEY ([UserId]) REFERENCES [dbo].[User] ([Id])
GO
