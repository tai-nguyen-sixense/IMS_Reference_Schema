CREATE TABLE [dbo].[Event]
(
[Id] [uniqueidentifier] NOT NULL,
[DateFrom] [datetime2] NOT NULL,
[DateTo] [datetime2] NOT NULL,
[EventTypeId] [uniqueidentifier] NOT NULL,
[EventStatusId] [uniqueidentifier] NOT NULL,
[EventPriorityId] [uniqueidentifier] NOT NULL,
[Comments] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Event] ADD CONSTRAINT [PK_Event] PRIMARY KEY NONCLUSTERED ([Id]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Event] ADD CONSTRAINT [FK_Event_EventPriority] FOREIGN KEY ([EventPriorityId]) REFERENCES [dbo].[EventPriority] ([Id])
GO
ALTER TABLE [dbo].[Event] ADD CONSTRAINT [FK_Event_EventStatus] FOREIGN KEY ([EventStatusId]) REFERENCES [dbo].[EventStatus] ([Id])
GO
ALTER TABLE [dbo].[Event] ADD CONSTRAINT [FK_Event_EventType] FOREIGN KEY ([EventTypeId]) REFERENCES [dbo].[EventType] ([Id])
GO
