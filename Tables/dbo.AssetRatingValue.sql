CREATE TABLE [dbo].[AssetRatingValue]
(
[AssetId] [uniqueidentifier] NOT NULL,
[AttributeFieldId] [uniqueidentifier] NOT NULL,
[Value] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Comments] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Date] [smalldatetime] NOT NULL,
[LastModified] [smalldatetime] NULL,
[UserId] [uniqueidentifier] NULL,
[ValueNumeric] [float] NULL,
[ValueDate] [datetime] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AssetRatingValue] ADD CONSTRAINT [PK_AssetRatingValue] PRIMARY KEY NONCLUSTERED ([AssetId], [AttributeFieldId], [Date]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AssetRatingValue] ADD CONSTRAINT [FK_AssetRatingValue_Asset] FOREIGN KEY ([AssetId]) REFERENCES [dbo].[Asset] ([Id])
GO
ALTER TABLE [dbo].[AssetRatingValue] ADD CONSTRAINT [FK_AssetRatingValue_AttributeField] FOREIGN KEY ([AttributeFieldId]) REFERENCES [dbo].[AttributeField] ([Id])
GO
ALTER TABLE [dbo].[AssetRatingValue] ADD CONSTRAINT [FK_AssetRatingValue_User] FOREIGN KEY ([UserId]) REFERENCES [dbo].[User] ([Id])
GO
