CREATE TABLE [dbo].[Asset]
(
[Id] [uniqueidentifier] NOT NULL,
[Name] [nvarchar] (4000) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Number] [nvarchar] (4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Comments] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AssetTypeId] [uniqueidentifier] NOT NULL,
[IsActive] [bit] NOT NULL,
[LastModified] [smalldatetime] NULL,
[UserId] [uniqueidentifier] NULL,
[PhotoFileName] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[GeographicalPolygon] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[GeographicalPolyline] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Longitude] [float] NULL,
[Latitude] [float] NULL,
[FatherId] [uniqueidentifier] NULL,
[DataLoggerName] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[EversenseFolderName] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[GeographyId] [uniqueidentifier] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Asset] ADD CONSTRAINT [PK_Asset] PRIMARY KEY NONCLUSTERED ([Id]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Asset] ADD CONSTRAINT [FK_Asset_Asset] FOREIGN KEY ([FatherId]) REFERENCES [dbo].[Asset] ([Id])
GO
ALTER TABLE [dbo].[Asset] ADD CONSTRAINT [FK_Asset_AssetType] FOREIGN KEY ([AssetTypeId]) REFERENCES [dbo].[AssetType] ([Id])
GO
ALTER TABLE [dbo].[Asset] ADD CONSTRAINT [FK_Asset_User] FOREIGN KEY ([UserId]) REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[Asset] ADD CONSTRAINT [FK__Asset__IdGeograp__5026DB83] FOREIGN KEY ([GeographyId]) REFERENCES [dbo].[Geography] ([Id])
GO
EXEC sp_addextendedproperty N'MS_Description', N'Deprecated BA5.', 'SCHEMA', N'dbo', 'TABLE', N'Asset', 'COLUMN', N'GeographicalPolygon'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Deprecated BA5.', 'SCHEMA', N'dbo', 'TABLE', N'Asset', 'COLUMN', N'GeographicalPolyline'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Unique identifier of the asset', 'SCHEMA', N'dbo', 'TABLE', N'Asset', 'COLUMN', N'Id'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Store the date of the last modification', 'SCHEMA', N'dbo', 'TABLE', N'Asset', 'COLUMN', N'LastModified'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Deprecated BA5.', 'SCHEMA', N'dbo', 'TABLE', N'Asset', 'COLUMN', N'Latitude'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Deprecated BA5.', 'SCHEMA', N'dbo', 'TABLE', N'Asset', 'COLUMN', N'Longitude'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Store the name of the asset', 'SCHEMA', N'dbo', 'TABLE', N'Asset', 'COLUMN', N'Name'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Store the number of the asset', 'SCHEMA', N'dbo', 'TABLE', N'Asset', 'COLUMN', N'Number'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Store the filename of the asset main photo', 'SCHEMA', N'dbo', 'TABLE', N'Asset', 'COLUMN', N'PhotoFileName'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Store the id of the user who made the last modification', 'SCHEMA', N'dbo', 'TABLE', N'Asset', 'COLUMN', N'UserId'
GO
