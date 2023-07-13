CREATE TABLE [dbo].[ComponentType_Material]
(
[ComponentTypeId] [uniqueidentifier] NOT NULL,
[MaterialId] [uniqueidentifier] NOT NULL,
[Position] [int] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ComponentType_Material] ADD CONSTRAINT [PK_ComponentType_Material] PRIMARY KEY NONCLUSTERED ([ComponentTypeId], [MaterialId]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ComponentType_Material] ADD CONSTRAINT [FK_ComponentType_Material_ComponentType] FOREIGN KEY ([ComponentTypeId]) REFERENCES [dbo].[ComponentType] ([Id])
GO
ALTER TABLE [dbo].[ComponentType_Material] ADD CONSTRAINT [FK_ComponentType_Material_Material] FOREIGN KEY ([MaterialId]) REFERENCES [dbo].[Material] ([Id])
GO
