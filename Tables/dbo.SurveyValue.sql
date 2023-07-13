CREATE TABLE [dbo].[SurveyValue]
(
[Id] [uniqueidentifier] NOT NULL,
[SurveyId] [uniqueidentifier] NOT NULL,
[AttributeFieldId] [uniqueidentifier] NOT NULL,
[LandmarkId] [uniqueidentifier] NOT NULL,
[DeltaX] [float] NOT NULL,
[DeltaY] [float] NOT NULL,
[DeltaZ] [float] NOT NULL,
[Value] [float] NULL,
[Comments] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[LastModified] [smalldatetime] NOT NULL,
[UserId] [uniqueidentifier] NOT NULL,
[GeographyId] [uniqueidentifier] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[SurveyValue] ADD CONSTRAINT [PK_SurveyValue] PRIMARY KEY NONCLUSTERED ([Id]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[SurveyValue] ADD CONSTRAINT [FK_SurveyValue_AttributeField] FOREIGN KEY ([AttributeFieldId]) REFERENCES [dbo].[AttributeField] ([Id])
GO
ALTER TABLE [dbo].[SurveyValue] ADD CONSTRAINT [FK_SurveyValue_Landmark] FOREIGN KEY ([LandmarkId]) REFERENCES [dbo].[Landmark] ([Id])
GO
ALTER TABLE [dbo].[SurveyValue] ADD CONSTRAINT [FK_SurveyValue_Survey] FOREIGN KEY ([SurveyId]) REFERENCES [dbo].[Survey] ([Id])
GO
ALTER TABLE [dbo].[SurveyValue] ADD CONSTRAINT [FK_SurveyValue_User] FOREIGN KEY ([UserId]) REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[SurveyValue] ADD CONSTRAINT [FK__SurveyVal__IdGeo__3C3FDE67] FOREIGN KEY ([GeographyId]) REFERENCES [dbo].[Geography] ([Id])
GO
