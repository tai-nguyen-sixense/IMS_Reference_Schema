CREATE TABLE [dbo].[Flag_User]
(
[FlagId] [uniqueidentifier] NOT NULL,
[UserId] [uniqueidentifier] NOT NULL,
[Comments] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Flag_User] ADD CONSTRAINT [PK_Flag_User] PRIMARY KEY NONCLUSTERED ([FlagId], [UserId]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Flag_User] ADD CONSTRAINT [FK_Flag_User_Flag] FOREIGN KEY ([FlagId]) REFERENCES [dbo].[Flag] ([Id])
GO
ALTER TABLE [dbo].[Flag_User] ADD CONSTRAINT [FK_Flag_User_User] FOREIGN KEY ([UserId]) REFERENCES [dbo].[User] ([Id])
GO
