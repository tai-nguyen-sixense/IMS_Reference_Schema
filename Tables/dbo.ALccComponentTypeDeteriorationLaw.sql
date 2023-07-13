CREATE TABLE [dbo].[ALccComponentTypeDeteriorationLaw]
(
[Id] [uniqueidentifier] NOT NULL,
[Name] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[IsDefault] [bit] NOT NULL CONSTRAINT [DF__ALccCompo__IsDef__7B4643B2] DEFAULT ((0)),
[ComponentTypeId] [uniqueidentifier] NOT NULL,
[ALccMaintenanceId] [uniqueidentifier] NOT NULL,
[ALccProtectionId] [uniqueidentifier] NOT NULL,
[ALccEnvironmentId] [uniqueidentifier] NOT NULL,
[UnitCost] [float] NOT NULL,
[LumpSumCost] [float] NULL,
[CostStep] [float] NOT NULL,
[M11] [float] NULL,
[M12] [float] NULL,
[M13] [float] NULL,
[M14] [float] NULL,
[M21] [float] NULL,
[M22] [float] NULL,
[M23] [float] NULL,
[M24] [float] NULL,
[M31] [float] NULL,
[M32] [float] NULL,
[M33] [float] NULL,
[M34] [float] NULL,
[M41] [float] NULL,
[M42] [float] NULL,
[M43] [float] NULL,
[M44] [float] NULL,
[CS1HealthIndexWeight] [float] NOT NULL CONSTRAINT [DF__ALccCompo__CS1He__7C3A67EB] DEFAULT ((0)),
[CS2HealthIndexWeight] [float] NOT NULL CONSTRAINT [DF__ALccCompo__CS2He__7D2E8C24] DEFAULT ((0)),
[CS3HealthIndexWeight] [float] NOT NULL CONSTRAINT [DF__ALccCompo__CS3He__7E22B05D] DEFAULT ((0)),
[CS4HealthIndexWeight] [float] NOT NULL CONSTRAINT [DF__ALccCompo__CS4He__7F16D496] DEFAULT ((0))
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ALccComponentTypeDeteriorationLaw] ADD CONSTRAINT [PK_ALccComponentTypeDeteriorationLaw] PRIMARY KEY NONCLUSTERED ([Id]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ALccComponentTypeDeteriorationLaw] ADD CONSTRAINT [FK_ALccComponentTypeDeteriorationLaw_ALccEnvironment] FOREIGN KEY ([ALccEnvironmentId]) REFERENCES [dbo].[ALccEnvironment] ([Id])
GO
ALTER TABLE [dbo].[ALccComponentTypeDeteriorationLaw] ADD CONSTRAINT [FK_ALccComponentTypeDeteriorationLaw_ALccMaintenance] FOREIGN KEY ([ALccMaintenanceId]) REFERENCES [dbo].[ALccMaintenance] ([Id])
GO
ALTER TABLE [dbo].[ALccComponentTypeDeteriorationLaw] ADD CONSTRAINT [FK_ALccComponentTypeDeteriorationLaw_ALccProtection] FOREIGN KEY ([ALccProtectionId]) REFERENCES [dbo].[ALccProtection] ([Id])
GO
ALTER TABLE [dbo].[ALccComponentTypeDeteriorationLaw] ADD CONSTRAINT [FK_ALccComponentTypeDeteriorationLaw_ComponentType] FOREIGN KEY ([ComponentTypeId]) REFERENCES [dbo].[ComponentType] ([Id])
GO
