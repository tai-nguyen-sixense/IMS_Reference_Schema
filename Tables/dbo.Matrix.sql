CREATE TABLE [dbo].[Matrix]
(
[Id] [uniqueidentifier] NOT NULL,
[Name] [nvarchar] (4000) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Comments] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[UserId] [uniqueidentifier] NOT NULL,
[LastModified] [smalldatetime] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Matrix] ADD CONSTRAINT [PK_Matrix] PRIMARY KEY NONCLUSTERED ([Id]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Matrix] ADD CONSTRAINT [FK_Matrix_User] FOREIGN KEY ([UserId]) REFERENCES [dbo].[User] ([Id])
GO
