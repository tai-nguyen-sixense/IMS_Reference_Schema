CREATE TABLE [dbo].[ALccScenari_ComponentType_ActivityType]
(
[ALccScenariId] [uniqueidentifier] NOT NULL,
[ComponentTypeId] [uniqueidentifier] NOT NULL,
[ActivityTypeId] [uniqueidentifier] NOT NULL,
[ALccMaintenanceId] [uniqueidentifier] NOT NULL,
[UnitCost] [float] NOT NULL,
[LumpSumCost] [float] NOT NULL,
[ToApplied] [bit] NOT NULL,
[TriggerCondition1] [float] NULL,
[TriggerCondition2] [float] NULL,
[TriggerCondition3] [float] NULL,
[TriggerCondition4] [float] NULL,
[TargetCondition1] [float] NULL,
[TargetCondition2] [float] NULL,
[TargetCondition3] [float] NULL,
[TargetCondition4] [float] NULL,
[HasBeenApplied] [bit] NOT NULL,
[CostActivities] [float] NULL,
[CostMaintenances] [float] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ALccScenari_ComponentType_ActivityType] ADD CONSTRAINT [PK_ALccScenari_ComponentType_ActivityType_1] PRIMARY KEY NONCLUSTERED ([ALccScenariId], [ComponentTypeId], [ActivityTypeId], [ALccMaintenanceId]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ALccScenari_ComponentType_ActivityType] ADD CONSTRAINT [FK_ALccScenari_ComponentType_ActivityType_ActivityType] FOREIGN KEY ([ActivityTypeId]) REFERENCES [dbo].[ActivityType] ([Id])
GO
ALTER TABLE [dbo].[ALccScenari_ComponentType_ActivityType] ADD CONSTRAINT [FK_ALccScenari_ComponentType_ActivityType_ALccMaintenance] FOREIGN KEY ([ALccMaintenanceId]) REFERENCES [dbo].[ALccMaintenance] ([Id])
GO
ALTER TABLE [dbo].[ALccScenari_ComponentType_ActivityType] ADD CONSTRAINT [FK_ALccScenari_ComponentType_ActivityType_ALccScenari] FOREIGN KEY ([ALccScenariId]) REFERENCES [dbo].[ALccScenari] ([Id])
GO
ALTER TABLE [dbo].[ALccScenari_ComponentType_ActivityType] ADD CONSTRAINT [FK_ALccScenari_ComponentType_ActivityType_ComponentType] FOREIGN KEY ([ComponentTypeId]) REFERENCES [dbo].[ComponentType] ([Id])
GO
