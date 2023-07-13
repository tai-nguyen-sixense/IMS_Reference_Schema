CREATE TABLE [dbo].[DefectType_Attribute]
(
[DefectTypeId] [uniqueidentifier] NOT NULL,
[AttributeFieldId] [uniqueidentifier] NOT NULL,
[IsActive] [bit] NOT NULL,
[Position] [int] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[DefectType_Attribute] ADD CONSTRAINT [PK_DefectKnowledge_Attribute] PRIMARY KEY NONCLUSTERED ([DefectTypeId], [AttributeFieldId]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[DefectType_Attribute] ADD CONSTRAINT [FK_DefectKnowledge_Attribute_AttributeField] FOREIGN KEY ([AttributeFieldId]) REFERENCES [dbo].[AttributeField] ([Id])
GO
ALTER TABLE [dbo].[DefectType_Attribute] ADD CONSTRAINT [FK_DefectKnowledge_Attribute_DefectKnowledge] FOREIGN KEY ([DefectTypeId]) REFERENCES [dbo].[DefectType] ([Id])
GO
