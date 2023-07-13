CREATE TABLE [dbo].[InspectionType_InspectionSheet]
(
[InspectionTypeId] [uniqueidentifier] NOT NULL,
[InspectionSheetId] [uniqueidentifier] NOT NULL,
[Position] [int] NOT NULL,
[ValidFrom] [datetime] NOT NULL,
[ValidTo] [datetime] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[InspectionType_InspectionSheet] ADD CONSTRAINT [PK_InspectionType-InspectionSheet] PRIMARY KEY NONCLUSTERED ([InspectionTypeId], [InspectionSheetId]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[InspectionType_InspectionSheet] ADD CONSTRAINT [FK_InspectionType_InspectionSheet_InspectionSheet] FOREIGN KEY ([InspectionSheetId]) REFERENCES [dbo].[InspectionSheet] ([Id])
GO
ALTER TABLE [dbo].[InspectionType_InspectionSheet] ADD CONSTRAINT [FK_InspectionType_InspectionSheet_InspectionType] FOREIGN KEY ([InspectionTypeId]) REFERENCES [dbo].[InspectionType] ([Id])
GO
