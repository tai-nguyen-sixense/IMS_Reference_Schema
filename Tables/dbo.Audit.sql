CREATE TABLE [dbo].[Audit]
(
[Id] [uniqueidentifier] NOT NULL,
[AssetId] [uniqueidentifier] NOT NULL,
[InspectionId] [uniqueidentifier] NULL,
[ActivityId] [uniqueidentifier] NULL,
[AuditTypeId] [uniqueidentifier] NOT NULL,
[AuditDate] [datetime] NOT NULL,
[Comments] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AuditorId] [uniqueidentifier] NOT NULL,
[LastModified] [smalldatetime] NOT NULL,
[UserId] [uniqueidentifier] NOT NULL,
[AuditStatusId] [uniqueidentifier] NOT NULL,
[AssetComponentId] [uniqueidentifier] NULL,
[Number] [nvarchar] (4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Name] [nvarchar] (4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[EstimatedTime] [bigint] NULL,
[ActualTime] [bigint] NULL,
[GeographyId] [uniqueidentifier] NULL,
[SurveyId] [uniqueidentifier] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Audit] ADD CONSTRAINT [PK_Audit] PRIMARY KEY NONCLUSTERED ([Id]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Audit] ADD CONSTRAINT [FK_Audit_Activity] FOREIGN KEY ([ActivityId]) REFERENCES [dbo].[Activity] ([Id])
GO
ALTER TABLE [dbo].[Audit] ADD CONSTRAINT [FK_Audit_Asset] FOREIGN KEY ([AssetId]) REFERENCES [dbo].[Asset] ([Id])
GO
ALTER TABLE [dbo].[Audit] ADD CONSTRAINT [FK_Audit_AssetComponent] FOREIGN KEY ([AssetComponentId]) REFERENCES [dbo].[AssetComponent] ([Id])
GO
ALTER TABLE [dbo].[Audit] ADD CONSTRAINT [FK_Audit_AuditStatus] FOREIGN KEY ([AuditStatusId]) REFERENCES [dbo].[AuditStatus] ([Id])
GO
ALTER TABLE [dbo].[Audit] ADD CONSTRAINT [FK_Audit_AuditType] FOREIGN KEY ([AuditTypeId]) REFERENCES [dbo].[AuditType] ([Id])
GO
ALTER TABLE [dbo].[Audit] ADD CONSTRAINT [FK_Audit_Inspection] FOREIGN KEY ([InspectionId]) REFERENCES [dbo].[Inspection] ([Id])
GO
ALTER TABLE [dbo].[Audit] ADD CONSTRAINT [FK_Audit_User] FOREIGN KEY ([UserId]) REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[Audit] ADD CONSTRAINT [FK_Audit_UserAuditor] FOREIGN KEY ([AuditorId]) REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[Audit] ADD CONSTRAINT [FK__Audit__IdGeograp__12E8C319] FOREIGN KEY ([GeographyId]) REFERENCES [dbo].[Geography] ([Id])
GO
ALTER TABLE [dbo].[Audit] ADD CONSTRAINT [FK__Audit__SurveyId__13DCE752] FOREIGN KEY ([SurveyId]) REFERENCES [dbo].[Survey] ([Id])
GO
