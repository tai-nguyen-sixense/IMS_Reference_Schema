CREATE TABLE [dbo].[User]
(
[Id] [uniqueidentifier] NOT NULL,
[Login] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Password] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[FirstName] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[LastName] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Initial] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Created] [smalldatetime] NOT NULL,
[Expires] [smalldatetime] NOT NULL,
[Email] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Phone] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Title] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Organization] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Status] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[SignatureFileName] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Badge] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ContactId] [uniqueidentifier] NULL,
[CustomColumns] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Settings] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CodePin] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[App5Settings] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[LastLoginDateTime] [datetime2] NULL,
[PasswordLastModified] [smalldatetime] NOT NULL CONSTRAINT [DF_User_PasswordLastModified] DEFAULT (getdate())
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[User] ADD CONSTRAINT [PK_User] PRIMARY KEY NONCLUSTERED ([Id]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[User] ADD CONSTRAINT [UC_User_Login] UNIQUE NONCLUSTERED ([Login]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[User] ADD CONSTRAINT [FK_User_Contact] FOREIGN KEY ([ContactId]) REFERENCES [dbo].[Contact] ([Id])
GO
