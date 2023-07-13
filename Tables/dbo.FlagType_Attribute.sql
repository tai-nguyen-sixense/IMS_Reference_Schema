CREATE TABLE [dbo].[FlagType_Attribute]
(
[FlagTypeId] [uniqueidentifier] NOT NULL,
[AttributeFieldId] [uniqueidentifier] NOT NULL,
[IsActive] [bit] NOT NULL,
[Position] [int] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[FlagType_Attribute] ADD CONSTRAINT [PK_FlagType_Attribute] PRIMARY KEY NONCLUSTERED ([FlagTypeId], [AttributeFieldId]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[FlagType_Attribute] ADD CONSTRAINT [FK_FlagType_Attribute_AttributeField] FOREIGN KEY ([AttributeFieldId]) REFERENCES [dbo].[AttributeField] ([Id])
GO
ALTER TABLE [dbo].[FlagType_Attribute] ADD CONSTRAINT [FK_FlagType_Attribute_FlagType] FOREIGN KEY ([FlagTypeId]) REFERENCES [dbo].[FlagType] ([Id])
GO
