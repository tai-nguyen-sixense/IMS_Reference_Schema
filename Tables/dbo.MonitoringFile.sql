CREATE TABLE [dbo].[MonitoringFile]
(
[Id] [uniqueidentifier] NOT NULL,
[AssetId] [uniqueidentifier] NOT NULL,
[Name] [nvarchar] (4000) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[FileName] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Comments] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[LastModified] [smalldatetime] NOT NULL,
[UserId] [uniqueidentifier] NOT NULL,
[MonitoringFilePriorityId] [uniqueidentifier] NOT NULL,
[MonitoringFileStatusId] [uniqueidentifier] NOT NULL,
[MonitoringFileTypeId] [uniqueidentifier] NOT NULL,
[DataPattern] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Date] [datetime] NOT NULL,
[AssetComponentId] [uniqueidentifier] NULL,
[InspectionId] [uniqueidentifier] NULL,
[CurrentSituation] [nvarchar] (256) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[SizeInKOctets] [float] NULL,
[FlagId] [uniqueidentifier] NULL,
[HeaderFile] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[MonitoringFile] ADD CONSTRAINT [PK_MonitoringFile] PRIMARY KEY NONCLUSTERED ([Id]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[MonitoringFile] ADD CONSTRAINT [FK_MonitoringFile_Asset] FOREIGN KEY ([AssetId]) REFERENCES [dbo].[Asset] ([Id])
GO
ALTER TABLE [dbo].[MonitoringFile] ADD CONSTRAINT [FK_MonitoringFile_AssetComponent] FOREIGN KEY ([AssetComponentId]) REFERENCES [dbo].[AssetComponent] ([Id])
GO
ALTER TABLE [dbo].[MonitoringFile] ADD CONSTRAINT [FK_MonitoringFile_Flag] FOREIGN KEY ([FlagId]) REFERENCES [dbo].[Flag] ([Id])
GO
ALTER TABLE [dbo].[MonitoringFile] ADD CONSTRAINT [FK_MonitoringFile_Inspection] FOREIGN KEY ([InspectionId]) REFERENCES [dbo].[Inspection] ([Id])
GO
ALTER TABLE [dbo].[MonitoringFile] ADD CONSTRAINT [FK_MonitoringFile_MonitoringFilePriority] FOREIGN KEY ([MonitoringFilePriorityId]) REFERENCES [dbo].[MonitoringFilePriority] ([Id])
GO
ALTER TABLE [dbo].[MonitoringFile] ADD CONSTRAINT [FK_MonitoringFile_MonitoringFileStatus] FOREIGN KEY ([MonitoringFileStatusId]) REFERENCES [dbo].[MonitoringFileStatus] ([Id])
GO
ALTER TABLE [dbo].[MonitoringFile] ADD CONSTRAINT [FK_MonitoringFile_MonitoringFileType] FOREIGN KEY ([MonitoringFileTypeId]) REFERENCES [dbo].[MonitoringFileType] ([Id])
GO
ALTER TABLE [dbo].[MonitoringFile] ADD CONSTRAINT [FK_MonitoringFile_User] FOREIGN KEY ([UserId]) REFERENCES [dbo].[User] ([Id])
GO
