CREATE TABLE [dbo].[InspectionFileSchema_InspectionType]
(
[InspectionFileSchemaId] [uniqueidentifier] NOT NULL,
[InspectionTypeId] [uniqueidentifier] NOT NULL,
[Comments] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[InspectionFileSchema_InspectionType] ADD CONSTRAINT [PK_InspectionFileSchema_InspectionType] PRIMARY KEY NONCLUSTERED ([InspectionFileSchemaId], [InspectionTypeId]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[InspectionFileSchema_InspectionType] ADD CONSTRAINT [FK_InspectionFileSchema_InspectionType_InspectionFileSchema] FOREIGN KEY ([InspectionFileSchemaId]) REFERENCES [dbo].[InspectionFileSchema] ([Id])
GO
ALTER TABLE [dbo].[InspectionFileSchema_InspectionType] ADD CONSTRAINT [FK_InspectionFileSchema_InspectionType_InspectionType] FOREIGN KEY ([InspectionTypeId]) REFERENCES [dbo].[InspectionType] ([Id])
GO
