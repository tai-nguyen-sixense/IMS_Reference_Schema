CREATE TABLE [dbo].[InspectionDrawing]
(
[Id] [uniqueidentifier] NOT NULL,
[Name] [nvarchar] (4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[FileName] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[DrawingType] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AssetId] [uniqueidentifier] NOT NULL,
[LastModified] [smalldatetime] NOT NULL,
[UserId] [uniqueidentifier] NOT NULL,
[Number] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[GeographyId] [uniqueidentifier] NULL,
[Scale] [float] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[InspectionDrawing] ADD CONSTRAINT [PK_InspectionDrawing] PRIMARY KEY NONCLUSTERED ([Id]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[InspectionDrawing] ADD CONSTRAINT [FK_InspectionDrawing_Asset] FOREIGN KEY ([AssetId]) REFERENCES [dbo].[Asset] ([Id])
GO
ALTER TABLE [dbo].[InspectionDrawing] ADD CONSTRAINT [FK_InspectionDrawing_Geography] FOREIGN KEY ([GeographyId]) REFERENCES [dbo].[Geography] ([Id])
GO
ALTER TABLE [dbo].[InspectionDrawing] ADD CONSTRAINT [FK_InspectionDrawing_User] FOREIGN KEY ([UserId]) REFERENCES [dbo].[User] ([Id])
GO
