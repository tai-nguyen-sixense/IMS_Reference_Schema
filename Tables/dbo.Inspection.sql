CREATE TABLE [dbo].[Inspection]
(
[Id] [uniqueidentifier] NOT NULL,
[InspectionMasterId] [uniqueidentifier] NOT NULL,
[InspectionStatusId] [uniqueidentifier] NOT NULL,
[DateFrom] [smalldatetime] NULL,
[DateTo] [smalldatetime] NULL,
[Comments] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[IsOnSite] [bit] NOT NULL,
[TeamId] [uniqueidentifier] NULL,
[TeamLeaderId] [uniqueidentifier] NULL,
[LastModified] [smalldatetime] NOT NULL,
[UserId] [uniqueidentifier] NOT NULL,
[AuthorId] [uniqueidentifier] NOT NULL,
[ReviewedById] [uniqueidentifier] NULL,
[Number] [nvarchar] (4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[EstimatedTime] [bigint] NULL,
[ActualTime] [bigint] NULL,
[ProgrammationYear] [int] NULL,
[GeographyId] [uniqueidentifier] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Inspection] ADD CONSTRAINT [PK_Inspection] PRIMARY KEY NONCLUSTERED ([Id]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Inspection] ADD CONSTRAINT [FK_Inspection_InspectionMaster] FOREIGN KEY ([InspectionMasterId]) REFERENCES [dbo].[InspectionMaster] ([Id])
GO
ALTER TABLE [dbo].[Inspection] ADD CONSTRAINT [FK_Inspection_InspectionStatus] FOREIGN KEY ([InspectionStatusId]) REFERENCES [dbo].[InspectionStatus] ([Id])
GO
ALTER TABLE [dbo].[Inspection] ADD CONSTRAINT [FK_Inspection_Team] FOREIGN KEY ([TeamId]) REFERENCES [dbo].[Team] ([Id])
GO
ALTER TABLE [dbo].[Inspection] ADD CONSTRAINT [FK_Inspection_User] FOREIGN KEY ([UserId]) REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[Inspection] ADD CONSTRAINT [FK_Inspection_User_Inspector] FOREIGN KEY ([TeamLeaderId]) REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[Inspection] ADD CONSTRAINT [FK_Inspection_User1] FOREIGN KEY ([AuthorId]) REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[Inspection] ADD CONSTRAINT [FK_Inspection_User2] FOREIGN KEY ([ReviewedById]) REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[Inspection] ADD CONSTRAINT [FK__Inspectio__IdGeo__61DB776A] FOREIGN KEY ([GeographyId]) REFERENCES [dbo].[Geography] ([Id])
GO
