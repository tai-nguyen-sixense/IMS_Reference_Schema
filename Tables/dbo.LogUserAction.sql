CREATE TABLE [dbo].[LogUserAction]
(
[Id] [uniqueidentifier] NOT NULL,
[Date] [datetime] NULL,
[UserId] [uniqueidentifier] NOT NULL,
[Action] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Details] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[LogUserAction] ADD CONSTRAINT [PK_LogUserAction] PRIMARY KEY NONCLUSTERED ([Id]) ON [PRIMARY]
GO
EXEC sp_addextendedproperty N'MS_Description', N'Deprecated Silverlight. It was used to Log errors and user actions. The API now uses text file. Note that some SP are
using it as a log', 'SCHEMA', N'dbo', 'TABLE', N'LogUserAction', NULL, NULL
GO
