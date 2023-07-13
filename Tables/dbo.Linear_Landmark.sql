CREATE TABLE [dbo].[Linear_Landmark]
(
[Id] [uniqueidentifier] NOT NULL,
[AssetId] [uniqueidentifier] NOT NULL,
[Name] [nvarchar] (4000) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Comments] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Position] [int] NOT NULL,
[Latitude] [float] NULL,
[Longitude] [float] NULL,
[Altitude] [float] NULL,
[PositionX] [float] NOT NULL,
[UserId] [uniqueidentifier] NOT NULL,
[LastModified] [datetime] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Linear_Landmark] ADD CONSTRAINT [PK_Linear_Landmark] PRIMARY KEY NONCLUSTERED ([Id]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Linear_Landmark] ADD CONSTRAINT [FK_Linear_Landmark_Asset] FOREIGN KEY ([AssetId]) REFERENCES [dbo].[Asset] ([Id])
GO
ALTER TABLE [dbo].[Linear_Landmark] ADD CONSTRAINT [FK_Linear_Landmark_User] FOREIGN KEY ([UserId]) REFERENCES [dbo].[User] ([Id])
GO
