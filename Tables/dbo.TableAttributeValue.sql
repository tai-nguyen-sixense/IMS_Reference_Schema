CREATE TABLE [dbo].[TableAttributeValue]
(
[Id] [uniqueidentifier] NOT NULL,
[FatherColValueId] [uniqueidentifier] NULL,
[FatherRowValueId] [uniqueidentifier] NULL,
[ColAttributeFieldId] [uniqueidentifier] NULL,
[RowAttributeFieldId] [uniqueidentifier] NULL,
[Position] [int] NULL,
[Value] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[TableRevisionId] [uniqueidentifier] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[TableAttributeValue] ADD CONSTRAINT [PK_TableAttributeValue] PRIMARY KEY CLUSTERED ([Id]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[TableAttributeValue] ADD CONSTRAINT [FK_TableAttributeValue_AttributeField] FOREIGN KEY ([RowAttributeFieldId]) REFERENCES [dbo].[AttributeField] ([Id])
GO
ALTER TABLE [dbo].[TableAttributeValue] ADD CONSTRAINT [FK_TableAttributeValue_TableFatherColValue] FOREIGN KEY ([FatherColValueId]) REFERENCES [dbo].[TableFatherColValue] ([Id])
GO
ALTER TABLE [dbo].[TableAttributeValue] ADD CONSTRAINT [FK_TableAttributeValue_TableFatherRowValue] FOREIGN KEY ([FatherRowValueId]) REFERENCES [dbo].[TableFatherRowValue] ([Id])
GO
ALTER TABLE [dbo].[TableAttributeValue] ADD CONSTRAINT [FK_TableAttributeValue_TableRevision] FOREIGN KEY ([TableRevisionId]) REFERENCES [dbo].[TableRevision] ([Id])
GO
ALTER TABLE [dbo].[TableAttributeValue] ADD CONSTRAINT [FK_TableAttributeValueCol_AttributeField] FOREIGN KEY ([ColAttributeFieldId]) REFERENCES [dbo].[AttributeField] ([Id])
GO
