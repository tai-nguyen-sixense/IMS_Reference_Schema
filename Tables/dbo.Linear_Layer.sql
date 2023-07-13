CREATE TABLE [dbo].[Linear_Layer]
(
[Id] [uniqueidentifier] NOT NULL,
[AssetId] [uniqueidentifier] NOT NULL,
[Linear_LayerTypeId] [uniqueidentifier] NOT NULL,
[Thickness] [float] NOT NULL,
[Comments] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[PositionXBegin] [float] NOT NULL,
[PositionXEnd] [float] NOT NULL,
[PositionYBegin] [float] NOT NULL,
[PositionYEnd] [float] NOT NULL,
[OrderZ] [int] NOT NULL,
[CreationDate] [datetime] NOT NULL,
[UserId] [uniqueidentifier] NOT NULL,
[LastModified] [datetime] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Linear_Layer] ADD CONSTRAINT [PK_Linear_Layer] PRIMARY KEY NONCLUSTERED ([Id]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Linear_Layer] ADD CONSTRAINT [FK_Linear_Layer_Asset] FOREIGN KEY ([AssetId]) REFERENCES [dbo].[Asset] ([Id])
GO
ALTER TABLE [dbo].[Linear_Layer] ADD CONSTRAINT [FK_Linear_Layer_Linear_LayerType] FOREIGN KEY ([Linear_LayerTypeId]) REFERENCES [dbo].[Linear_LayerType] ([Id])
GO
ALTER TABLE [dbo].[Linear_Layer] ADD CONSTRAINT [FK_Linear_Layer_User] FOREIGN KEY ([UserId]) REFERENCES [dbo].[User] ([Id])
GO
