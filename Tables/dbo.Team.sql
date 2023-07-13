CREATE TABLE [dbo].[Team]
(
[Id] [uniqueidentifier] NOT NULL,
[Name] [nvarchar] (4000) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[LogoFilePath] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[IsActive] [bit] NOT NULL,
[Email] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[DefaultVehicleId] [uniqueidentifier] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Team] ADD CONSTRAINT [PK_Team] PRIMARY KEY NONCLUSTERED ([Id]) ON [PRIMARY]
GO
