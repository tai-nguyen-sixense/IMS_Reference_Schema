CREATE TABLE [dbo].[InspectionDocument_Survey]
(
[InspectionDocumentId] [uniqueidentifier] NOT NULL,
[SurveyId] [uniqueidentifier] NOT NULL,
[DateLinked] [datetime] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[InspectionDocument_Survey] ADD CONSTRAINT [PK_InspectionDocument_Survey] PRIMARY KEY NONCLUSTERED ([InspectionDocumentId], [SurveyId]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[InspectionDocument_Survey] ADD CONSTRAINT [FK_InspectionDocument_Survey_InspectionDocument] FOREIGN KEY ([InspectionDocumentId]) REFERENCES [dbo].[InspectionDocument] ([Id])
GO
ALTER TABLE [dbo].[InspectionDocument_Survey] ADD CONSTRAINT [FK_InspectionDocument_Survey_Survey] FOREIGN KEY ([SurveyId]) REFERENCES [dbo].[Survey] ([Id])
GO
