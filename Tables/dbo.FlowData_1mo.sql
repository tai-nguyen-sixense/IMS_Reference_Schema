CREATE TABLE [dbo].[FlowData_1mo]
(
[AssetComponentId] [uniqueidentifier] NOT NULL,
[Date] [datetime] NOT NULL,
[Value] [float] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[FlowData_1mo] ADD CONSTRAINT [PK_FlowData_1mo] PRIMARY KEY CLUSTERED ([AssetComponentId], [Date]) WITH (FILLFACTOR=80, PAD_INDEX=ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[FlowData_1mo] ADD CONSTRAINT [FK_FlowData_1mo_AssetComponent] FOREIGN KEY ([AssetComponentId]) REFERENCES [dbo].[AssetComponent] ([Id])
GO
