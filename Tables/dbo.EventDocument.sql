CREATE TABLE [dbo].[EventDocument]
(
[Id] [uniqueidentifier] NOT NULL,
[EventId] [uniqueidentifier] NOT NULL,
[Name] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Comments] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[FileName] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Date] [smalldatetime] NOT NULL,
[LastModified] [smalldatetime] NOT NULL,
[UserId] [uniqueidentifier] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[EventDocument] ADD CONSTRAINT [PK_EventDocument] PRIMARY KEY NONCLUSTERED ([Id]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[EventDocument] ADD CONSTRAINT [FK_EventDocument_Event] FOREIGN KEY ([EventId]) REFERENCES [dbo].[Event] ([Id])
GO
ALTER TABLE [dbo].[EventDocument] ADD CONSTRAINT [FK_EventDocument_User] FOREIGN KEY ([UserId]) REFERENCES [dbo].[User] ([Id])
GO
