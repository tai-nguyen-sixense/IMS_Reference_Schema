CREATE TABLE [dbo].[HomogeneousZone]
(
[Id] [uniqueidentifier] NOT NULL,
[HomogeneousZoneAnalysisId] [uniqueidentifier] NOT NULL,
[AssetId] [uniqueidentifier] NOT NULL,
[LandmarkBeginId] [uniqueidentifier] NOT NULL,
[DeltaBeginX] [float] NOT NULL,
[LandmarkEndId] [uniqueidentifier] NOT NULL,
[DeltaEndX] [float] NOT NULL,
[LastModified] [smalldatetime] NOT NULL,
[UserId] [uniqueidentifier] NOT NULL,
[Comments] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[HomogeneousZone] ADD CONSTRAINT [PK_HomogeneousZone] PRIMARY KEY NONCLUSTERED ([Id]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[HomogeneousZone] ADD CONSTRAINT [FK_HomogeneousZone_Asset] FOREIGN KEY ([AssetId]) REFERENCES [dbo].[Asset] ([Id])
GO
ALTER TABLE [dbo].[HomogeneousZone] ADD CONSTRAINT [FK_HomogeneousZone_HomogeneousZoneAnalysis] FOREIGN KEY ([HomogeneousZoneAnalysisId]) REFERENCES [dbo].[HomogeneousZoneAnalysis] ([Id])
GO
ALTER TABLE [dbo].[HomogeneousZone] ADD CONSTRAINT [FK_HomogeneousZone_LandmarkBegin] FOREIGN KEY ([LandmarkBeginId]) REFERENCES [dbo].[Landmark] ([Id])
GO
ALTER TABLE [dbo].[HomogeneousZone] ADD CONSTRAINT [FK_HomogeneousZone_LandmarkEnd] FOREIGN KEY ([LandmarkEndId]) REFERENCES [dbo].[Landmark] ([Id])
GO
ALTER TABLE [dbo].[HomogeneousZone] ADD CONSTRAINT [FK_HomogeneousZone_User] FOREIGN KEY ([UserId]) REFERENCES [dbo].[User] ([Id])
GO
