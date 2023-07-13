CREATE TABLE [dbo].[PendingTask]
(
[Id] [uniqueidentifier] NOT NULL,
[ServiceName] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Parameters] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Message] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Progress] [float] NOT NULL,
[HasError] [bit] NOT NULL,
[SubmissionDate] [smalldatetime] NOT NULL,
[UserId] [uniqueidentifier] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[PendingTask] ADD CONSTRAINT [PK_PendingTask] PRIMARY KEY NONCLUSTERED ([Id]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[PendingTask] ADD CONSTRAINT [FK_PendingTask_User] FOREIGN KEY ([UserId]) REFERENCES [dbo].[User] ([Id])
GO
