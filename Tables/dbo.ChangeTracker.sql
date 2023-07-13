CREATE TABLE [dbo].[ChangeTracker]
(
[ObjectId] [uniqueidentifier] NOT NULL,
[ObjectType] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[ObjectStatus] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Value] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Comments] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[LastModified] [datetime] NOT NULL,
[UserId] [uniqueidentifier] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ChangeTracker] ADD CONSTRAINT [PK_ChangeTracker] PRIMARY KEY CLUSTERED ([ObjectId]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ChangeTracker] ADD CONSTRAINT [FK_Table_ChangeTracker_User] FOREIGN KEY ([UserId]) REFERENCES [dbo].[User] ([Id])
GO
