CREATE TABLE [dbo].[AuditAttributeValue]
(
[AuditId] [uniqueidentifier] NOT NULL,
[AttributeFieldId] [uniqueidentifier] NOT NULL,
[Value] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Comments] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[LastModified] [smalldatetime] NOT NULL,
[UserId] [uniqueidentifier] NOT NULL,
[ValueBis] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CommentsBis] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[IsHighlighted] [bit] NOT NULL,
[ValueDateComputed] AS (TRY_PARSE(left([value],(50)) AS [datetime])),
[AuditChapterId] [uniqueidentifier] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AuditAttributeValue] ADD CONSTRAINT [PK_AuditAttributeValue] PRIMARY KEY NONCLUSTERED ([AuditId], [AuditChapterId], [AttributeFieldId]) WITH (FILLFACTOR=80) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AuditAttributeValue] ADD CONSTRAINT [FK_AuditAttributeValue_AttributeField] FOREIGN KEY ([AttributeFieldId]) REFERENCES [dbo].[AttributeField] ([Id])
GO
ALTER TABLE [dbo].[AuditAttributeValue] ADD CONSTRAINT [FK_AuditAttributeValue_Audit] FOREIGN KEY ([AuditId]) REFERENCES [dbo].[Audit] ([Id])
GO
ALTER TABLE [dbo].[AuditAttributeValue] ADD CONSTRAINT [FK_AuditAttributeValue_AuditChapter] FOREIGN KEY ([AuditChapterId]) REFERENCES [dbo].[AuditChapter] ([Id])
GO
ALTER TABLE [dbo].[AuditAttributeValue] ADD CONSTRAINT [FK_AuditAttributeValue_User] FOREIGN KEY ([UserId]) REFERENCES [dbo].[User] ([Id])
GO
