CREATE TABLE [dbo].[FlagChapter_FlagAttribute]
(
[FlagChapterId] [uniqueidentifier] NOT NULL,
[AttributeFieldId] [uniqueidentifier] NOT NULL,
[IsActive] [bit] NOT NULL,
[Position] [int] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[FlagChapter_FlagAttribute] ADD CONSTRAINT [PK_FlagChapter_FlagAttribute] PRIMARY KEY NONCLUSTERED ([FlagChapterId], [AttributeFieldId]) WITH (FILLFACTOR=80) ON [PRIMARY]
GO
ALTER TABLE [dbo].[FlagChapter_FlagAttribute] ADD CONSTRAINT [FK_FlagChapter_FlagAttribute_AttributeField] FOREIGN KEY ([AttributeFieldId]) REFERENCES [dbo].[AttributeField] ([Id])
GO
ALTER TABLE [dbo].[FlagChapter_FlagAttribute] ADD CONSTRAINT [FK_FlagChapter_FlagAttribute_FlagChapter] FOREIGN KEY ([FlagChapterId]) REFERENCES [dbo].[FlagChapter] ([Id])
GO
