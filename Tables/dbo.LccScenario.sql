CREATE TABLE [dbo].[LccScenario]
(
[Id] [uniqueidentifier] NOT NULL,
[Name] [nvarchar] (4000) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[LccScenario] ADD CONSTRAINT [PK_LccScenario] PRIMARY KEY NONCLUSTERED ([Id]) ON [PRIMARY]
GO
