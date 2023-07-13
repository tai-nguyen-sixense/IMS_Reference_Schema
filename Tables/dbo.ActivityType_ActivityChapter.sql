CREATE TABLE [dbo].[ActivityType_ActivityChapter]
(
[ActivityTypeId] [uniqueidentifier] NOT NULL,
[ActivityChapterId] [uniqueidentifier] NOT NULL,
[Position] [int] NOT NULL,
[FatherId] [uniqueidentifier] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ActivityType_ActivityChapter] ADD CONSTRAINT [PK_ActivityTypeActivityChapter] PRIMARY KEY NONCLUSTERED ([ActivityTypeId], [ActivityChapterId]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ActivityType_ActivityChapter] ADD CONSTRAINT [FK_ActivityType_ActivityChapter_ActivityChapter] FOREIGN KEY ([ActivityChapterId]) REFERENCES [dbo].[ActivityChapter] ([Id])
GO
ALTER TABLE [dbo].[ActivityType_ActivityChapter] ADD CONSTRAINT [FK_ActivityType_ActivityChapter_ActivityType] FOREIGN KEY ([ActivityTypeId]) REFERENCES [dbo].[ActivityType] ([Id])
GO
