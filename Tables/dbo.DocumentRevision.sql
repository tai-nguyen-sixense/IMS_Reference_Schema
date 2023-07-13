CREATE TABLE [dbo].[DocumentRevision]
(
[Id] [uniqueidentifier] NOT NULL,
[DocumentId] [uniqueidentifier] NOT NULL,
[RevisionNameId] [uniqueidentifier] NOT NULL,
[RevisionStatusId] [uniqueidentifier] NOT NULL,
[CreationDate] [smalldatetime] NOT NULL,
[Comments] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[LastModified] [smalldatetime] NOT NULL,
[UserId] [uniqueidentifier] NOT NULL,
[AuthorId] [uniqueidentifier] NOT NULL,
[FileName] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[FileUploadComplete] [bit] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[DocumentRevision] ADD CONSTRAINT [PK_DocumentRevision] PRIMARY KEY NONCLUSTERED ([Id]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[DocumentRevision] ADD CONSTRAINT [FK_DocumentRevision_Document] FOREIGN KEY ([DocumentId]) REFERENCES [dbo].[Document] ([Id])
GO
ALTER TABLE [dbo].[DocumentRevision] ADD CONSTRAINT [FK_DocumentRevision_RevisionName] FOREIGN KEY ([RevisionNameId]) REFERENCES [dbo].[RevisionName] ([Id])
GO
ALTER TABLE [dbo].[DocumentRevision] ADD CONSTRAINT [FK_DocumentRevision_RevisionStatus] FOREIGN KEY ([RevisionStatusId]) REFERENCES [dbo].[RevisionStatus] ([Id])
GO
ALTER TABLE [dbo].[DocumentRevision] ADD CONSTRAINT [FK_DocumentRevision_User] FOREIGN KEY ([AuthorId]) REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[DocumentRevision] ADD CONSTRAINT [FK_DocumentRevision_User1] FOREIGN KEY ([UserId]) REFERENCES [dbo].[User] ([Id])
GO
