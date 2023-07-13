CREATE TABLE [dbo].[FlagAttributeValueHistory]
(
[FlagId] [uniqueidentifier] NOT NULL,
[AttributeFieldId] [uniqueidentifier] NOT NULL,
[ValueVersionId] [uniqueidentifier] NOT NULL,
[DateArchived] [datetime] NOT NULL,
[Value] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Comments] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[LastModified] [datetime] NOT NULL,
[UserId] [uniqueidentifier] NOT NULL,
[FlagChapterId] [uniqueidentifier] NOT NULL,
[ValueTagId] [uniqueidentifier] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[FlagAttributeValueHistory] ADD CONSTRAINT [PK_FlagAttributeValueHistory] PRIMARY KEY CLUSTERED ([FlagId], [AttributeFieldId], [ValueVersionId], [FlagChapterId], [DateArchived]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[FlagAttributeValueHistory] ADD CONSTRAINT [FK_Flag_avh_ValueTagId] FOREIGN KEY ([ValueTagId]) REFERENCES [dbo].[ValueTag] ([Id])
GO
ALTER TABLE [dbo].[FlagAttributeValueHistory] ADD CONSTRAINT [FK_FlagAttributeValueHistory_AttributeField1] FOREIGN KEY ([AttributeFieldId]) REFERENCES [dbo].[AttributeField] ([Id])
GO
ALTER TABLE [dbo].[FlagAttributeValueHistory] ADD CONSTRAINT [FK_FlagAttributeValueHistory_Flag] FOREIGN KEY ([FlagId]) REFERENCES [dbo].[Flag] ([Id])
GO
ALTER TABLE [dbo].[FlagAttributeValueHistory] ADD CONSTRAINT [FK_FlagAttributeValueHistory_FlagChapter] FOREIGN KEY ([FlagChapterId]) REFERENCES [dbo].[FlagChapter] ([Id])
GO
ALTER TABLE [dbo].[FlagAttributeValueHistory] ADD CONSTRAINT [FK_FlagAttributeValueHistory_User] FOREIGN KEY ([UserId]) REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[FlagAttributeValueHistory] ADD CONSTRAINT [FK_FlagAttributeValueHistory_ValueVersion] FOREIGN KEY ([ValueVersionId]) REFERENCES [dbo].[ValueVersion] ([Id])
GO
