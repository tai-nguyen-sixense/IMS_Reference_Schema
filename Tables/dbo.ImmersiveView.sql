CREATE TABLE [dbo].[ImmersiveView]
(
[Id] [uniqueidentifier] NOT NULL,
[InspectionId] [uniqueidentifier] NOT NULL,
[AssetComponentId] [uniqueidentifier] NULL,
[Name] [nvarchar] (400) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Description] [nvarchar] (400) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Filename] [nvarchar] (1000) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Options] [nvarchar] (1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[MeshOffset] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ImmersiveView] ADD CONSTRAINT [PK_ImmersiveView] PRIMARY KEY NONCLUSTERED ([Id]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ImmersiveView] ADD CONSTRAINT [FK_ImmersiveView_AssetComponent] FOREIGN KEY ([AssetComponentId]) REFERENCES [dbo].[AssetComponent] ([Id])
GO
ALTER TABLE [dbo].[ImmersiveView] ADD CONSTRAINT [FK_ImmersiveView_Inspection] FOREIGN KEY ([InspectionId]) REFERENCES [dbo].[Inspection] ([Id])
GO
