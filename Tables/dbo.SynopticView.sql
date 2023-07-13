CREATE TABLE [dbo].[SynopticView]
(
[Id] [uniqueidentifier] NOT NULL,
[Name] [nvarchar] (4000) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[BackGroundShape] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AssetTypeId] [uniqueidentifier] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[SynopticView] ADD CONSTRAINT [PK_SynopticView] PRIMARY KEY NONCLUSTERED ([Id]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[SynopticView] ADD CONSTRAINT [FK_SynopticView_AssetType] FOREIGN KEY ([AssetTypeId]) REFERENCES [dbo].[AssetType] ([Id])
GO
