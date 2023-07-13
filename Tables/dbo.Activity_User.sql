CREATE TABLE [dbo].[Activity_User]
(
[ActivityId] [uniqueidentifier] NOT NULL,
[UserId] [uniqueidentifier] NOT NULL,
[Comments] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Activity_User] ADD CONSTRAINT [PK_Activity_User] PRIMARY KEY NONCLUSTERED ([ActivityId], [UserId]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Activity_User] ADD CONSTRAINT [FK_Activity_User_Activity] FOREIGN KEY ([ActivityId]) REFERENCES [dbo].[Activity] ([Id])
GO
ALTER TABLE [dbo].[Activity_User] ADD CONSTRAINT [FK_Activity_User_User] FOREIGN KEY ([UserId]) REFERENCES [dbo].[User] ([Id])
GO
