CREATE TABLE [dbo].[Photo]
(
[Id] [uniqueidentifier] NOT NULL,
[AssetId] [uniqueidentifier] NOT NULL,
[Name] [nvarchar] (4000) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Comments] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[FileName] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[PictureDate] [smalldatetime] NOT NULL,
[IsUsedForInspection] [bit] NOT NULL,
[LastModified] [smalldatetime] NOT NULL,
[UserId] [uniqueidentifier] NOT NULL,
[PhotoTypeId] [uniqueidentifier] NULL,
[AuthorId] [uniqueidentifier] NOT NULL,
[LandmarkId] [uniqueidentifier] NULL,
[DeltaX] [float] NULL,
[DeltaY] [float] NULL,
[DeltaZ] [float] NULL,
[FileUploadComplete] [bit] NOT NULL,
[IsValidUntil] [smalldatetime] NULL,
[GeographyId] [uniqueidentifier] NULL,
[SurveyId] [uniqueidentifier] NULL,
[Markup] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Photo] ADD CONSTRAINT [PK_Photo] PRIMARY KEY NONCLUSTERED ([Id]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Photo] ADD CONSTRAINT [FK_Photo_Asset] FOREIGN KEY ([AssetId]) REFERENCES [dbo].[Asset] ([Id])
GO
ALTER TABLE [dbo].[Photo] ADD CONSTRAINT [FK_Photo_Landmark] FOREIGN KEY ([LandmarkId]) REFERENCES [dbo].[Landmark] ([Id])
GO
ALTER TABLE [dbo].[Photo] ADD CONSTRAINT [FK_Photo_PhotoType1] FOREIGN KEY ([PhotoTypeId]) REFERENCES [dbo].[PhotoType] ([Id])
GO
ALTER TABLE [dbo].[Photo] ADD CONSTRAINT [FK_Photo_User] FOREIGN KEY ([UserId]) REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[Photo] ADD CONSTRAINT [FK_Photo_User1] FOREIGN KEY ([AuthorId]) REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[Photo] ADD CONSTRAINT [FK__Photo__IdGeograp__7E42ABEE] FOREIGN KEY ([GeographyId]) REFERENCES [dbo].[Geography] ([Id])
GO
ALTER TABLE [dbo].[Photo] ADD CONSTRAINT [FK__Photo__SurveyId__7F36D027] FOREIGN KEY ([SurveyId]) REFERENCES [dbo].[Survey] ([Id])
GO
