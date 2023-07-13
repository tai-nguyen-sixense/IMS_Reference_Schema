CREATE TABLE [dbo].[DecisionTree]
(
[Id] [uniqueidentifier] NOT NULL,
[Name] [nvarchar] (400) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Description] [nvarchar] (400) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[LastModified] [datetime] NOT NULL,
[UserId] [uniqueidentifier] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[DecisionTree] ADD CONSTRAINT [PK_DecisionTree] PRIMARY KEY CLUSTERED ([Id]) ON [PRIMARY]
GO
