CREATE TABLE [dbo].[EquipmentUseAbility]
(
[UserId] [uniqueidentifier] NOT NULL,
[EquipmentTypeId] [uniqueidentifier] NOT NULL,
[Comments] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[EquipmentUseAbility] ADD CONSTRAINT [PK_EquipmentUseAbility] PRIMARY KEY NONCLUSTERED ([UserId], [EquipmentTypeId]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[EquipmentUseAbility] ADD CONSTRAINT [FK_EquipmentUseAbility_AssetType] FOREIGN KEY ([EquipmentTypeId]) REFERENCES [dbo].[AssetType] ([Id])
GO
ALTER TABLE [dbo].[EquipmentUseAbility] ADD CONSTRAINT [FK_EquipmentUseAbility_User] FOREIGN KEY ([UserId]) REFERENCES [dbo].[User] ([Id])
GO
