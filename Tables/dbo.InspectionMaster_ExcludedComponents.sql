CREATE TABLE [dbo].[InspectionMaster_ExcludedComponents]
(
[InspectionMasterId] [uniqueidentifier] NOT NULL,
[AssetComponentId] [uniqueidentifier] NOT NULL,
[IsWithChild] [bit] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[InspectionMaster_ExcludedComponents] ADD CONSTRAINT [PK_InspectionMaster-Component] PRIMARY KEY NONCLUSTERED ([InspectionMasterId], [AssetComponentId]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[InspectionMaster_ExcludedComponents] ADD CONSTRAINT [FK_InspectionMaster_Component_AssetComponent] FOREIGN KEY ([AssetComponentId]) REFERENCES [dbo].[AssetComponent] ([Id])
GO
ALTER TABLE [dbo].[InspectionMaster_ExcludedComponents] ADD CONSTRAINT [FK_InspectionMaster_Component_InspectionMaster] FOREIGN KEY ([InspectionMasterId]) REFERENCES [dbo].[InspectionMaster] ([Id])
GO
EXEC sp_addextendedproperty N'MS_Description', N'
List the components of an asset that you want to exclude from an inspection (based on the MasterId). This is useful
when the use of inspectionsheet is not enough. Careful, this is currently not implemented in the mobile.', 'SCHEMA', N'dbo', 'TABLE', N'InspectionMaster_ExcludedComponents', NULL, NULL
GO
