CREATE TABLE [dbo].[Defect]
(
[Id] [uniqueidentifier] NOT NULL,
[DefectTypeId] [uniqueidentifier] NULL,
[DrawingId] [uniqueidentifier] NULL,
[AssetComponentId] [uniqueidentifier] NOT NULL,
[InspectionId] [uniqueidentifier] NOT NULL,
[FatherId] [uniqueidentifier] NULL,
[DefectStatusId] [uniqueidentifier] NOT NULL,
[DefectDate] [smalldatetime] NOT NULL,
[PositionX] [float] NULL,
[PositionY] [float] NULL,
[PositionZ] [float] NULL,
[ListPoint] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Comments] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[IsHighlighted] [bit] NOT NULL,
[LastModified] [smalldatetime] NOT NULL,
[UserId] [uniqueidentifier] NOT NULL,
[Number] [int] NOT NULL,
[ZIndex] [int] NOT NULL,
[NumberForReport] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[GeographyId] [uniqueidentifier] NULL,
[Description] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Defect] ADD CONSTRAINT [PK_Defect] PRIMARY KEY NONCLUSTERED ([Id]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Defect] ADD CONSTRAINT [FK_Defect_AssetComponent] FOREIGN KEY ([AssetComponentId]) REFERENCES [dbo].[AssetComponent] ([Id])
GO
ALTER TABLE [dbo].[Defect] ADD CONSTRAINT [FK_Defect_Defect] FOREIGN KEY ([FatherId]) REFERENCES [dbo].[Defect] ([Id])
GO
ALTER TABLE [dbo].[Defect] ADD CONSTRAINT [FK_Defect_DefectKnowledge] FOREIGN KEY ([DefectTypeId]) REFERENCES [dbo].[DefectType] ([Id])
GO
ALTER TABLE [dbo].[Defect] ADD CONSTRAINT [FK_Defect_DefectStatus] FOREIGN KEY ([DefectStatusId]) REFERENCES [dbo].[DefectStatus] ([Id])
GO
ALTER TABLE [dbo].[Defect] ADD CONSTRAINT [FK_Defect_Drawing] FOREIGN KEY ([DrawingId]) REFERENCES [dbo].[Drawing] ([Id])
GO
ALTER TABLE [dbo].[Defect] ADD CONSTRAINT [FK_Defect_Inspection] FOREIGN KEY ([InspectionId]) REFERENCES [dbo].[Inspection] ([Id])
GO
ALTER TABLE [dbo].[Defect] ADD CONSTRAINT [FK_Defect_User] FOREIGN KEY ([UserId]) REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[Defect] ADD CONSTRAINT [FK__Defect__IdGeogra__75235608] FOREIGN KEY ([GeographyId]) REFERENCES [dbo].[Geography] ([Id])
GO
