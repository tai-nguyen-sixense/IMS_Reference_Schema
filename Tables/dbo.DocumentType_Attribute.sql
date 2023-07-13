CREATE TABLE [dbo].[DocumentType_Attribute]
(
[DocumentTypeId] [uniqueidentifier] NOT NULL,
[AttributeFieldId] [uniqueidentifier] NOT NULL,
[IsActive] [bit] NOT NULL,
[Position] [int] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[DocumentType_Attribute] ADD CONSTRAINT [PK_DocumentType_Attribute] PRIMARY KEY NONCLUSTERED ([DocumentTypeId], [AttributeFieldId]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[DocumentType_Attribute] ADD CONSTRAINT [FK_DocumentType_Attribute_AttributeField] FOREIGN KEY ([AttributeFieldId]) REFERENCES [dbo].[AttributeField] ([Id])
GO
ALTER TABLE [dbo].[DocumentType_Attribute] ADD CONSTRAINT [FK_DocumentType_Attribute_DocumentType] FOREIGN KEY ([DocumentTypeId]) REFERENCES [dbo].[DocumentType] ([Id])
GO
