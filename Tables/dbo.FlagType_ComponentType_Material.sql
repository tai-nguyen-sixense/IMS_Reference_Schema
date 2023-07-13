CREATE TABLE [dbo].[FlagType_ComponentType_Material]
(
[Id] [uniqueidentifier] NOT NULL,
[FlagTypeId] [uniqueidentifier] NOT NULL,
[ComponentTypeId] [uniqueidentifier] NULL,
[MaterialId] [uniqueidentifier] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[FlagType_ComponentType_Material] ADD CONSTRAINT [PK_FlagType_ComponentType_Material] PRIMARY KEY NONCLUSTERED ([Id]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[FlagType_ComponentType_Material] ADD CONSTRAINT [FK_FlagType_ComponentType_Material_ComponentType] FOREIGN KEY ([ComponentTypeId]) REFERENCES [dbo].[ComponentType] ([Id])
GO
ALTER TABLE [dbo].[FlagType_ComponentType_Material] ADD CONSTRAINT [FK_FlagType_ComponentType_Material_FlagType] FOREIGN KEY ([FlagTypeId]) REFERENCES [dbo].[FlagType] ([Id])
GO
ALTER TABLE [dbo].[FlagType_ComponentType_Material] ADD CONSTRAINT [FK_FlagType_ComponentType_Material_Material] FOREIGN KEY ([MaterialId]) REFERENCES [dbo].[Material] ([Id])
GO
