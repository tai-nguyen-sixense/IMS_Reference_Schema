CREATE TABLE [dbo].[ComponentType]
(
[Id] [uniqueidentifier] NOT NULL,
[Name] [nvarchar] (4000) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Number] [nvarchar] (4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[FatherId] [uniqueidentifier] NULL,
[Icon] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Color] [nvarchar] (4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Position] [int] NOT NULL,
[CostUnit] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[FieldToDisplayOnNavigationDrawing] [nvarchar] (128) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[IsMonitoringRelated] [bit] NOT NULL,
[IsTemporary] [bit] NOT NULL,
[PictureFileName] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[IsFlowDataRelated] [bit] NOT NULL,
[IsFlowDataAuditRelated] [bit] NOT NULL,
[UncertaintyAbsolute] [float] NULL,
[UncertaintyPercentage] [float] NULL,
[EvsSystemUnitId] [uniqueidentifier] NULL,
[ScaleAbsolute] [float] NULL,
[ScalePercentage] [float] NULL,
[NumberOfDecimal] [int] NULL,
[SMCanBeCreated] [bit] NOT NULL CONSTRAINT [DF_ComponentType_SMCanBeCreated] DEFAULT ((0))
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ComponentType] ADD CONSTRAINT [PK_ComponentType] PRIMARY KEY NONCLUSTERED ([Id]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ComponentType] ADD CONSTRAINT [FK_ComponentType_ComponentType] FOREIGN KEY ([FatherId]) REFERENCES [dbo].[ComponentType] ([Id])
GO
ALTER TABLE [dbo].[ComponentType] ADD CONSTRAINT [FK_ComponentType_SystemUnit] FOREIGN KEY ([EvsSystemUnitId]) REFERENCES [dbo].[SystemUnit] ([Id])
GO
