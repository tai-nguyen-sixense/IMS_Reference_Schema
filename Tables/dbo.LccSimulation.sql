CREATE TABLE [dbo].[LccSimulation]
(
[Id] [uniqueidentifier] NOT NULL,
[AssetId] [uniqueidentifier] NOT NULL,
[RatingLawsSubScenario] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[MaintenanceCostSubScenario] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[ImportantFactorSubScenario] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[RepairCostSubScenario] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[MaintenanceTotalSurface] [numeric] (18, 2) NOT NULL,
[AssetFailureLevel] [numeric] (18, 2) NOT NULL,
[LccScenarioId] [uniqueidentifier] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[LccSimulation] ADD CONSTRAINT [PK_LccSimulation] PRIMARY KEY NONCLUSTERED ([Id]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[LccSimulation] ADD CONSTRAINT [FK_LccSimulation_Asset] FOREIGN KEY ([AssetId]) REFERENCES [dbo].[Asset] ([Id])
GO
ALTER TABLE [dbo].[LccSimulation] ADD CONSTRAINT [FK_LccSimulation_LccScenario] FOREIGN KEY ([LccScenarioId]) REFERENCES [dbo].[LccScenario] ([Id])
GO
