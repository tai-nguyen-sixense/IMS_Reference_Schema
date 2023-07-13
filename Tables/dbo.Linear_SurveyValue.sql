CREATE TABLE [dbo].[Linear_SurveyValue]
(
[Id] [uniqueidentifier] NOT NULL,
[Linear_SurveyId] [uniqueidentifier] NOT NULL,
[AttributeFieldId] [uniqueidentifier] NOT NULL,
[PositionXBegin] [float] NOT NULL,
[PositionXEnd] [float] NOT NULL,
[PositionYBegin] [float] NOT NULL,
[PositionYEnd] [float] NOT NULL,
[Value] [nvarchar] (4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Comments] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CreationDate] [datetime] NOT NULL,
[UserId] [uniqueidentifier] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Linear_SurveyValue] ADD CONSTRAINT [PK_Linear_SurveyValue] PRIMARY KEY NONCLUSTERED ([Id]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Linear_SurveyValue] ADD CONSTRAINT [FK_Linear_SurveyValue_AttributeField] FOREIGN KEY ([AttributeFieldId]) REFERENCES [dbo].[AttributeField] ([Id])
GO
ALTER TABLE [dbo].[Linear_SurveyValue] ADD CONSTRAINT [FK_Linear_SurveyValue_Linear_Survey] FOREIGN KEY ([Linear_SurveyId]) REFERENCES [dbo].[Linear_Survey] ([Id])
GO
ALTER TABLE [dbo].[Linear_SurveyValue] ADD CONSTRAINT [FK_Linear_SurveyValue_User] FOREIGN KEY ([UserId]) REFERENCES [dbo].[User] ([Id])
GO
