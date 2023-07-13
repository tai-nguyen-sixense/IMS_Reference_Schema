CREATE TABLE [dbo].[Contact_Asset]
(
[ContactId] [uniqueidentifier] NOT NULL,
[ContactTypeId] [uniqueidentifier] NOT NULL,
[AssetId] [uniqueidentifier] NOT NULL,
[DateLinked] [datetime] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Contact_Asset] ADD CONSTRAINT [PK_Contact_Asset] PRIMARY KEY NONCLUSTERED ([ContactId], [ContactTypeId], [AssetId]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Contact_Asset] ADD CONSTRAINT [FK_Contact_Asset_Asset] FOREIGN KEY ([AssetId]) REFERENCES [dbo].[Asset] ([Id])
GO
ALTER TABLE [dbo].[Contact_Asset] ADD CONSTRAINT [FK_Contact_Asset_Contact] FOREIGN KEY ([ContactId]) REFERENCES [dbo].[Contact] ([Id])
GO
ALTER TABLE [dbo].[Contact_Asset] ADD CONSTRAINT [FK_Contact_Asset_ContactType] FOREIGN KEY ([ContactTypeId]) REFERENCES [dbo].[ContactType] ([Id])
GO
