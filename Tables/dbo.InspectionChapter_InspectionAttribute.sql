CREATE TABLE [dbo].[InspectionChapter_InspectionAttribute]
(
[InspectionChapterId] [uniqueidentifier] NOT NULL,
[AttributeFieldId] [uniqueidentifier] NOT NULL,
[IsActive] [bit] NOT NULL,
[Position] [int] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[InspectionChapter_InspectionAttribute] ADD CONSTRAINT [PK_InspectionChapter_InspectionAttribute] PRIMARY KEY NONCLUSTERED ([InspectionChapterId], [AttributeFieldId]) WITH (FILLFACTOR=80) ON [PRIMARY]
GO
ALTER TABLE [dbo].[InspectionChapter_InspectionAttribute] ADD CONSTRAINT [FK_InspectionChapter_InspectionAttribute_AttributeField] FOREIGN KEY ([AttributeFieldId]) REFERENCES [dbo].[AttributeField] ([Id])
GO
ALTER TABLE [dbo].[InspectionChapter_InspectionAttribute] ADD CONSTRAINT [FK_InspectionChapter_InspectionAttribute_InspectionChapter] FOREIGN KEY ([InspectionChapterId]) REFERENCES [dbo].[InspectionChapter] ([Id])
GO
