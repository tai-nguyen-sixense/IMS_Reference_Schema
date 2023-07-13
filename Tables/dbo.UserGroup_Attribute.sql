CREATE TABLE [dbo].[UserGroup_Attribute]
(
[UserGroupId] [uniqueidentifier] NOT NULL,
[AttributeFieldId] [uniqueidentifier] NOT NULL,
[IsActive] [bit] NOT NULL,
[Position] [int] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[UserGroup_Attribute] ADD CONSTRAINT [PK_UserGroup_Attribute] PRIMARY KEY NONCLUSTERED ([UserGroupId], [AttributeFieldId]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[UserGroup_Attribute] ADD CONSTRAINT [FK_UserGroup_Attribute_AttributeField] FOREIGN KEY ([AttributeFieldId]) REFERENCES [dbo].[AttributeField] ([Id])
GO
ALTER TABLE [dbo].[UserGroup_Attribute] ADD CONSTRAINT [FK_UserGroup_Attribute_UserGroup] FOREIGN KEY ([UserGroupId]) REFERENCES [dbo].[UserGroup] ([Id])
GO
