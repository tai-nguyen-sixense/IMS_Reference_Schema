CREATE TABLE [dbo].[ALccScenari_Asset]
(
[ALccScenariId] [uniqueidentifier] NOT NULL,
[AssetId] [uniqueidentifier] NOT NULL,
[Comments] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ALccScenari_Asset] ADD CONSTRAINT [PK_ALccScenari_Asset] PRIMARY KEY NONCLUSTERED ([ALccScenariId], [AssetId]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ALccScenari_Asset] ADD CONSTRAINT [FK_ALccScenari_Asset_ALccScenari] FOREIGN KEY ([ALccScenariId]) REFERENCES [dbo].[ALccScenari] ([Id])
GO
ALTER TABLE [dbo].[ALccScenari_Asset] ADD CONSTRAINT [FK_ALccScenari_Asset_Asset] FOREIGN KEY ([AssetId]) REFERENCES [dbo].[Asset] ([Id])
GO
