CREATE TABLE [dbo].[DocumentAppendix]
(
[Id] [uniqueidentifier] NOT NULL,
[DocumentRevisionId] [uniqueidentifier] NOT NULL,
[Name] [nvarchar] (4000) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Comments] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CreationDate] [smalldatetime] NULL,
[UserId] [uniqueidentifier] NOT NULL,
[LastModified] [smalldatetime] NOT NULL,
[FileName] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[FileUploadComplete] [bit] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[DocumentAppendix] ADD CONSTRAINT [PK_DocumentAppendix] PRIMARY KEY NONCLUSTERED ([Id]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[DocumentAppendix] ADD CONSTRAINT [FK_DocumentAppendix_DocumentRevision] FOREIGN KEY ([DocumentRevisionId]) REFERENCES [dbo].[DocumentRevision] ([Id])
GO
ALTER TABLE [dbo].[DocumentAppendix] ADD CONSTRAINT [FK_DocumentAppendix_User] FOREIGN KEY ([UserId]) REFERENCES [dbo].[User] ([Id])
GO
