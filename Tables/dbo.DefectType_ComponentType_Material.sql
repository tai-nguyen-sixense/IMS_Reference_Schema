CREATE TABLE [dbo].[DefectType_ComponentType_Material]
(
[Id] [uniqueidentifier] NOT NULL,
[DefectTypeId] [uniqueidentifier] NOT NULL,
[ComponentTypeId] [uniqueidentifier] NULL,
[MaterialId] [uniqueidentifier] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[DefectType_ComponentType_Material] ADD CONSTRAINT [PK_DefectType_ComponentType_Material] PRIMARY KEY NONCLUSTERED ([Id]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[DefectType_ComponentType_Material] ADD CONSTRAINT [FK_DefectType_ComponentType_Material_ComponentType] FOREIGN KEY ([ComponentTypeId]) REFERENCES [dbo].[ComponentType] ([Id])
GO
ALTER TABLE [dbo].[DefectType_ComponentType_Material] ADD CONSTRAINT [FK_DefectType_ComponentType_Material_DefectType] FOREIGN KEY ([DefectTypeId]) REFERENCES [dbo].[DefectType] ([Id])
GO
ALTER TABLE [dbo].[DefectType_ComponentType_Material] ADD CONSTRAINT [FK_DefectType_ComponentType_Material_Material] FOREIGN KEY ([MaterialId]) REFERENCES [dbo].[Material] ([Id])
GO
