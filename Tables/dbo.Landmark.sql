CREATE TABLE [dbo].[Landmark]
(
[Id] [uniqueidentifier] NOT NULL,
[AssetId] [uniqueidentifier] NOT NULL,
[Name] [nvarchar] (4000) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Longitude] [float] NULL,
[Latitude] [float] NULL,
[Altitude] [float] NULL,
[PositionX] [float] NOT NULL,
[PositionY] [float] NOT NULL,
[PositionZ] [float] NOT NULL,
[UserId] [uniqueidentifier] NOT NULL,
[LastModified] [datetime] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Landmark] ADD CONSTRAINT [PK_Landmark] PRIMARY KEY NONCLUSTERED ([Id]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Landmark] ADD CONSTRAINT [FK_Landmark_Landmark] FOREIGN KEY ([AssetId]) REFERENCES [dbo].[Asset] ([Id])
GO
