CREATE TABLE [dbo].[InspectionDataFile]
(
[Id] [uniqueidentifier] NOT NULL,
[InspectionId] [uniqueidentifier] NOT NULL,
[SchemaId] [uniqueidentifier] NOT NULL,
[UserId] [uniqueidentifier] NOT NULL,
[UploadDate] [datetime] NOT NULL,
[WasPushedToDB] [bit] NOT NULL,
[FileUploadComplete] [bit] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[InspectionDataFile] ADD CONSTRAINT [PK_InspectionDataFile] PRIMARY KEY NONCLUSTERED ([Id]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[InspectionDataFile] ADD CONSTRAINT [FK_InspectionDataFile_Inspection] FOREIGN KEY ([InspectionId]) REFERENCES [dbo].[Inspection] ([Id])
GO
ALTER TABLE [dbo].[InspectionDataFile] ADD CONSTRAINT [FK_InspectionDataFile_InspectionFileSchema] FOREIGN KEY ([SchemaId]) REFERENCES [dbo].[InspectionFileSchema] ([Id])
GO
ALTER TABLE [dbo].[InspectionDataFile] ADD CONSTRAINT [FK_InspectionDataFile_User] FOREIGN KEY ([UserId]) REFERENCES [dbo].[User] ([Id])
GO
