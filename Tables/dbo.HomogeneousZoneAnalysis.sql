CREATE TABLE [dbo].[HomogeneousZoneAnalysis]
(
[Id] [uniqueidentifier] NOT NULL,
[Name] [nvarchar] (4000) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[AnalysisDate] [smalldatetime] NOT NULL,
[Comments] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[LastModified] [smalldatetime] NOT NULL,
[UserId] [uniqueidentifier] NOT NULL,
[MatrixId] [uniqueidentifier] NOT NULL,
[ContactId] [uniqueidentifier] NULL,
[AnalysisTypeId] [uniqueidentifier] NOT NULL,
[IsActive] [bit] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[HomogeneousZoneAnalysis] ADD CONSTRAINT [PK_HomogeneousZoneAnalysis] PRIMARY KEY NONCLUSTERED ([Id]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[HomogeneousZoneAnalysis] ADD CONSTRAINT [FK_HomogeneousZoneAnalysis_AnalysisType] FOREIGN KEY ([AnalysisTypeId]) REFERENCES [dbo].[AnalysisType] ([Id])
GO
ALTER TABLE [dbo].[HomogeneousZoneAnalysis] ADD CONSTRAINT [FK_HomogeneousZoneAnalysis_Contact] FOREIGN KEY ([ContactId]) REFERENCES [dbo].[Contact] ([Id])
GO
ALTER TABLE [dbo].[HomogeneousZoneAnalysis] ADD CONSTRAINT [FK_HomogeneousZoneAnalysis_Matrix] FOREIGN KEY ([MatrixId]) REFERENCES [dbo].[Matrix] ([Id])
GO
ALTER TABLE [dbo].[HomogeneousZoneAnalysis] ADD CONSTRAINT [FK_HomogeneousZoneAnalysis_User] FOREIGN KEY ([UserId]) REFERENCES [dbo].[User] ([Id])
GO
