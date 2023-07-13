CREATE TABLE [dbo].[Flag_AdditionalReviewer]
(
[FlagId] [uniqueidentifier] NOT NULL,
[UserId] [uniqueidentifier] NOT NULL,
[Position] [int] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Flag_AdditionalReviewer] ADD CONSTRAINT [PK_Flag_AdditionalReviewer] PRIMARY KEY NONCLUSTERED ([FlagId], [UserId]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Flag_AdditionalReviewer] ADD CONSTRAINT [FK_Flag_AdditionalReviewer_Flag] FOREIGN KEY ([FlagId]) REFERENCES [dbo].[Flag] ([Id])
GO
ALTER TABLE [dbo].[Flag_AdditionalReviewer] ADD CONSTRAINT [FK_Flag_AdditionalReviewer_User] FOREIGN KEY ([UserId]) REFERENCES [dbo].[User] ([Id])
GO
