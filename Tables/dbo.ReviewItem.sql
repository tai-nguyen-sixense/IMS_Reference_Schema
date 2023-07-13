CREATE TABLE [dbo].[ReviewItem]
(
[Id] [uniqueidentifier] NOT NULL,
[Item] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Review] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Answer] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Position] [int] NOT NULL,
[AuthorId] [uniqueidentifier] NOT NULL,
[AnswererId] [uniqueidentifier] NULL,
[InspectionId] [uniqueidentifier] NULL,
[Reference] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ReviewTypeId] [uniqueidentifier] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ReviewItem] ADD CONSTRAINT [PK_ReviewItem] PRIMARY KEY NONCLUSTERED ([Id]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ReviewItem] ADD CONSTRAINT [FK_ReviewItem_Answerer] FOREIGN KEY ([AnswererId]) REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[ReviewItem] ADD CONSTRAINT [FK_ReviewItem_Author] FOREIGN KEY ([AuthorId]) REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[ReviewItem] ADD CONSTRAINT [FK_ReviewItem_Inspection] FOREIGN KEY ([InspectionId]) REFERENCES [dbo].[Inspection] ([Id])
GO
ALTER TABLE [dbo].[ReviewItem] ADD CONSTRAINT [FK_ReviewItem_ReviewType] FOREIGN KEY ([ReviewTypeId]) REFERENCES [dbo].[ReviewType] ([Id])
GO
