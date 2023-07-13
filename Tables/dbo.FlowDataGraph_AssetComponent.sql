CREATE TABLE [dbo].[FlowDataGraph_AssetComponent]
(
[FlowDataGraphId] [uniqueidentifier] NOT NULL,
[AssetComponentId] [uniqueidentifier] NOT NULL,
[Comments] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[MarkerType] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[RenderAs] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Color] [nvarchar] (4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ShowUncertainty] [bit] NOT NULL,
[ShowThresholds] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ShowHistoricalMaxMin] [float] NULL,
[ShowTrendLines] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Position] [int] NOT NULL,
[Scale] [nvarchar] (2) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[FlowDataGraph_AssetComponent] ADD CONSTRAINT [PK_FlowDataGraph_AssetComponent] PRIMARY KEY NONCLUSTERED ([FlowDataGraphId], [AssetComponentId]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[FlowDataGraph_AssetComponent] ADD CONSTRAINT [FK_FlowDataGraph_AssetComponent_AssetComponent] FOREIGN KEY ([AssetComponentId]) REFERENCES [dbo].[AssetComponent] ([Id])
GO
ALTER TABLE [dbo].[FlowDataGraph_AssetComponent] ADD CONSTRAINT [FK_FlowDataGraph_AssetComponent_FlowDataGraph] FOREIGN KEY ([FlowDataGraphId]) REFERENCES [dbo].[FlowDataGraph] ([Id])
GO
