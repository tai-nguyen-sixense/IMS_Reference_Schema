CREATE TABLE [dbo].[AuditAttributeValueHistory]
(
[AuditId] [uniqueidentifier] NOT NULL,
[AttributeFieldId] [uniqueidentifier] NOT NULL,
[ValueVersionId] [uniqueidentifier] NOT NULL,
[DateArchived] [datetime] NOT NULL,
[Value] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Comments] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[LastModified] [datetime] NOT NULL,
[UserId] [uniqueidentifier] NOT NULL,
[AuditChapterId] [uniqueidentifier] NOT NULL,
[ValueTagId] [uniqueidentifier] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AuditAttributeValueHistory] ADD CONSTRAINT [PK_AuditAttributeValueHistory] PRIMARY KEY CLUSTERED ([AuditId], [AttributeFieldId], [ValueVersionId], [AuditChapterId], [DateArchived]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AuditAttributeValueHistory] ADD CONSTRAINT [FK_Audit_avh_ValueTagId] FOREIGN KEY ([ValueTagId]) REFERENCES [dbo].[ValueTag] ([Id])
GO
ALTER TABLE [dbo].[AuditAttributeValueHistory] ADD CONSTRAINT [FK_AuditAttributeValueHistory_AttributeField1] FOREIGN KEY ([AttributeFieldId]) REFERENCES [dbo].[AttributeField] ([Id])
GO
ALTER TABLE [dbo].[AuditAttributeValueHistory] ADD CONSTRAINT [FK_AuditAttributeValueHistory_Audit] FOREIGN KEY ([AuditId]) REFERENCES [dbo].[Audit] ([Id])
GO
ALTER TABLE [dbo].[AuditAttributeValueHistory] ADD CONSTRAINT [FK_AuditAttributeValueHistory_AuditChapter] FOREIGN KEY ([AuditChapterId]) REFERENCES [dbo].[AuditChapter] ([Id])
GO
ALTER TABLE [dbo].[AuditAttributeValueHistory] ADD CONSTRAINT [FK_AuditAttributeValueHistory_User] FOREIGN KEY ([UserId]) REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[AuditAttributeValueHistory] ADD CONSTRAINT [FK_AuditAttributeValueHistory_ValueVersion] FOREIGN KEY ([ValueVersionId]) REFERENCES [dbo].[ValueVersion] ([Id])
GO
