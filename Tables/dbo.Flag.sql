CREATE TABLE [dbo].[Flag]
(
[Id] [uniqueidentifier] NOT NULL,
[AssetId] [uniqueidentifier] NOT NULL,
[InspectionId] [uniqueidentifier] NULL,
[FlagTypeId] [uniqueidentifier] NOT NULL,
[Number] [nvarchar] (4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[FlagStatusId] [uniqueidentifier] NOT NULL,
[Comments] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[FlagDate] [smalldatetime] NOT NULL,
[AuthorId] [uniqueidentifier] NOT NULL,
[LastModified] [smalldatetime] NOT NULL,
[UserId] [uniqueidentifier] NOT NULL,
[PreviousInspectionFlagId] [uniqueidentifier] NULL,
[PriorityId] [uniqueidentifier] NULL,
[NumberBis] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CommentsBis] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[StatusBisId] [uniqueidentifier] NOT NULL,
[AuditId] [uniqueidentifier] NULL,
[ExcludeFromReport] [bit] NOT NULL,
[MainReviewerId] [uniqueidentifier] NULL,
[EstimatedTime] [bigint] NULL,
[ActualTime] [bigint] NULL,
[Longitude] [float] NULL,
[Latitude] [float] NULL,
[GeographyId] [uniqueidentifier] NULL,
[SurveyId] [uniqueidentifier] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Flag] ADD CONSTRAINT [PK_Flag] PRIMARY KEY NONCLUSTERED ([Id]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Flag] ADD CONSTRAINT [FK_Flag_Asset] FOREIGN KEY ([AssetId]) REFERENCES [dbo].[Asset] ([Id])
GO
ALTER TABLE [dbo].[Flag] ADD CONSTRAINT [FK_Flag_Audit] FOREIGN KEY ([AuditId]) REFERENCES [dbo].[Audit] ([Id])
GO
ALTER TABLE [dbo].[Flag] ADD CONSTRAINT [FK_Flag_Flag] FOREIGN KEY ([PreviousInspectionFlagId]) REFERENCES [dbo].[Flag] ([Id])
GO
ALTER TABLE [dbo].[Flag] ADD CONSTRAINT [FK_Flag_FlagPriority] FOREIGN KEY ([PriorityId]) REFERENCES [dbo].[FlagPriority] ([Id])
GO
ALTER TABLE [dbo].[Flag] ADD CONSTRAINT [FK_Flag_FlagStatus] FOREIGN KEY ([FlagStatusId]) REFERENCES [dbo].[FlagStatus] ([Id])
GO
ALTER TABLE [dbo].[Flag] ADD CONSTRAINT [FK_Flag_FlagStatusBis] FOREIGN KEY ([StatusBisId]) REFERENCES [dbo].[FlagStatusBis] ([Id])
GO
ALTER TABLE [dbo].[Flag] ADD CONSTRAINT [FK_Flag_FlagType] FOREIGN KEY ([FlagTypeId]) REFERENCES [dbo].[FlagType] ([Id])
GO
ALTER TABLE [dbo].[Flag] ADD CONSTRAINT [FK_Flag_Inspection] FOREIGN KEY ([InspectionId]) REFERENCES [dbo].[Inspection] ([Id])
GO
ALTER TABLE [dbo].[Flag] ADD CONSTRAINT [FK_Flag_MainReviewer] FOREIGN KEY ([MainReviewerId]) REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[Flag] ADD CONSTRAINT [FK_Flag_User] FOREIGN KEY ([UserId]) REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[Flag] ADD CONSTRAINT [FK_Flag_User_Flagor] FOREIGN KEY ([AuthorId]) REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[Flag] ADD CONSTRAINT [FK__Flag__IdGeograph__2E5BD364] FOREIGN KEY ([GeographyId]) REFERENCES [dbo].[Geography] ([Id])
GO
ALTER TABLE [dbo].[Flag] ADD CONSTRAINT [FK__Flag__SurveyId__2F4FF79D] FOREIGN KEY ([SurveyId]) REFERENCES [dbo].[Survey] ([Id])
GO
EXEC sp_addextendedproperty N'MS_Description', N'Link to a parent flag. This is used via the Reuse function on the front, to trace flag parent-child relationship ', 'SCHEMA', N'dbo', 'TABLE', N'Flag', 'COLUMN', N'PreviousInspectionFlagId'
GO
