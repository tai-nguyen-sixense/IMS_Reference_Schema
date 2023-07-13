CREATE TABLE [dbo].[ComponentTypeShapeAttribute]
(
[ComponentTypeShapeId] [uniqueidentifier] NOT NULL,
[AttributeFieldId] [uniqueidentifier] NOT NULL,
[PositionX] [float] NULL,
[PositionY] [float] NULL,
[RotateAngle] [float] NULL,
[ViewLabel] [bit] NOT NULL,
[LabelWidth] [float] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ComponentTypeShapeAttribute] ADD CONSTRAINT [PK_ComponentTypeShapeAttribute] PRIMARY KEY NONCLUSTERED ([ComponentTypeShapeId], [AttributeFieldId]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ComponentTypeShapeAttribute] ADD CONSTRAINT [FK_ComponentTypeShapeAttribute_AttributeField] FOREIGN KEY ([AttributeFieldId]) REFERENCES [dbo].[AttributeField] ([Id])
GO
ALTER TABLE [dbo].[ComponentTypeShapeAttribute] ADD CONSTRAINT [FK_ComponentTypeShapeAttribute_ComponentTypeShape] FOREIGN KEY ([ComponentTypeShapeId]) REFERENCES [dbo].[ComponentTypeShape] ([Id])
GO
