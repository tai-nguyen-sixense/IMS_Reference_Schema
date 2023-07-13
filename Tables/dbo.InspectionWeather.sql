CREATE TABLE [dbo].[InspectionWeather]
(
[Id] [uniqueidentifier] NOT NULL,
[InspectionId] [uniqueidentifier] NOT NULL,
[WeatherId] [uniqueidentifier] NOT NULL,
[BeginDate] [smalldatetime] NOT NULL,
[EndDate] [smalldatetime] NOT NULL,
[Temperature] [float] NOT NULL,
[Comments] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[LastModified] [smalldatetime] NOT NULL,
[UserId] [uniqueidentifier] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[InspectionWeather] ADD CONSTRAINT [PK_InspectionWheather] PRIMARY KEY NONCLUSTERED ([Id]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[InspectionWeather] ADD CONSTRAINT [FK_InspectionWheather_Inspection] FOREIGN KEY ([InspectionId]) REFERENCES [dbo].[Inspection] ([Id])
GO
ALTER TABLE [dbo].[InspectionWeather] ADD CONSTRAINT [FK_InspectionWheather_User] FOREIGN KEY ([UserId]) REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[InspectionWeather] ADD CONSTRAINT [FK_InspectionWheather_Weather] FOREIGN KEY ([WeatherId]) REFERENCES [dbo].[Weather] ([Id])
GO
