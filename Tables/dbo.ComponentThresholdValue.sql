CREATE TABLE [dbo].[ComponentThresholdValue]
(
[AssetComponentId] [uniqueidentifier] NOT NULL,
[ThresholdId] [uniqueidentifier] NOT NULL,
[Value] [float] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ComponentThresholdValue] ADD CONSTRAINT [PK_ComponentThresholdValue] PRIMARY KEY NONCLUSTERED ([AssetComponentId], [ThresholdId]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ComponentThresholdValue] ADD CONSTRAINT [FK_ComponentThresholdValue_AssetComponent] FOREIGN KEY ([AssetComponentId]) REFERENCES [dbo].[AssetComponent] ([Id])
GO
ALTER TABLE [dbo].[ComponentThresholdValue] ADD CONSTRAINT [FK_ComponentThresholdValue_Threshold] FOREIGN KEY ([ThresholdId]) REFERENCES [dbo].[Threshold] ([Id])
GO
