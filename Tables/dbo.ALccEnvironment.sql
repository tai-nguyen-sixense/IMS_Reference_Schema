CREATE TABLE [dbo].[ALccEnvironment]
(
[Id] [uniqueidentifier] NOT NULL,
[Name] [nvarchar] (4000) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Icon] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Color] [nvarchar] (4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ALccEnvironment] ADD CONSTRAINT [PK_ALccEnvironment] PRIMARY KEY NONCLUSTERED ([Id]) ON [PRIMARY]
GO
