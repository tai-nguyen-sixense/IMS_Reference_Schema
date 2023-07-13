CREATE TABLE [dbo].[ContactType_ContactChapter]
(
[ContactTypeId] [uniqueidentifier] NOT NULL,
[ContactChapterId] [uniqueidentifier] NOT NULL,
[Position] [int] NOT NULL,
[FatherId] [uniqueidentifier] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ContactType_ContactChapter] ADD CONSTRAINT [PK_ContactType_ContactChapter] PRIMARY KEY NONCLUSTERED ([ContactTypeId], [ContactChapterId]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ContactType_ContactChapter] ADD CONSTRAINT [FK_ContactType_ContactChapter_ContactChapter] FOREIGN KEY ([ContactChapterId]) REFERENCES [dbo].[ContactChapter] ([Id])
GO
ALTER TABLE [dbo].[ContactType_ContactChapter] ADD CONSTRAINT [FK_ContactType_ContactChapter_ContactType] FOREIGN KEY ([ContactTypeId]) REFERENCES [dbo].[ContactType] ([Id])
GO
