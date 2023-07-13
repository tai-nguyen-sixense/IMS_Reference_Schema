CREATE TABLE [dbo].[ContactChapter_Attribute]
(
[ContactChapterId] [uniqueidentifier] NOT NULL,
[AttributeFieldId] [uniqueidentifier] NOT NULL,
[IsActive] [bit] NOT NULL,
[Position] [int] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ContactChapter_Attribute] ADD CONSTRAINT [PK_ContactChapter_Attribute] PRIMARY KEY NONCLUSTERED ([ContactChapterId], [AttributeFieldId]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ContactChapter_Attribute] ADD CONSTRAINT [FK_ContactChapter_Attribute_AttributeField] FOREIGN KEY ([AttributeFieldId]) REFERENCES [dbo].[AttributeField] ([Id])
GO
ALTER TABLE [dbo].[ContactChapter_Attribute] ADD CONSTRAINT [FK_ContactChapter_Attribute_Chapter] FOREIGN KEY ([ContactChapterId]) REFERENCES [dbo].[ContactChapter] ([Id])
GO
