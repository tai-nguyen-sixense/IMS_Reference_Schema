CREATE TABLE [dbo].[InspectionActivity]
(
[Id] [uniqueidentifier] NOT NULL,
[InspectionId] [uniqueidentifier] NOT NULL,
[DateBegin] [smalldatetime] NOT NULL,
[DateEnd] [smalldatetime] NOT NULL,
[InspectionActivityTypeId] [uniqueidentifier] NOT NULL,
[Comments] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[LastModified] [smalldatetime] NOT NULL,
[UserId] [uniqueidentifier] NOT NULL,
[ActorId] [uniqueidentifier] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[InspectionActivity] ADD CONSTRAINT [PK_InspectionActivity] PRIMARY KEY NONCLUSTERED ([Id]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[InspectionActivity] ADD CONSTRAINT [FK_InspectionActivity_Inspection] FOREIGN KEY ([InspectionId]) REFERENCES [dbo].[Inspection] ([Id])
GO
ALTER TABLE [dbo].[InspectionActivity] ADD CONSTRAINT [FK_InspectionActivity_InspectionActivityType] FOREIGN KEY ([InspectionActivityTypeId]) REFERENCES [dbo].[InspectionActivityType] ([Id])
GO
ALTER TABLE [dbo].[InspectionActivity] ADD CONSTRAINT [FK_InspectionActivity_User] FOREIGN KEY ([UserId]) REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[InspectionActivity] ADD CONSTRAINT [FK_InspectionActivity_User1] FOREIGN KEY ([ActorId]) REFERENCES [dbo].[User] ([Id])
GO
EXEC sp_addextendedproperty N'MS_Description', N'Id of the inspector for whom we are recording the activity', 'SCHEMA', N'dbo', 'TABLE', N'InspectionActivity', 'COLUMN', N'ActorId'
GO
