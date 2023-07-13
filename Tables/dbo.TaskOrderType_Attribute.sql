CREATE TABLE [dbo].[TaskOrderType_Attribute]
(
[TaskOrderTypeId] [uniqueidentifier] NOT NULL,
[AttributeFieldId] [uniqueidentifier] NOT NULL,
[Position] [int] NOT NULL,
[IsActive] [bit] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[TaskOrderType_Attribute] ADD CONSTRAINT [PK_TaskOrderType_Attribute] PRIMARY KEY NONCLUSTERED ([TaskOrderTypeId], [AttributeFieldId]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[TaskOrderType_Attribute] ADD CONSTRAINT [FK_AttributeFieldId] FOREIGN KEY ([AttributeFieldId]) REFERENCES [dbo].[AttributeField] ([Id])
GO
ALTER TABLE [dbo].[TaskOrderType_Attribute] ADD CONSTRAINT [FK_TaskOrderTypeId] FOREIGN KEY ([TaskOrderTypeId]) REFERENCES [dbo].[TaskOrderType] ([Id])
GO
