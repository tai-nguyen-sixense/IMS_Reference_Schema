CREATE TABLE [dbo].[LinkedType_Attribute]
(
[LinkedTypeId] [uniqueidentifier] NOT NULL,
[AttributeFieldId] [uniqueidentifier] NOT NULL,
[IsActive] [bit] NOT NULL,
[Position] [int] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[LinkedType_Attribute] ADD CONSTRAINT [PK_LinkedType_Attribute] PRIMARY KEY NONCLUSTERED ([LinkedTypeId], [AttributeFieldId]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[LinkedType_Attribute] ADD CONSTRAINT [FK_LinkedType_Attribute_AttributeField] FOREIGN KEY ([AttributeFieldId]) REFERENCES [dbo].[AttributeField] ([Id])
GO
ALTER TABLE [dbo].[LinkedType_Attribute] ADD CONSTRAINT [FK_LinkedType_Attribute_LinkedType] FOREIGN KEY ([LinkedTypeId]) REFERENCES [dbo].[LinkedTypes] ([Id])
GO
