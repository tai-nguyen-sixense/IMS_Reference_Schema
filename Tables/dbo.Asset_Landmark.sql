CREATE TABLE [dbo].[Asset_Landmark]
(
[Id] [uniqueidentifier] NOT NULL,
[AssetId] [uniqueidentifier] NOT NULL,
[LandmarkId] [uniqueidentifier] NOT NULL,
[DeltaX] [float] NOT NULL,
[DeltaY] [float] NOT NULL,
[DeltaZ] [float] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Asset_Landmark] ADD CONSTRAINT [PK_Asset_Landmark] PRIMARY KEY NONCLUSTERED ([Id]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Asset_Landmark] ADD CONSTRAINT [FK_Asset_Landmark_Asset] FOREIGN KEY ([AssetId]) REFERENCES [dbo].[Asset] ([Id])
GO
ALTER TABLE [dbo].[Asset_Landmark] ADD CONSTRAINT [FK_Asset_Landmark_Landmark] FOREIGN KEY ([LandmarkId]) REFERENCES [dbo].[Landmark] ([Id])
GO
