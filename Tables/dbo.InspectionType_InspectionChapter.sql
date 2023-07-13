CREATE TABLE [dbo].[InspectionType_InspectionChapter]
(
[InspectionTypeId] [uniqueidentifier] NOT NULL,
[InspectionChapterId] [uniqueidentifier] NOT NULL,
[Position] [int] NOT NULL,
[FatherId] [uniqueidentifier] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[InspectionType_InspectionChapter] ADD CONSTRAINT [PK_InspectionTypeInspectionChapter] PRIMARY KEY NONCLUSTERED ([InspectionTypeId], [InspectionChapterId]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[InspectionType_InspectionChapter] ADD CONSTRAINT [FK_InspectionType_InspectionChapter_InspectionChapter] FOREIGN KEY ([InspectionChapterId]) REFERENCES [dbo].[InspectionChapter] ([Id])
GO
ALTER TABLE [dbo].[InspectionType_InspectionChapter] ADD CONSTRAINT [FK_InspectionType_InspectionChapter_InspectionType] FOREIGN KEY ([InspectionTypeId]) REFERENCES [dbo].[InspectionType] ([Id])
GO
