CREATE TABLE [dbo].[ALccProtection]
(
[Id] [uniqueidentifier] NOT NULL,
[Name] [nvarchar] (4000) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Icon] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Color] [nvarchar] (4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ALccProtection] ADD CONSTRAINT [PK_ALccProtection] PRIMARY KEY NONCLUSTERED ([Id]) ON [PRIMARY]
GO
