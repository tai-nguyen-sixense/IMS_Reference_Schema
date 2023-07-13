CREATE TABLE [dbo].[ContractDocument]
(
[Id] [uniqueidentifier] NOT NULL,
[Name] [nvarchar] (4000) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Comments] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[PathFile] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[LastModified] [smalldatetime] NOT NULL,
[UserId] [uniqueidentifier] NOT NULL,
[ContractId] [uniqueidentifier] NOT NULL,
[FileUploadComplete] [bit] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ContractDocument] ADD CONSTRAINT [PK_DocumentContract] PRIMARY KEY NONCLUSTERED ([Id]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ContractDocument] ADD CONSTRAINT [FK_ContractDocument_Contract] FOREIGN KEY ([ContractId]) REFERENCES [dbo].[Contract] ([Id])
GO
ALTER TABLE [dbo].[ContractDocument] ADD CONSTRAINT [FK_ContractDocument_User] FOREIGN KEY ([UserId]) REFERENCES [dbo].[User] ([Id])
GO
