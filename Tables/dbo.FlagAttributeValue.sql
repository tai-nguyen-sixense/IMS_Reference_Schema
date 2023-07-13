CREATE TABLE [dbo].[FlagAttributeValue]
(
[FlagId] [uniqueidentifier] NOT NULL,
[AttributeFieldId] [uniqueidentifier] NOT NULL,
[Value] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Comments] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ValueBis] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CommentsBis] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[LastModified] [smalldatetime] NOT NULL,
[UserId] [uniqueidentifier] NOT NULL,
[IsHighlighted] [bit] NOT NULL,
[ValueDateComputed] AS (TRY_PARSE(left([value],(50)) AS [datetime])),
[FlagChapterId] [uniqueidentifier] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[FlagAttributeValue] ADD CONSTRAINT [PK_FlagAttributeValue] PRIMARY KEY NONCLUSTERED ([FlagId], [FlagChapterId], [AttributeFieldId]) WITH (FILLFACTOR=80) ON [PRIMARY]
GO
ALTER TABLE [dbo].[FlagAttributeValue] ADD CONSTRAINT [FK_FlagAttributeValue_AttributeField] FOREIGN KEY ([AttributeFieldId]) REFERENCES [dbo].[AttributeField] ([Id])
GO
ALTER TABLE [dbo].[FlagAttributeValue] ADD CONSTRAINT [FK_FlagAttributeValue_Flag] FOREIGN KEY ([FlagId]) REFERENCES [dbo].[Flag] ([Id])
GO
ALTER TABLE [dbo].[FlagAttributeValue] ADD CONSTRAINT [FK_FlagAttributeValue_FlagChapter] FOREIGN KEY ([FlagChapterId]) REFERENCES [dbo].[FlagChapter] ([Id])
GO
ALTER TABLE [dbo].[FlagAttributeValue] ADD CONSTRAINT [FK_FlagAttributeValue_User] FOREIGN KEY ([UserId]) REFERENCES [dbo].[User] ([Id])
GO
