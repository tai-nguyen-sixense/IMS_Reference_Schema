CREATE TABLE [dbo].[FlowData]
(
[AssetComponentId] [uniqueidentifier] NOT NULL,
[Date] [datetime] NOT NULL,
[Value] [float] NULL,
[Comments] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[LastModified] [smalldatetime] NOT NULL,
[UserId] [uniqueidentifier] NOT NULL,
[AuditId] [uniqueidentifier] NULL,
[FlowDataStatusId] [uniqueidentifier] NOT NULL,
[IsValid] [int] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[FlowData] ADD CONSTRAINT [PK_FlowData] PRIMARY KEY NONCLUSTERED ([AssetComponentId], [Date]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[FlowData] ADD CONSTRAINT [FK_FlowData_AssetComponent] FOREIGN KEY ([AssetComponentId]) REFERENCES [dbo].[AssetComponent] ([Id])
GO
ALTER TABLE [dbo].[FlowData] ADD CONSTRAINT [FK_FlowData_Audit] FOREIGN KEY ([AuditId]) REFERENCES [dbo].[Audit] ([Id])
GO
ALTER TABLE [dbo].[FlowData] ADD CONSTRAINT [FK_FlowData_FlowDataStatus] FOREIGN KEY ([FlowDataStatusId]) REFERENCES [dbo].[FlowDataStatus] ([Id])
GO
ALTER TABLE [dbo].[FlowData] ADD CONSTRAINT [FK_FlowData_User] FOREIGN KEY ([UserId]) REFERENCES [dbo].[User] ([Id])
GO
