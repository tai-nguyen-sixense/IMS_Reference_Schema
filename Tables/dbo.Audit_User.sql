CREATE TABLE [dbo].[Audit_User]
(
[AuditId] [uniqueidentifier] NOT NULL,
[UserId] [uniqueidentifier] NOT NULL,
[Comments] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Audit_User] ADD CONSTRAINT [PK_Audit_User] PRIMARY KEY NONCLUSTERED ([AuditId], [UserId]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Audit_User] ADD CONSTRAINT [FK_Audit_User_Audit] FOREIGN KEY ([AuditId]) REFERENCES [dbo].[Audit] ([Id])
GO
ALTER TABLE [dbo].[Audit_User] ADD CONSTRAINT [FK_Audit_User_User] FOREIGN KEY ([UserId]) REFERENCES [dbo].[User] ([Id])
GO
