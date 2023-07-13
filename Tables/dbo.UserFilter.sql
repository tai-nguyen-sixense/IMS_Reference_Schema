CREATE TABLE [dbo].[UserFilter]
(
[Id] [uniqueidentifier] NOT NULL,
[UserId] [uniqueidentifier] NOT NULL,
[Name] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Data] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[IsPublic] [bit] NOT NULL,
[CreationDate] [datetime] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[UserFilter] ADD CONSTRAINT [PK_UserFilter] PRIMARY KEY NONCLUSTERED ([Id]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[UserFilter] ADD CONSTRAINT [UC_UserFilter_UserId_Name] UNIQUE NONCLUSTERED ([UserId], [Name]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[UserFilter] ADD CONSTRAINT [FK_UserFilter_User] FOREIGN KEY ([UserId]) REFERENCES [dbo].[User] ([Id])
GO
