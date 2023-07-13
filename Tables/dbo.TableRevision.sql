CREATE TABLE [dbo].[TableRevision]
(
[Id] [uniqueidentifier] NOT NULL,
[Name] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[FatherId] [uniqueidentifier] NULL,
[TableId] [uniqueidentifier] NOT NULL,
[AssetId] [uniqueidentifier] NULL,
[InspectionId] [uniqueidentifier] NULL,
[FlagId] [uniqueidentifier] NULL,
[AuditId] [uniqueidentifier] NULL,
[ActivityId] [uniqueidentifier] NULL,
[TaskOrderId] [uniqueidentifier] NULL,
[Date] [datetime] NOT NULL,
[LastModified] [datetime] NOT NULL,
[UserId] [uniqueidentifier] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[TableRevision] ADD CONSTRAINT [PK_TableRevision] PRIMARY KEY CLUSTERED ([Id]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[TableRevision] ADD CONSTRAINT [FK_TableRevision_Activity] FOREIGN KEY ([ActivityId]) REFERENCES [dbo].[Activity] ([Id])
GO
ALTER TABLE [dbo].[TableRevision] ADD CONSTRAINT [FK_TableRevision_Asset] FOREIGN KEY ([AssetId]) REFERENCES [dbo].[Asset] ([Id])
GO
ALTER TABLE [dbo].[TableRevision] ADD CONSTRAINT [FK_TableRevision_Audit] FOREIGN KEY ([AuditId]) REFERENCES [dbo].[Audit] ([Id])
GO
ALTER TABLE [dbo].[TableRevision] ADD CONSTRAINT [FK_TableRevision_Flag] FOREIGN KEY ([FlagId]) REFERENCES [dbo].[Flag] ([Id])
GO
ALTER TABLE [dbo].[TableRevision] ADD CONSTRAINT [FK_TableRevision_Inspection] FOREIGN KEY ([InspectionId]) REFERENCES [dbo].[Inspection] ([Id])
GO
ALTER TABLE [dbo].[TableRevision] ADD CONSTRAINT [FK_TableRevision_TableDefinition] FOREIGN KEY ([TableId]) REFERENCES [dbo].[TableDefinition] ([Id])
GO
ALTER TABLE [dbo].[TableRevision] ADD CONSTRAINT [FK_TableRevision_TableRevision] FOREIGN KEY ([FatherId]) REFERENCES [dbo].[TableRevision] ([Id])
GO
ALTER TABLE [dbo].[TableRevision] ADD CONSTRAINT [FK_TableRevision_TaskOrder] FOREIGN KEY ([TaskOrderId]) REFERENCES [dbo].[TaskOrder] ([Id])
GO
ALTER TABLE [dbo].[TableRevision] ADD CONSTRAINT [FK_TableRevision_User] FOREIGN KEY ([UserId]) REFERENCES [dbo].[User] ([Id])
GO
