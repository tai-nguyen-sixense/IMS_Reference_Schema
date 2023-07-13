CREATE TABLE [dbo].[OversizeLoadItinerary]
(
[Id] [uniqueidentifier] NOT NULL,
[Name] [nvarchar] (4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[LastModified] [datetime] NULL,
[UserId] [uniqueidentifier] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[OversizeLoadItinerary] ADD CONSTRAINT [PK_OversizeLoadItinerary] PRIMARY KEY NONCLUSTERED ([Id]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[OversizeLoadItinerary] ADD CONSTRAINT [FK_OversizeLoadItinerary_User] FOREIGN KEY ([UserId]) REFERENCES [dbo].[User] ([Id])
GO
EXEC sp_addextendedproperty N'MS_Description', N'Deprecated Silverlight?', 'SCHEMA', N'dbo', 'TABLE', N'OversizeLoadItinerary', NULL, NULL
GO
