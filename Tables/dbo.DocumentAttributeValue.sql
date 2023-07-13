CREATE TABLE [dbo].[DocumentAttributeValue]
(
[DocumentId] [uniqueidentifier] NOT NULL,
[RevisionId] [uniqueidentifier] NOT NULL,
[AttributeFieldId] [uniqueidentifier] NOT NULL,
[Value] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Comments] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[LastModified] [smalldatetime] NOT NULL,
[UserId] [uniqueidentifier] NOT NULL,
[ValueBis] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CommentsBis] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[IsHighlighted] [bit] NOT NULL,
[ValueDateComputed] AS (TRY_PARSE(left([value],(50)) AS [datetime]))
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[DocumentAttributeValue] ADD CONSTRAINT [PK_DocumentAttributeValue] PRIMARY KEY NONCLUSTERED ([DocumentId], [RevisionId], [AttributeFieldId]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[DocumentAttributeValue] ADD CONSTRAINT [FK_DocumentAttributeValue_AttributeField] FOREIGN KEY ([AttributeFieldId]) REFERENCES [dbo].[AttributeField] ([Id])
GO
ALTER TABLE [dbo].[DocumentAttributeValue] ADD CONSTRAINT [FK_DocumentAttributeValue_Document] FOREIGN KEY ([DocumentId]) REFERENCES [dbo].[Document] ([Id])
GO
ALTER TABLE [dbo].[DocumentAttributeValue] ADD CONSTRAINT [FK_DocumentAttributeValue_Revision] FOREIGN KEY ([RevisionId]) REFERENCES [dbo].[DocumentRevision] ([Id])
GO
ALTER TABLE [dbo].[DocumentAttributeValue] ADD CONSTRAINT [FK_DocumentAttributeValue_User] FOREIGN KEY ([UserId]) REFERENCES [dbo].[User] ([Id])
GO
