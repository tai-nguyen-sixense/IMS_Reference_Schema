CREATE TABLE [dbo].[ComponentChapter_ComponentAttribute]
(
[ComponentChapterId] [uniqueidentifier] NOT NULL,
[AttributeFieldId] [uniqueidentifier] NOT NULL,
[IsActive] [bit] NOT NULL,
[Position] [int] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ComponentChapter_ComponentAttribute] ADD CONSTRAINT [PK_ComponentChapter_ComponentAttribute] PRIMARY KEY NONCLUSTERED ([ComponentChapterId], [AttributeFieldId]) WITH (FILLFACTOR=80) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ComponentChapter_ComponentAttribute] ADD CONSTRAINT [FK_ComponentChapter_ComponentAttribute_AttributeField] FOREIGN KEY ([AttributeFieldId]) REFERENCES [dbo].[AttributeField] ([Id])
GO
ALTER TABLE [dbo].[ComponentChapter_ComponentAttribute] ADD CONSTRAINT [FK_ComponentChapter_ComponentAttribute_ComponentChapter] FOREIGN KEY ([ComponentChapterId]) REFERENCES [dbo].[ComponentChapter] ([Id])
GO
