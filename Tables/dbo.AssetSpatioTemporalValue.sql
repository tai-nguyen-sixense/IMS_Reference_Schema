CREATE TABLE [dbo].[AssetSpatioTemporalValue]
(
[Id] [uniqueidentifier] NOT NULL,
[AssetId] [uniqueidentifier] NOT NULL,
[AttributeFieldId] [uniqueidentifier] NOT NULL,
[Value] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Comments] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[LastModified] [datetime] NOT NULL,
[UserId] [uniqueidentifier] NOT NULL,
[ValueNumeric] [float] NOT NULL,
[DateSubmitted] [datetime] NOT NULL,
[LandmarkBeginId] [uniqueidentifier] NOT NULL,
[DeltaBeginX] [float] NOT NULL,
[LandmarkEndId] [uniqueidentifier] NULL,
[DeltaEndX] [float] NOT NULL,
[GeographyId] [uniqueidentifier] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AssetSpatioTemporalValue] ADD CONSTRAINT [PK_AssetSpatioTemporalValue] PRIMARY KEY NONCLUSTERED ([Id]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AssetSpatioTemporalValue] ADD CONSTRAINT [FK_AssetSpatioTemporalValue_Asset] FOREIGN KEY ([AssetId]) REFERENCES [dbo].[Asset] ([Id])
GO
ALTER TABLE [dbo].[AssetSpatioTemporalValue] ADD CONSTRAINT [FK_AssetSpatioTemporalValue_AttributeField] FOREIGN KEY ([AttributeFieldId]) REFERENCES [dbo].[AttributeField] ([Id])
GO
ALTER TABLE [dbo].[AssetSpatioTemporalValue] ADD CONSTRAINT [FK_AssetSpatioTemporalValue_LandmarkBegin] FOREIGN KEY ([LandmarkBeginId]) REFERENCES [dbo].[Landmark] ([Id])
GO
ALTER TABLE [dbo].[AssetSpatioTemporalValue] ADD CONSTRAINT [FK_AssetSpatioTemporalValue_LandmarkEnd] FOREIGN KEY ([LandmarkEndId]) REFERENCES [dbo].[Landmark] ([Id])
GO
ALTER TABLE [dbo].[AssetSpatioTemporalValue] ADD CONSTRAINT [FK__AssetSpat__IdGeo__7834CCDD] FOREIGN KEY ([GeographyId]) REFERENCES [dbo].[Geography] ([Id])
GO
