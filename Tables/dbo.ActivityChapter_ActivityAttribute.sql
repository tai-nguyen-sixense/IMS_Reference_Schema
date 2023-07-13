CREATE TABLE [dbo].[ActivityChapter_ActivityAttribute]
(
[ActivityChapterId] [uniqueidentifier] NOT NULL,
[AttributeFieldId] [uniqueidentifier] NOT NULL,
[IsActive] [bit] NOT NULL,
[Position] [int] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ActivityChapter_ActivityAttribute] ADD CONSTRAINT [PK_ActivityChapter_ActivityAttribute] PRIMARY KEY NONCLUSTERED ([ActivityChapterId], [AttributeFieldId]) WITH (FILLFACTOR=80) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ActivityChapter_ActivityAttribute] ADD CONSTRAINT [FK_ActivityChapter_ActivityAttribute_ActivityChapter] FOREIGN KEY ([ActivityChapterId]) REFERENCES [dbo].[ActivityChapter] ([Id])
GO
ALTER TABLE [dbo].[ActivityChapter_ActivityAttribute] ADD CONSTRAINT [FK_ActivityChapter_ActivityAttribute_AttributeField] FOREIGN KEY ([AttributeFieldId]) REFERENCES [dbo].[AttributeField] ([Id])
GO
