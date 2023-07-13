CREATE TABLE [dbo].[Event_Activity]
(
[Id] [uniqueidentifier] NOT NULL,
[EventId] [uniqueidentifier] NOT NULL,
[ActivityId] [uniqueidentifier] NOT NULL,
[LastModified] [datetime] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Event_Activity] ADD CONSTRAINT [PK_Event_Activity] PRIMARY KEY NONCLUSTERED ([Id], [EventId], [ActivityId]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Event_Activity] ADD CONSTRAINT [FK_Event_Activity_Activity] FOREIGN KEY ([ActivityId]) REFERENCES [dbo].[Activity] ([Id])
GO
ALTER TABLE [dbo].[Event_Activity] ADD CONSTRAINT [FK_Event_Activity_Event] FOREIGN KEY ([EventId]) REFERENCES [dbo].[Event] ([Id])
GO
