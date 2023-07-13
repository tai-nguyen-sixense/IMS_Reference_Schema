CREATE TABLE [dbo].[FlagType_FlagChapter]
(
[FlagTypeId] [uniqueidentifier] NOT NULL,
[FlagChapterId] [uniqueidentifier] NOT NULL,
[Position] [int] NOT NULL,
[FatherId] [uniqueidentifier] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[FlagType_FlagChapter] ADD CONSTRAINT [PK_FlagTypeFlagChapter] PRIMARY KEY NONCLUSTERED ([FlagTypeId], [FlagChapterId]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[FlagType_FlagChapter] ADD CONSTRAINT [FK_FlagType_FlagChapter_FlagChapter] FOREIGN KEY ([FlagChapterId]) REFERENCES [dbo].[FlagChapter] ([Id])
GO
ALTER TABLE [dbo].[FlagType_FlagChapter] ADD CONSTRAINT [FK_FlagType_FlagChapter_FlagType] FOREIGN KEY ([FlagTypeId]) REFERENCES [dbo].[FlagType] ([Id])
GO
