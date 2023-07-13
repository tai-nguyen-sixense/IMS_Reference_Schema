CREATE TABLE [dbo].[AuditChapter_AuditAttribute]
(
[AuditChapterId] [uniqueidentifier] NOT NULL,
[AttributeFieldId] [uniqueidentifier] NOT NULL,
[IsActive] [bit] NOT NULL,
[Position] [int] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AuditChapter_AuditAttribute] ADD CONSTRAINT [PK_AuditChapter_AuditAttribute] PRIMARY KEY NONCLUSTERED ([AuditChapterId], [AttributeFieldId]) WITH (FILLFACTOR=80) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AuditChapter_AuditAttribute] ADD CONSTRAINT [FK_AuditChapter_AuditAttribute_AttributeField] FOREIGN KEY ([AttributeFieldId]) REFERENCES [dbo].[AttributeField] ([Id])
GO
ALTER TABLE [dbo].[AuditChapter_AuditAttribute] ADD CONSTRAINT [FK_AuditChapter_AuditAttribute_AuditChapter] FOREIGN KEY ([AuditChapterId]) REFERENCES [dbo].[AuditChapter] ([Id])
GO
