CREATE TABLE [dbo].[ComponentType_ComponentChapter]
(
[ComponentTypeId] [uniqueidentifier] NOT NULL,
[ComponentChapterId] [uniqueidentifier] NOT NULL,
[Position] [int] NOT NULL,
[FatherId] [uniqueidentifier] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ComponentType_ComponentChapter] ADD CONSTRAINT [PK_ComponentTypeComponentChapter] PRIMARY KEY NONCLUSTERED ([ComponentTypeId], [ComponentChapterId]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ComponentType_ComponentChapter] ADD CONSTRAINT [FK_ComponentType_ComponentChapter_ComponentChapter] FOREIGN KEY ([ComponentChapterId]) REFERENCES [dbo].[ComponentChapter] ([Id])
GO
ALTER TABLE [dbo].[ComponentType_ComponentChapter] ADD CONSTRAINT [FK_ComponentType_ComponentChapter_ComponentType] FOREIGN KEY ([ComponentTypeId]) REFERENCES [dbo].[ComponentType] ([Id])
GO
