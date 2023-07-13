CREATE TABLE [dbo].[ActivityType]
(
[Id] [uniqueidentifier] NOT NULL,
[Name] [nvarchar] (4000) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Description] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[FatherId] [uniqueidentifier] NULL,
[Frequency] [float] NOT NULL,
[Icon] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Color] [nvarchar] (4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[UnitCost] [float] NOT NULL,
[LumpSumCost] [float] NOT NULL,
[CostFormula] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Position] [int] NOT NULL,
[IsLccRepair] [bit] NOT NULL,
[IsLccMaintenance] [bit] NOT NULL,
[Number] [nvarchar] (4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Code] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[SMInterface] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[IsLinear] [bit] NULL,
[IsRetired] [bit] NOT NULL CONSTRAINT [DF_ActivityType_IsRetired] DEFAULT ((0)),
[ManagementRestrictedTo] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ActivityType] ADD CONSTRAINT [PK_ActivityType] PRIMARY KEY NONCLUSTERED ([Id]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ActivityType] ADD CONSTRAINT [FK_ActivityType_ActivityType] FOREIGN KEY ([FatherId]) REFERENCES [dbo].[ActivityType] ([Id])
GO
