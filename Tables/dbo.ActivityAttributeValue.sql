CREATE TABLE [dbo].[ActivityAttributeValue]
(
[ActivityId] [uniqueidentifier] NOT NULL,
[AttributeFieldId] [uniqueidentifier] NOT NULL,
[Value] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Comments] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[LastModified] [smalldatetime] NOT NULL,
[UserId] [uniqueidentifier] NOT NULL,
[ValueBis] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CommentsBis] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[IsHighlighted] [bit] NOT NULL,
[ValueDateComputed] AS (TRY_PARSE(left([value],(50)) AS [datetime])),
[ActivityChapterId] [uniqueidentifier] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ActivityAttributeValue] ADD CONSTRAINT [PK_ActivityAttributeValue] PRIMARY KEY NONCLUSTERED ([ActivityId], [ActivityChapterId], [AttributeFieldId]) WITH (FILLFACTOR=80) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ActivityAttributeValue] ADD CONSTRAINT [FK_ActivityAttributeValue_Activity] FOREIGN KEY ([ActivityId]) REFERENCES [dbo].[Activity] ([Id])
GO
ALTER TABLE [dbo].[ActivityAttributeValue] ADD CONSTRAINT [FK_ActivityAttributeValue_ActivityChapter] FOREIGN KEY ([ActivityChapterId]) REFERENCES [dbo].[ActivityChapter] ([Id])
GO
ALTER TABLE [dbo].[ActivityAttributeValue] ADD CONSTRAINT [FK_ActivityAttributeValue_AttributeField] FOREIGN KEY ([AttributeFieldId]) REFERENCES [dbo].[AttributeField] ([Id])
GO
ALTER TABLE [dbo].[ActivityAttributeValue] ADD CONSTRAINT [FK_ActivityAttributeValue_User] FOREIGN KEY ([UserId]) REFERENCES [dbo].[User] ([Id])
GO
