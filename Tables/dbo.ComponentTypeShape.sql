CREATE TABLE [dbo].[ComponentTypeShape]
(
[Id] [uniqueidentifier] NOT NULL,
[ComponentTypeId] [uniqueidentifier] NOT NULL,
[AttributeFieldId_A] [uniqueidentifier] NULL,
[AttributeFieldId_B] [uniqueidentifier] NULL,
[AttributeFieldId_C] [uniqueidentifier] NULL,
[Shape] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Name] [nvarchar] (4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ComponentTypeShape] ADD CONSTRAINT [PK_ComponentTypeShape] PRIMARY KEY NONCLUSTERED ([Id]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ComponentTypeShape] ADD CONSTRAINT [FK_ComponentTypeShape_AttributeField] FOREIGN KEY ([AttributeFieldId_A]) REFERENCES [dbo].[AttributeField] ([Id])
GO
ALTER TABLE [dbo].[ComponentTypeShape] ADD CONSTRAINT [FK_ComponentTypeShape_AttributeField1] FOREIGN KEY ([AttributeFieldId_B]) REFERENCES [dbo].[AttributeField] ([Id])
GO
ALTER TABLE [dbo].[ComponentTypeShape] ADD CONSTRAINT [FK_ComponentTypeShape_AttributeField2] FOREIGN KEY ([AttributeFieldId_C]) REFERENCES [dbo].[AttributeField] ([Id])
GO
ALTER TABLE [dbo].[ComponentTypeShape] ADD CONSTRAINT [FK_ComponentTypeShape_ComponentType] FOREIGN KEY ([ComponentTypeId]) REFERENCES [dbo].[ComponentType] ([Id])
GO
