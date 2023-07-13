CREATE TABLE [dbo].[Scenario]
(
[Id] [uniqueidentifier] NOT NULL,
[Name] [nvarchar] (4000) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Analysis] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Comments] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[LastModified] [smalldatetime] NULL,
[UserId] [uniqueidentifier] NULL,
[AuthorId] [uniqueidentifier] NOT NULL,
[ScenarioTypeId] [uniqueidentifier] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Scenario] ADD CONSTRAINT [PK_Scenario] PRIMARY KEY NONCLUSTERED ([Id]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Scenario] ADD CONSTRAINT [FK_Scenario_ScenarioType] FOREIGN KEY ([ScenarioTypeId]) REFERENCES [dbo].[ScenarioType] ([Id])
GO
ALTER TABLE [dbo].[Scenario] ADD CONSTRAINT [FK_Scenario_User] FOREIGN KEY ([UserId]) REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[Scenario] ADD CONSTRAINT [FK_Scenario_User1] FOREIGN KEY ([AuthorId]) REFERENCES [dbo].[User] ([Id])
GO
