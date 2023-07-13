CREATE TABLE [dbo].[Activity_Flag]
(
[ActivityId] [uniqueidentifier] NOT NULL,
[FlagId] [uniqueidentifier] NOT NULL,
[DateLinked] [datetime] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Activity_Flag] ADD CONSTRAINT [PK_Activity-Flag] PRIMARY KEY NONCLUSTERED ([ActivityId], [FlagId]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Activity_Flag] ADD CONSTRAINT [FK_Activity_Flag_Activity] FOREIGN KEY ([ActivityId]) REFERENCES [dbo].[Activity] ([Id])
GO
ALTER TABLE [dbo].[Activity_Flag] ADD CONSTRAINT [FK_Activity_Flag_Flag] FOREIGN KEY ([FlagId]) REFERENCES [dbo].[Flag] ([Id])
GO
