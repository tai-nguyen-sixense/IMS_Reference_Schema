CREATE TABLE [dbo].[FlowDataGraphAssetComponent_Threshold]
(
[FlowDataGraphId] [uniqueidentifier] NOT NULL,
[AssetComponentId] [uniqueidentifier] NOT NULL,
[ThresholdId] [uniqueidentifier] NOT NULL,
[Comments] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[FlowDataGraphAssetComponent_Threshold] ADD CONSTRAINT [PK_FlowDataGraphAssetComponent_Threshold] PRIMARY KEY NONCLUSTERED ([FlowDataGraphId], [AssetComponentId], [ThresholdId]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[FlowDataGraphAssetComponent_Threshold] ADD CONSTRAINT [FK_FlowDataGraphAssetComponent_Threshold_FlowDataGraph_AssetComponent] FOREIGN KEY ([FlowDataGraphId], [AssetComponentId]) REFERENCES [dbo].[FlowDataGraph_AssetComponent] ([FlowDataGraphId], [AssetComponentId])
GO
ALTER TABLE [dbo].[FlowDataGraphAssetComponent_Threshold] ADD CONSTRAINT [FK_FlowDataGraphAssetComponent_Threshold_Threshold] FOREIGN KEY ([ThresholdId]) REFERENCES [dbo].[Threshold] ([Id])
GO
