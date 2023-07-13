CREATE TABLE [dbo].[Activity]
(
[Id] [uniqueidentifier] NOT NULL,
[ActivityTypeId] [uniqueidentifier] NOT NULL,
[AssetId] [uniqueidentifier] NOT NULL,
[InspectionId] [uniqueidentifier] NULL,
[ComponentTypeId] [uniqueidentifier] NULL,
[AssetComponentId] [uniqueidentifier] NULL,
[ContractId] [uniqueidentifier] NULL,
[Comments] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ActivityStatusId] [uniqueidentifier] NULL,
[ActivityPriorityId] [uniqueidentifier] NULL,
[LastModified] [smalldatetime] NOT NULL,
[UserId] [uniqueidentifier] NOT NULL,
[Name] [nvarchar] (4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Number] [nvarchar] (4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AuthorId] [uniqueidentifier] NOT NULL,
[ToScheduleIn] [int] NULL,
[DateFrom] [datetime] NULL,
[DateTo] [datetime] NULL,
[EstimatedCost] [float] NULL,
[RealCost] [float] NULL,
[EstimatedTime] [bigint] NULL,
[ActualTime] [bigint] NULL,
[GeographyId] [uniqueidentifier] NULL,
[SurveyId] [uniqueidentifier] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Activity] ADD CONSTRAINT [PK_Activity] PRIMARY KEY NONCLUSTERED ([Id]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Activity] ADD CONSTRAINT [FK_Activity_ActivityPriority] FOREIGN KEY ([ActivityPriorityId]) REFERENCES [dbo].[ActivityPriority] ([Id])
GO
ALTER TABLE [dbo].[Activity] ADD CONSTRAINT [FK_Activity_ActivityStatus] FOREIGN KEY ([ActivityStatusId]) REFERENCES [dbo].[ActivityStatus] ([Id])
GO
ALTER TABLE [dbo].[Activity] ADD CONSTRAINT [FK_Activity_ActivityType] FOREIGN KEY ([ActivityTypeId]) REFERENCES [dbo].[ActivityType] ([Id])
GO
ALTER TABLE [dbo].[Activity] ADD CONSTRAINT [FK_Activity_Asset] FOREIGN KEY ([AssetId]) REFERENCES [dbo].[Asset] ([Id])
GO
ALTER TABLE [dbo].[Activity] ADD CONSTRAINT [FK_Activity_AssetComponent] FOREIGN KEY ([AssetComponentId]) REFERENCES [dbo].[AssetComponent] ([Id])
GO
ALTER TABLE [dbo].[Activity] ADD CONSTRAINT [FK_Activity_ComponentType] FOREIGN KEY ([ComponentTypeId]) REFERENCES [dbo].[ComponentType] ([Id])
GO
ALTER TABLE [dbo].[Activity] ADD CONSTRAINT [FK_Activity_Contract] FOREIGN KEY ([ContractId]) REFERENCES [dbo].[Contract] ([Id])
GO
ALTER TABLE [dbo].[Activity] ADD CONSTRAINT [FK_Activity_Inspection] FOREIGN KEY ([InspectionId]) REFERENCES [dbo].[Inspection] ([Id])
GO
ALTER TABLE [dbo].[Activity] ADD CONSTRAINT [FK_Activity_User] FOREIGN KEY ([UserId]) REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[Activity] ADD CONSTRAINT [FK_Activity_User1] FOREIGN KEY ([AuthorId]) REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[Activity] ADD CONSTRAINT [FK__Activity__IdGeog__16EE5E27] FOREIGN KEY ([GeographyId]) REFERENCES [dbo].[Geography] ([Id])
GO
ALTER TABLE [dbo].[Activity] ADD CONSTRAINT [FK__Activity__Survey__17E28260] FOREIGN KEY ([SurveyId]) REFERENCES [dbo].[Survey] ([Id])
GO
