CREATE TABLE [dbo].[AssetComponent]
(
[Id] [uniqueidentifier] NOT NULL,
[Name] [nvarchar] (4000) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Number] [nvarchar] (4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Comments] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ComponentTypeId] [uniqueidentifier] NOT NULL,
[FatherId] [uniqueidentifier] NULL,
[AssetId] [uniqueidentifier] NOT NULL,
[IsActive] [bit] NOT NULL,
[Position] [int] NOT NULL,
[LastModified] [datetime] NOT NULL,
[UserId] [uniqueidentifier] NOT NULL,
[AuthorId] [uniqueidentifier] NOT NULL,
[MaterialId] [uniqueidentifier] NULL,
[EvsFileType] [nvarchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[EvsSystemUnitId] [uniqueidentifier] NULL,
[GeographicalPolygon] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[GeographicalPolyline] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Longitude] [float] NULL,
[Latitude] [float] NULL,
[UncertaintyAbsolute] [float] NULL,
[UncertaintyPercentage] [float] NULL,
[GeographyId] [uniqueidentifier] NULL,
[PhotoFileName] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[DateDeactivated] [smalldatetime] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AssetComponent] ADD CONSTRAINT [PK_AssetComponent] PRIMARY KEY NONCLUSTERED ([Id]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AssetComponent] ADD CONSTRAINT [FK_AssetComponent_Asset] FOREIGN KEY ([AssetId]) REFERENCES [dbo].[Asset] ([Id])
GO
ALTER TABLE [dbo].[AssetComponent] ADD CONSTRAINT [FK_AssetComponent_ComponentType] FOREIGN KEY ([ComponentTypeId]) REFERENCES [dbo].[ComponentType] ([Id])
GO
ALTER TABLE [dbo].[AssetComponent] ADD CONSTRAINT [FK_AssetComponent_Material] FOREIGN KEY ([MaterialId]) REFERENCES [dbo].[Material] ([Id])
GO
ALTER TABLE [dbo].[AssetComponent] ADD CONSTRAINT [FK_AssetComponent_SystemUnit] FOREIGN KEY ([EvsSystemUnitId]) REFERENCES [dbo].[SystemUnit] ([Id])
GO
ALTER TABLE [dbo].[AssetComponent] ADD CONSTRAINT [FK_AssetComponent_User] FOREIGN KEY ([UserId]) REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[AssetComponent] ADD CONSTRAINT [FK_AssetComponent_User1] FOREIGN KEY ([AuthorId]) REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[AssetComponent] ADD CONSTRAINT [FK_AssetComponentChild_AssetComponentFather] FOREIGN KEY ([FatherId]) REFERENCES [dbo].[AssetComponent] ([Id])
GO
ALTER TABLE [dbo].[AssetComponent] ADD CONSTRAINT [FK__AssetComp__IdGeo__68F2894D] FOREIGN KEY ([GeographyId]) REFERENCES [dbo].[Geography] ([Id])
GO
