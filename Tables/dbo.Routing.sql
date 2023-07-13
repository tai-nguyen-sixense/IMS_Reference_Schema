CREATE TABLE [dbo].[Routing]
(
[Id] [uniqueidentifier] NOT NULL,
[UserIdFrom] [uniqueidentifier] NOT NULL,
[UserIdTo] [uniqueidentifier] NOT NULL,
[MailSent] [bit] NOT NULL,
[DateSent] [smalldatetime] NOT NULL,
[DateReceived] [smalldatetime] NULL,
[RoutingTypeId] [uniqueidentifier] NOT NULL,
[AssetId] [uniqueidentifier] NULL,
[InspectionId] [uniqueidentifier] NULL,
[InspectionStatusId] [uniqueidentifier] NULL,
[FlagId] [uniqueidentifier] NULL,
[FlagStatusId] [uniqueidentifier] NULL,
[ActivityId] [uniqueidentifier] NULL,
[ActivityStatusId] [uniqueidentifier] NULL,
[Comments] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[IsActive] [bit] NOT NULL,
[AuditId] [uniqueidentifier] NULL,
[AuditStatusId] [uniqueidentifier] NULL,
[TaskOrderId] [uniqueidentifier] NULL,
[TaskOrderStatusId] [uniqueidentifier] NULL,
[Position] [int] NOT NULL,
[DocumentRevisionId] [uniqueidentifier] NULL,
[DocumentRevisionStatusId] [uniqueidentifier] NULL,
[CCEmails] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Routing] ADD CONSTRAINT [PK_Routing] PRIMARY KEY NONCLUSTERED ([Id]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_Routing_ActivityId] ON [dbo].[Routing] ([ActivityId]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_Routing_AuditId] ON [dbo].[Routing] ([AuditId]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_Routing_DocumentRevisionId] ON [dbo].[Routing] ([DocumentRevisionId]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_Routing_FlagId] ON [dbo].[Routing] ([FlagId]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_Routing_InspectionId] ON [dbo].[Routing] ([InspectionId]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_Routing_TaskOrderId] ON [dbo].[Routing] ([TaskOrderId]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Routing] ADD CONSTRAINT [FK_Routing_Activity] FOREIGN KEY ([ActivityId]) REFERENCES [dbo].[Activity] ([Id])
GO
ALTER TABLE [dbo].[Routing] ADD CONSTRAINT [FK_Routing_ActivityStatus] FOREIGN KEY ([ActivityStatusId]) REFERENCES [dbo].[ActivityStatus] ([Id])
GO
ALTER TABLE [dbo].[Routing] ADD CONSTRAINT [FK_Routing_Asset] FOREIGN KEY ([AssetId]) REFERENCES [dbo].[Asset] ([Id])
GO
ALTER TABLE [dbo].[Routing] ADD CONSTRAINT [FK_Routing_Audit] FOREIGN KEY ([AuditId]) REFERENCES [dbo].[Audit] ([Id])
GO
ALTER TABLE [dbo].[Routing] ADD CONSTRAINT [FK_Routing_AuditStatus] FOREIGN KEY ([AuditStatusId]) REFERENCES [dbo].[AuditStatus] ([Id])
GO
ALTER TABLE [dbo].[Routing] ADD CONSTRAINT [FK_Routing_DocumentRevision] FOREIGN KEY ([DocumentRevisionId]) REFERENCES [dbo].[DocumentRevision] ([Id])
GO
ALTER TABLE [dbo].[Routing] ADD CONSTRAINT [FK_Routing_DocumentRevisionStatus] FOREIGN KEY ([DocumentRevisionStatusId]) REFERENCES [dbo].[RevisionStatus] ([Id])
GO
ALTER TABLE [dbo].[Routing] ADD CONSTRAINT [FK_Routing_Flag] FOREIGN KEY ([FlagId]) REFERENCES [dbo].[Flag] ([Id])
GO
ALTER TABLE [dbo].[Routing] ADD CONSTRAINT [FK_Routing_FlagStatus] FOREIGN KEY ([FlagStatusId]) REFERENCES [dbo].[FlagStatus] ([Id])
GO
ALTER TABLE [dbo].[Routing] ADD CONSTRAINT [FK_Routing_Inspection] FOREIGN KEY ([InspectionId]) REFERENCES [dbo].[Inspection] ([Id])
GO
ALTER TABLE [dbo].[Routing] ADD CONSTRAINT [FK_Routing_InspectionStatus] FOREIGN KEY ([InspectionStatusId]) REFERENCES [dbo].[InspectionStatus] ([Id])
GO
ALTER TABLE [dbo].[Routing] ADD CONSTRAINT [FK_Routing_RoutingType] FOREIGN KEY ([RoutingTypeId]) REFERENCES [dbo].[RoutingType] ([Id])
GO
ALTER TABLE [dbo].[Routing] ADD CONSTRAINT [FK_Routing_TaskOrder] FOREIGN KEY ([TaskOrderId]) REFERENCES [dbo].[TaskOrder] ([Id])
GO
ALTER TABLE [dbo].[Routing] ADD CONSTRAINT [FK_Routing_TaskOrderStatus] FOREIGN KEY ([TaskOrderStatusId]) REFERENCES [dbo].[TaskOrderStatus] ([Id])
GO
ALTER TABLE [dbo].[Routing] ADD CONSTRAINT [FK_Routing_UserFrom] FOREIGN KEY ([UserIdFrom]) REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[Routing] ADD CONSTRAINT [FK_Routing_UserTo] FOREIGN KEY ([UserIdTo]) REFERENCES [dbo].[User] ([Id])
GO
