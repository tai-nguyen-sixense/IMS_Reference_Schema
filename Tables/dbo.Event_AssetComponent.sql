CREATE TABLE [dbo].[Event_AssetComponent]
(
[EventId] [uniqueidentifier] NOT NULL,
[AssetComponentId] [uniqueidentifier] NOT NULL,
[Date] [datetime2] NOT NULL,
[ThresholdValue] [float] NOT NULL,
[ThresholdId] [uniqueidentifier] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Event_AssetComponent] ADD CONSTRAINT [PK_Event_AssetComponent] PRIMARY KEY NONCLUSTERED ([EventId], [AssetComponentId], [Date]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Event_AssetComponent] ADD CONSTRAINT [FK_Event_AssetComponent_AssetComponent] FOREIGN KEY ([AssetComponentId]) REFERENCES [dbo].[AssetComponent] ([Id])
GO
ALTER TABLE [dbo].[Event_AssetComponent] ADD CONSTRAINT [FK_Event_AssetComponent_Event] FOREIGN KEY ([EventId]) REFERENCES [dbo].[Event] ([Id])
GO
ALTER TABLE [dbo].[Event_AssetComponent] ADD CONSTRAINT [FK_Event_AssetComponent_Threshold] FOREIGN KEY ([ThresholdId]) REFERENCES [dbo].[Threshold] ([Id])
GO
