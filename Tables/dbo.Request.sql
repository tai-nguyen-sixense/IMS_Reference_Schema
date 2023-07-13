CREATE TABLE [dbo].[Request]
(
[Id] [uniqueidentifier] NOT NULL,
[Name] [nvarchar] (4000) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Number] [nvarchar] (4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[DateIn] [smalldatetime] NOT NULL,
[DateOut] [smalldatetime] NULL,
[RequestStatusId] [uniqueidentifier] NOT NULL,
[Comments] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AuthorId] [uniqueidentifier] NOT NULL,
[LastModified] [smalldatetime] NOT NULL,
[UserId] [uniqueidentifier] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Request] ADD CONSTRAINT [PK_Request] PRIMARY KEY NONCLUSTERED ([Id]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Request] ADD CONSTRAINT [FK_Request_RequestStatus] FOREIGN KEY ([RequestStatusId]) REFERENCES [dbo].[RequestStatus] ([Id])
GO
ALTER TABLE [dbo].[Request] ADD CONSTRAINT [FK_Request_User] FOREIGN KEY ([UserId]) REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[Request] ADD CONSTRAINT [FK_Request_User1] FOREIGN KEY ([AuthorId]) REFERENCES [dbo].[User] ([Id])
GO
