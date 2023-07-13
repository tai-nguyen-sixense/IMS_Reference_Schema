CREATE TABLE [dbo].[AuditType_AuditChapter]
(
[AuditTypeId] [uniqueidentifier] NOT NULL,
[AuditChapterId] [uniqueidentifier] NOT NULL,
[Position] [int] NOT NULL,
[FatherId] [uniqueidentifier] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AuditType_AuditChapter] ADD CONSTRAINT [PK_AuditTypeAuditChapter] PRIMARY KEY NONCLUSTERED ([AuditTypeId], [AuditChapterId]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AuditType_AuditChapter] ADD CONSTRAINT [FK_AuditType_AuditChapter_AuditChapter] FOREIGN KEY ([AuditChapterId]) REFERENCES [dbo].[AuditChapter] ([Id])
GO
ALTER TABLE [dbo].[AuditType_AuditChapter] ADD CONSTRAINT [FK_AuditType_AuditChapter_AuditType] FOREIGN KEY ([AuditTypeId]) REFERENCES [dbo].[AuditType] ([Id])
GO
