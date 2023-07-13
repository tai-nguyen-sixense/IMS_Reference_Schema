CREATE TABLE [dbo].[Contact]
(
[Id] [uniqueidentifier] NOT NULL,
[Name] [nvarchar] (4000) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Address] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Phone] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Fax] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Email] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[WebSite] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Comments] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[IsActive] [bit] NOT NULL,
[LastModified] [smalldatetime] NOT NULL,
[UserId] [uniqueidentifier] NOT NULL,
[FatherId] [uniqueidentifier] NULL,
[ContactTypeId] [uniqueidentifier] NULL,
[GeographyId] [uniqueidentifier] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Contact] ADD CONSTRAINT [PK_Contact] PRIMARY KEY NONCLUSTERED ([Id]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Contact] ADD CONSTRAINT [FK_Contact_Contact] FOREIGN KEY ([FatherId]) REFERENCES [dbo].[Contact] ([Id])
GO
ALTER TABLE [dbo].[Contact] ADD CONSTRAINT [FK_Contact_ContactType] FOREIGN KEY ([ContactTypeId]) REFERENCES [dbo].[ContactType] ([Id])
GO
ALTER TABLE [dbo].[Contact] ADD CONSTRAINT [FK_Contact_Geography] FOREIGN KEY ([GeographyId]) REFERENCES [dbo].[Geography] ([Id])
GO
ALTER TABLE [dbo].[Contact] ADD CONSTRAINT [FK_Contact_User] FOREIGN KEY ([UserId]) REFERENCES [dbo].[User] ([Id])
GO
