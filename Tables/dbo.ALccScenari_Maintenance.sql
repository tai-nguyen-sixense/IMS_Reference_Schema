CREATE TABLE [dbo].[ALccScenari_Maintenance]
(
[ALccScenariId] [uniqueidentifier] NOT NULL,
[ALccMaintenanceId] [uniqueidentifier] NOT NULL,
[AssetId] [uniqueidentifier] NOT NULL,
[ComponentTypeId] [uniqueidentifier] NOT NULL,
[Cost] [float] NOT NULL,
[Comments] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ALccScenari_Maintenance] ADD CONSTRAINT [PK_ALccScenari_Maintenance] PRIMARY KEY NONCLUSTERED ([ALccScenariId], [ALccMaintenanceId], [AssetId], [ComponentTypeId]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ALccScenari_Maintenance] ADD CONSTRAINT [FK_ALccScenari_Maintenance_ALccMaintenance] FOREIGN KEY ([ALccMaintenanceId]) REFERENCES [dbo].[ALccMaintenance] ([Id])
GO
ALTER TABLE [dbo].[ALccScenari_Maintenance] ADD CONSTRAINT [FK_ALccScenari_Maintenance_ALccScenari] FOREIGN KEY ([ALccScenariId]) REFERENCES [dbo].[ALccScenari] ([Id])
GO
ALTER TABLE [dbo].[ALccScenari_Maintenance] ADD CONSTRAINT [FK_ALccScenari_Maintenance_Asset] FOREIGN KEY ([AssetId]) REFERENCES [dbo].[Asset] ([Id])
GO
ALTER TABLE [dbo].[ALccScenari_Maintenance] ADD CONSTRAINT [FK_ALccScenari_Maintenance_ComponentType] FOREIGN KEY ([ComponentTypeId]) REFERENCES [dbo].[ComponentType] ([Id])
GO
