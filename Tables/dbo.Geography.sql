CREATE TABLE [dbo].[Geography]
(
[Id] [uniqueidentifier] NOT NULL,
[Geo] [sys].[geography] NULL,
[GeoTexte] AS ([Geo].[STAsText]()),
[Longitude] [float] NULL,
[Latitude] [float] NULL,
[Polyline] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Polygon] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[FullAddress] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[StreetNumber] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Address] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AdditionalAddress] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[PostalCode] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Locality] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Area] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Country] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Geography] ADD CONSTRAINT [PK__Geograph__3214EC074A5D6A9A] PRIMARY KEY CLUSTERED ([Id]) ON [PRIMARY]
GO
EXEC sp_addextendedproperty N'MS_Description', N'Store the GIS position of an object (Asset, tasks, etc.)', 'SCHEMA', N'dbo', 'TABLE', N'Geography', 'COLUMN', N'Geo'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Store the text representation of the Geo field', 'SCHEMA', N'dbo', 'TABLE', N'Geography', 'COLUMN', N'GeoTexte'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Deprecated BA5.', 'SCHEMA', N'dbo', 'TABLE', N'Geography', 'COLUMN', N'Latitude'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Deprecated BA5.', 'SCHEMA', N'dbo', 'TABLE', N'Geography', 'COLUMN', N'Longitude'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Deprecated BA5.', 'SCHEMA', N'dbo', 'TABLE', N'Geography', 'COLUMN', N'Polygon'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Deprecated BA5.', 'SCHEMA', N'dbo', 'TABLE', N'Geography', 'COLUMN', N'Polyline'
GO
