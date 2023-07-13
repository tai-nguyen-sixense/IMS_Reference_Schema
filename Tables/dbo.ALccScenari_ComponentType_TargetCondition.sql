CREATE TABLE [dbo].[ALccScenari_ComponentType_TargetCondition]
(
[ALccScenariId] [uniqueidentifier] NOT NULL,
[ComponentTypeId] [uniqueidentifier] NOT NULL,
[Condition1] [float] NULL,
[Condition2] [float] NULL,
[Condition3] [float] NULL,
[Condition4] [float] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ALccScenari_ComponentType_TargetCondition] ADD CONSTRAINT [PK_ALccScenari_ComponentType_TargetCondition] PRIMARY KEY NONCLUSTERED ([ALccScenariId], [ComponentTypeId]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ALccScenari_ComponentType_TargetCondition] ADD CONSTRAINT [FK_ALccScenari_ComponentType_TargetCondition_ALccScenari] FOREIGN KEY ([ALccScenariId]) REFERENCES [dbo].[ALccScenari] ([Id])
GO
ALTER TABLE [dbo].[ALccScenari_ComponentType_TargetCondition] ADD CONSTRAINT [FK_ALccScenari_ComponentType_TargetCondition_ComponentType] FOREIGN KEY ([ComponentTypeId]) REFERENCES [dbo].[ComponentType] ([Id])
GO
