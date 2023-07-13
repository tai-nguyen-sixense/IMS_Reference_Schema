CREATE TABLE [dbo].[AuditType_Attribute]
(
[AuditTypeId] [uniqueidentifier] NOT NULL,
[AttributeFieldId] [uniqueidentifier] NOT NULL,
[IsActive] [bit] NOT NULL,
[Position] [int] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AuditType_Attribute] ADD CONSTRAINT [PK_AuditType_Attribute] PRIMARY KEY NONCLUSTERED ([AuditTypeId], [AttributeFieldId]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AuditType_Attribute] ADD CONSTRAINT [FK_AuditType_Attribute_AttributeField] FOREIGN KEY ([AttributeFieldId]) REFERENCES [dbo].[AttributeField] ([Id])
GO
ALTER TABLE [dbo].[AuditType_Attribute] ADD CONSTRAINT [FK_AuditType_Attribute_AuditType] FOREIGN KEY ([AuditTypeId]) REFERENCES [dbo].[AuditType] ([Id])
GO
