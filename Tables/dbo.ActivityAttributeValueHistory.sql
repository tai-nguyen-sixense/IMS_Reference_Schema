CREATE TABLE [dbo].[ActivityAttributeValueHistory]
(
[ActivityId] [uniqueidentifier] NOT NULL,
[AttributeFieldId] [uniqueidentifier] NOT NULL,
[ValueVersionId] [uniqueidentifier] NOT NULL,
[DateArchived] [datetime] NOT NULL,
[Value] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Comments] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[LastModified] [datetime] NOT NULL,
[UserId] [uniqueidentifier] NOT NULL,
[ActivityChapterId] [uniqueidentifier] NOT NULL,
[ValueTagId] [uniqueidentifier] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ActivityAttributeValueHistory] ADD CONSTRAINT [PK_ActivityAttributeValueHistory] PRIMARY KEY CLUSTERED ([ActivityId], [AttributeFieldId], [ValueVersionId], [ActivityChapterId], [DateArchived]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ActivityAttributeValueHistory] ADD CONSTRAINT [FK_Activity_avh_ValueTagId] FOREIGN KEY ([ValueTagId]) REFERENCES [dbo].[ValueTag] ([Id])
GO
ALTER TABLE [dbo].[ActivityAttributeValueHistory] ADD CONSTRAINT [FK_ActivityAttributeValueHistory_Activity] FOREIGN KEY ([ActivityId]) REFERENCES [dbo].[Activity] ([Id])
GO
ALTER TABLE [dbo].[ActivityAttributeValueHistory] ADD CONSTRAINT [FK_ActivityAttributeValueHistory_ActivityChapter] FOREIGN KEY ([ActivityChapterId]) REFERENCES [dbo].[ActivityChapter] ([Id])
GO
ALTER TABLE [dbo].[ActivityAttributeValueHistory] ADD CONSTRAINT [FK_ActivityAttributeValueHistory_AttributeField1] FOREIGN KEY ([AttributeFieldId]) REFERENCES [dbo].[AttributeField] ([Id])
GO
ALTER TABLE [dbo].[ActivityAttributeValueHistory] ADD CONSTRAINT [FK_ActivityAttributeValueHistory_User] FOREIGN KEY ([UserId]) REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[ActivityAttributeValueHistory] ADD CONSTRAINT [FK_ActivityAttributeValueHistory_ValueVersion] FOREIGN KEY ([ValueVersionId]) REFERENCES [dbo].[ValueVersion] ([Id])
GO
