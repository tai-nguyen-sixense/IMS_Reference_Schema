CREATE TABLE [dbo].[Flag_AssetComponent_InspectionPoint]
(
[Id] [uniqueidentifier] NOT NULL,
[FlagId] [uniqueidentifier] NOT NULL,
[AssetComponentId] [uniqueidentifier] NOT NULL,
[InspectionPointId] [uniqueidentifier] NULL,
[InspectionPointCommentId] [uniqueidentifier] NULL,
[Position] [numeric] (18, 0) NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Flag_AssetComponent_InspectionPoint] ADD CONSTRAINT [PK_Flag_AssetComponent_InspectionPoint_1] PRIMARY KEY NONCLUSTERED ([Id]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_Flag_AssetComponent_InspectionPoint_InspectionPoint] ON [dbo].[Flag_AssetComponent_InspectionPoint] ([InspectionPointId]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Flag_AssetComponent_InspectionPoint] ADD CONSTRAINT [FK_Flag_AssetComponent_InspectionPoint_AssetComponent] FOREIGN KEY ([AssetComponentId]) REFERENCES [dbo].[AssetComponent] ([Id])
GO
ALTER TABLE [dbo].[Flag_AssetComponent_InspectionPoint] ADD CONSTRAINT [FK_Flag_AssetComponent_InspectionPoint_Flag] FOREIGN KEY ([FlagId]) REFERENCES [dbo].[Flag] ([Id])
GO
ALTER TABLE [dbo].[Flag_AssetComponent_InspectionPoint] ADD CONSTRAINT [FK_Flag_AssetComponent_InspectionPoint_InspectionPoint] FOREIGN KEY ([InspectionPointId]) REFERENCES [dbo].[InspectionPoint] ([Id])
GO
ALTER TABLE [dbo].[Flag_AssetComponent_InspectionPoint] ADD CONSTRAINT [FK_Flag_AssetComponent_InspectionPoint_InspectionPointComment] FOREIGN KEY ([InspectionPointCommentId]) REFERENCES [dbo].[InspectionPointComment] ([Id])
GO
