CREATE TABLE [dbo].[BIReportRole]
(
[BiReportId] [uniqueidentifier] NOT NULL,
[RoleId] [uniqueidentifier] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[BIReportRole] ADD CONSTRAINT [PK_BiReportRole] PRIMARY KEY NONCLUSTERED ([BiReportId], [RoleId]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[BIReportRole] ADD CONSTRAINT [FK_BIReportRole_BIReport] FOREIGN KEY ([BiReportId]) REFERENCES [dbo].[BIReport] ([Id])
GO
ALTER TABLE [dbo].[BIReportRole] ADD CONSTRAINT [FK_BIReportRole_Role] FOREIGN KEY ([RoleId]) REFERENCES [dbo].[Role] ([Id])
GO
