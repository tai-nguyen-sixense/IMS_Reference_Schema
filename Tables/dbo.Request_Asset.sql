CREATE TABLE [dbo].[Request_Asset]
(
[RequestId] [uniqueidentifier] NOT NULL,
[AssetId] [uniqueidentifier] NOT NULL,
[AssetIndex] [int] NOT NULL,
[RequestValid] [bit] NOT NULL,
[Comments] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Request_Asset] ADD CONSTRAINT [PK_Request_Asset] PRIMARY KEY NONCLUSTERED ([RequestId], [AssetId]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Request_Asset] ADD CONSTRAINT [FK_Request_Asset_Asset] FOREIGN KEY ([AssetId]) REFERENCES [dbo].[Asset] ([Id])
GO
ALTER TABLE [dbo].[Request_Asset] ADD CONSTRAINT [FK_Request_Asset_Request] FOREIGN KEY ([RequestId]) REFERENCES [dbo].[Request] ([Id])
GO
