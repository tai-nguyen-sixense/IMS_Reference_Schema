CREATE TABLE [dbo].[Role]
(
[Id] [uniqueidentifier] NOT NULL,
[Name] [nvarchar] (4000) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[IsTeamLeader] [bit] NOT NULL,
[MaxCountInTeam] [int] NULL,
[IsTeamRole] [bit] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Role] ADD CONSTRAINT [PK_Role] PRIMARY KEY NONCLUSTERED ([Id]) ON [PRIMARY]
GO
