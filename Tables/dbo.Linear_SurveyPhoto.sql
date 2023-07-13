CREATE TABLE [dbo].[Linear_SurveyPhoto]
(
[Id] [uniqueidentifier] NOT NULL,
[Linear_SurveyId] [uniqueidentifier] NOT NULL,
[Name] [nvarchar] (4000) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Comments] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CreationDate] [datetime] NOT NULL,
[FilePath] [nvarchar] (4000) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[PositionX] [float] NOT NULL,
[LastModified] [datetime] NOT NULL,
[UserId] [uniqueidentifier] NOT NULL,
[AssetId] [uniqueidentifier] NOT NULL,
[FileUploadComplete] [bit] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Linear_SurveyPhoto] ADD CONSTRAINT [PK_Linear_SurveyPhoto] PRIMARY KEY NONCLUSTERED ([Id]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Linear_SurveyPhoto] ADD CONSTRAINT [FK_Linear_SurveyPhoto_Asset] FOREIGN KEY ([AssetId]) REFERENCES [dbo].[Asset] ([Id])
GO
ALTER TABLE [dbo].[Linear_SurveyPhoto] ADD CONSTRAINT [FK_Linear_SurveyPhoto_Linear_Survey] FOREIGN KEY ([Linear_SurveyId]) REFERENCES [dbo].[Linear_Survey] ([Id])
GO
ALTER TABLE [dbo].[Linear_SurveyPhoto] ADD CONSTRAINT [FK_Linear_SurveyPhoto_User] FOREIGN KEY ([UserId]) REFERENCES [dbo].[User] ([Id])
GO
