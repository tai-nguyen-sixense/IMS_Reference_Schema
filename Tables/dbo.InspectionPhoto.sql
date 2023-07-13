CREATE TABLE [dbo].[InspectionPhoto]
(
[Id] [uniqueidentifier] NOT NULL,
[Number] [nvarchar] (4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[PhotoId] [uniqueidentifier] NULL,
[PositionX] [numeric] (18, 4) NULL,
[PositionY] [numeric] (18, 4) NULL,
[LastModified] [datetime] NOT NULL,
[UserId] [uniqueidentifier] NOT NULL,
[Orientation] [numeric] (18, 4) NULL,
[IsAbove] [bit] NOT NULL,
[FileName] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Comments] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Location] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ToPrintInReport] [bit] NOT NULL,
[AssetId] [uniqueidentifier] NOT NULL,
[DrawingShapes] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[IsSchema] [bit] NOT NULL,
[NumberForReport] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[FileUploadComplete] [bit] NOT NULL,
[Longitude] [float] NULL,
[Latitude] [float] NULL,
[GeographyId] [uniqueidentifier] NULL,
[IsSignature] [bit] NULL,
[PictureDate] [smalldatetime] NOT NULL CONSTRAINT [DF__Inspectio__Pictu__0579B962] DEFAULT (getdate()),
[Markup] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[InspectionPhoto] ADD CONSTRAINT [PK_InspectionPhoto_1] PRIMARY KEY NONCLUSTERED ([Id]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[InspectionPhoto] ADD CONSTRAINT [FK_InspectionPhoto_Asset] FOREIGN KEY ([AssetId]) REFERENCES [dbo].[Asset] ([Id])
GO
ALTER TABLE [dbo].[InspectionPhoto] ADD CONSTRAINT [FK_InspectionPhoto_Photo] FOREIGN KEY ([PhotoId]) REFERENCES [dbo].[Photo] ([Id])
GO
ALTER TABLE [dbo].[InspectionPhoto] ADD CONSTRAINT [FK_InspectionPhoto_User] FOREIGN KEY ([UserId]) REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[InspectionPhoto] ADD CONSTRAINT [FK__Inspectio__IdGeo__174363E2] FOREIGN KEY ([GeographyId]) REFERENCES [dbo].[Geography] ([Id])
GO
