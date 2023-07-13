CREATE TABLE [dbo].[FlagStatusBis]
(
[Id] [uniqueidentifier] NOT NULL,
[Name] [nvarchar] (4000) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Icon] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Color] [nvarchar] (4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Position] [int] NOT NULL,
[CanBeReused] [bit] NOT NULL,
[IsAnActiveStatus] [bit] NOT NULL CONSTRAINT [DF__FlagStatu__IsAnA__0A888742] DEFAULT ((1)),
[IsRetired] [bit] NOT NULL CONSTRAINT [DF_FlagStatusBis_IsRetired] DEFAULT ((0))
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[FlagStatusBis] ADD CONSTRAINT [PK_FlagStatusBis] PRIMARY KEY NONCLUSTERED ([Id]) ON [PRIMARY]
GO
