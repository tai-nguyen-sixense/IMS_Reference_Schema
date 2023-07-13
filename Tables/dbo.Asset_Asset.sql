CREATE TABLE [dbo].[Asset_Asset]
(
[Id] [uniqueidentifier] NOT NULL,
[LinkedTypesId] [uniqueidentifier] NOT NULL,
[Asset1Id] [uniqueidentifier] NOT NULL,
[Asset2Id] [uniqueidentifier] NOT NULL,
[DateLinked] [datetime] NOT NULL,
[Comments] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[UserId] [uniqueidentifier] NOT NULL,
[GeographyId] [uniqueidentifier] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Asset_Asset] ADD CONSTRAINT [PK_Asset_Asset] PRIMARY KEY NONCLUSTERED ([Id]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Asset_Asset] ADD CONSTRAINT [FK_Asset_Asset_Asset] FOREIGN KEY ([Asset1Id]) REFERENCES [dbo].[Asset] ([Id])
GO
ALTER TABLE [dbo].[Asset_Asset] ADD CONSTRAINT [FK_Asset_Asset_Asset1] FOREIGN KEY ([Asset2Id]) REFERENCES [dbo].[Asset] ([Id])
GO
ALTER TABLE [dbo].[Asset_Asset] ADD CONSTRAINT [FK_Asset_Asset_Geography] FOREIGN KEY ([GeographyId]) REFERENCES [dbo].[Geography] ([Id])
GO
ALTER TABLE [dbo].[Asset_Asset] ADD CONSTRAINT [FK_Asset_Asset_LinkedTypes] FOREIGN KEY ([LinkedTypesId]) REFERENCES [dbo].[LinkedTypes] ([Id])
GO
ALTER TABLE [dbo].[Asset_Asset] ADD CONSTRAINT [FK_Asset_Asset_User] FOREIGN KEY ([UserId]) REFERENCES [dbo].[User] ([Id])
GO
