CREATE TABLE [dbo].[User_Contact]
(
[UserId] [uniqueidentifier] NOT NULL,
[ContactId] [uniqueidentifier] NOT NULL,
[DateLinked] [datetime] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[User_Contact] ADD CONSTRAINT [PK_User_Contact] PRIMARY KEY NONCLUSTERED ([UserId], [ContactId]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[User_Contact] ADD CONSTRAINT [FK_User_Contact_Contact] FOREIGN KEY ([ContactId]) REFERENCES [dbo].[Contact] ([Id])
GO
ALTER TABLE [dbo].[User_Contact] ADD CONSTRAINT [FK_User_Contact_User] FOREIGN KEY ([UserId]) REFERENCES [dbo].[User] ([Id])
GO
