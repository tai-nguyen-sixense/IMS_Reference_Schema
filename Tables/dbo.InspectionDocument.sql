CREATE TABLE [dbo].[InspectionDocument]
(
[Id] [uniqueidentifier] NOT NULL,
[Name] [nvarchar] (4000) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Comments] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[PathFile] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[LastModified] [smalldatetime] NOT NULL,
[UserId] [uniqueidentifier] NOT NULL,
[AssetId] [uniqueidentifier] NOT NULL,
[InspectionDocumentTypeId] [uniqueidentifier] NOT NULL,
[FileUploadComplete] [bit] NOT NULL,
[IncludeInReport] [bit] NOT NULL,
[GeographyId] [uniqueidentifier] NULL,
[SMCanBeDownloaded] [bit] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[InspectionDocument] ADD CONSTRAINT [PK_DocumentInspection] PRIMARY KEY NONCLUSTERED ([Id]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[InspectionDocument] ADD CONSTRAINT [FK_InspectionDocument_Asset] FOREIGN KEY ([AssetId]) REFERENCES [dbo].[Asset] ([Id])
GO
ALTER TABLE [dbo].[InspectionDocument] ADD CONSTRAINT [FK_InspectionDocument_User] FOREIGN KEY ([UserId]) REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[InspectionDocument] ADD CONSTRAINT [FK_InspectionDocumentType] FOREIGN KEY ([InspectionDocumentTypeId]) REFERENCES [dbo].[InspectionDocumentType] ([Id])
GO
ALTER TABLE [dbo].[InspectionDocument] ADD CONSTRAINT [FK__Inspectio__IdGeo__77CAB889] FOREIGN KEY ([GeographyId]) REFERENCES [dbo].[Geography] ([Id])
GO
EXEC sp_addextendedproperty N'MS_Description', N'Store the date of the last modification', 'SCHEMA', N'dbo', 'TABLE', N'InspectionDocument', 'COLUMN', N'LastModified'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Store the id of the user who made the last modification', 'SCHEMA', N'dbo', 'TABLE', N'InspectionDocument', 'COLUMN', N'UserId'
GO
