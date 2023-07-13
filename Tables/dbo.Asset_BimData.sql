CREATE TABLE [dbo].[Asset_BimData]
(
[Id] [uniqueidentifier] NOT NULL,
[AssetId] [uniqueidentifier] NOT NULL,
[BimDataId] [uniqueidentifier] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Asset_BimData] ADD CONSTRAINT [PK_Asset_BimData] PRIMARY KEY NONCLUSTERED ([Id]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Asset_BimData] ADD CONSTRAINT [FK_Asset_BimData_AssetId] FOREIGN KEY ([AssetId]) REFERENCES [dbo].[Asset] ([Id])
GO
ALTER TABLE [dbo].[Asset_BimData] ADD CONSTRAINT [FK_Asset_BimData_BimDataId] FOREIGN KEY ([BimDataId]) REFERENCES [dbo].[BimData] ([Id])
GO
