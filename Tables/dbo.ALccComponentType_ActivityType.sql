CREATE TABLE [dbo].[ALccComponentType_ActivityType]
(
[ComponentTypeId] [uniqueidentifier] NOT NULL,
[ActivityTypeId] [uniqueidentifier] NOT NULL,
[UnitCost] [float] NOT NULL,
[LumpSumCost] [float] NOT NULL,
[TriggerCondition1] [float] NULL,
[TriggerCondition2] [float] NULL,
[TriggerCondition3] [float] NULL,
[TriggerCondition4] [float] NULL,
[TargetCondition1] [float] NULL,
[TargetCondition2] [float] NULL,
[TargetCondition3] [float] NULL,
[TargetCondition4] [float] NULL,
[TriggerCondition1Sup] [float] NULL CONSTRAINT [TriggerCondition1Sup] DEFAULT ((0)),
[TriggerCondition2Sup] [float] NULL CONSTRAINT [TriggerCondition2Sup] DEFAULT ((0)),
[TriggerCondition3Sup] [float] NULL CONSTRAINT [TriggerCondition3Sup] DEFAULT ((0)),
[TriggerCondition4Sup] [float] NULL CONSTRAINT [TriggerCondition4Sup] DEFAULT ((0)),
[TriggerValue] [float] NULL CONSTRAINT [TriggerValue] DEFAULT ((0)),
[TriggerValueSup] [float] NULL CONSTRAINT [TriggerValueSup] DEFAULT ((0)),
[TargetValue] [float] NULL CONSTRAINT [TargetValue] DEFAULT ((0)),
[IsActive] [bit] NOT NULL CONSTRAINT [DF__ALccCompo__IsAct__73A521EA] DEFAULT ('1')
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ALccComponentType_ActivityType] ADD CONSTRAINT [PK_ALccComponentType_ActivityType] PRIMARY KEY NONCLUSTERED ([ComponentTypeId], [ActivityTypeId]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ALccComponentType_ActivityType] ADD CONSTRAINT [FK_ALccComponentType_ActivityType_ActivityType] FOREIGN KEY ([ActivityTypeId]) REFERENCES [dbo].[ActivityType] ([Id])
GO
ALTER TABLE [dbo].[ALccComponentType_ActivityType] ADD CONSTRAINT [FK_ALccComponentType_ActivityType_ComponentType] FOREIGN KEY ([ComponentTypeId]) REFERENCES [dbo].[ComponentType] ([Id])
GO
