CREATE TABLE [dbo].[FlowData_1m_NS]
(
[AssetComponentId] [uniqueidentifier] NOT NULL,
[Date] [datetime] NOT NULL,
[Value] [float] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[FlowData_1m_NS] ADD CONSTRAINT [PK_FlowData_1m_NS] PRIMARY KEY CLUSTERED ([AssetComponentId], [Date]) WITH (FILLFACTOR=80, PAD_INDEX=ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[FlowData_1m_NS] ADD CONSTRAINT [FK_FlowData_1m_NS_AssetComponent] FOREIGN KEY ([AssetComponentId]) REFERENCES [dbo].[AssetComponent] ([Id])
GO
