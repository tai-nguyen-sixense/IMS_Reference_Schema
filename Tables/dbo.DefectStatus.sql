CREATE TABLE [dbo].[DefectStatus]
(
[Id] [uniqueidentifier] NOT NULL,
[Name] [nvarchar] (4000) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Icon] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Color] [nvarchar] (4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Position] [int] NOT NULL,
[IsAnActiveStatus] [bit] NOT NULL,
[IsRetired] [bit] NOT NULL CONSTRAINT [DF_DefectStatus_IsRetired] DEFAULT ((0)),
[SMCanBeApplied] [bit] NOT NULL CONSTRAINT [DF__DefectSta__SMCan__0A096455] DEFAULT ((1))
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[DefectStatus] ADD CONSTRAINT [PK_DefectStatus] PRIMARY KEY NONCLUSTERED ([Id]) ON [PRIMARY]
GO
