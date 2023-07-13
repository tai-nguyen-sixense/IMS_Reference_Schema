CREATE TABLE [dbo].[InspectionSheet_ComponentType]
(
[InspectionSheetId] [uniqueidentifier] NOT NULL,
[ComponentTypeId] [uniqueidentifier] NOT NULL,
[Position] [int] NOT NULL,
[ValidFrom] [datetime] NOT NULL,
[ValidTo] [datetime] NULL,
[Description] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[InspectionSheet_ComponentType] ADD CONSTRAINT [PK_InspectionSheet_ComponentType] PRIMARY KEY NONCLUSTERED ([InspectionSheetId], [ComponentTypeId]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[InspectionSheet_ComponentType] ADD CONSTRAINT [FK_InspectionSheet_ComponentType_ComponentType] FOREIGN KEY ([ComponentTypeId]) REFERENCES [dbo].[ComponentType] ([Id])
GO
ALTER TABLE [dbo].[InspectionSheet_ComponentType] ADD CONSTRAINT [FK_InspectionSheet_ComponentType_InspectionSheet] FOREIGN KEY ([InspectionSheetId]) REFERENCES [dbo].[InspectionSheet] ([Id])
GO
