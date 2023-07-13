CREATE TABLE [dbo].[Condition]
(
[Id] [uniqueidentifier] NOT NULL,
[Value] [nvarchar] (250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Message] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Operator] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Rule] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[IsMandatory] [bit] NOT NULL,
[RuleParameters] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Value2] [nvarchar] (250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Condition] ADD CONSTRAINT [PK_Condition] PRIMARY KEY NONCLUSTERED ([Id]) ON [PRIMARY]
GO
