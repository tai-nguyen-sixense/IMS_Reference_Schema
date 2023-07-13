CREATE TABLE [dbo].[ContactAttributeValueHistory]
(
[ContactId] [uniqueidentifier] NOT NULL,
[AttributeFieldId] [uniqueidentifier] NOT NULL,
[ValueVersionId] [uniqueidentifier] NOT NULL,
[DateArchived] [datetime] NOT NULL,
[Value] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Comments] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[LastModified] [datetime] NOT NULL,
[UserId] [uniqueidentifier] NOT NULL,
[ContactChapterId] [uniqueidentifier] NOT NULL,
[ValueNumeric] [float] NULL,
[ValueDate] [datetime] NULL,
[ValueTagId] [uniqueidentifier] NOT NULL,
[ValueDateComputed] AS (TRY_PARSE(left([value],(50)) AS [datetime]))
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ContactAttributeValueHistory] ADD CONSTRAINT [PK_ContactAttributeValueHistory] PRIMARY KEY NONCLUSTERED ([ContactId], [AttributeFieldId], [ValueVersionId], [DateArchived], [ContactChapterId], [ValueTagId]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ContactAttributeValueHistory] ADD CONSTRAINT [FK_ContactAttributeValueHistory_AttributeField] FOREIGN KEY ([AttributeFieldId]) REFERENCES [dbo].[AttributeField] ([Id])
GO
ALTER TABLE [dbo].[ContactAttributeValueHistory] ADD CONSTRAINT [FK_ContactAttributeValueHistory_Contact] FOREIGN KEY ([ContactId]) REFERENCES [dbo].[Contact] ([Id])
GO
ALTER TABLE [dbo].[ContactAttributeValueHistory] ADD CONSTRAINT [FK_ContactAttributeValueHistory_ContactChapter] FOREIGN KEY ([ContactChapterId]) REFERENCES [dbo].[ContactChapter] ([Id])
GO
ALTER TABLE [dbo].[ContactAttributeValueHistory] ADD CONSTRAINT [FK_ContactAttributeValueHistory_User] FOREIGN KEY ([UserId]) REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[ContactAttributeValueHistory] ADD CONSTRAINT [FK_ContactAttributeValueHistory_ValueTag] FOREIGN KEY ([ValueTagId]) REFERENCES [dbo].[ValueTag] ([Id])
GO
ALTER TABLE [dbo].[ContactAttributeValueHistory] ADD CONSTRAINT [FK_ContactAttributeValueHistory_ValueVersion] FOREIGN KEY ([ValueVersionId]) REFERENCES [dbo].[ValueVersion] ([Id])
GO
