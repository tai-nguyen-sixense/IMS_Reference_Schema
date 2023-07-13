CREATE TABLE [dbo].[RainFlow_CumulativeCount]
(
[DataSensorId] [uniqueidentifier] NOT NULL,
[AmplitudeQuantum] [int] NULL,
[Counts] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[RainFlow_CumulativeCount] ADD CONSTRAINT [FK_RainFlow_CumulativeCount_ComponentType] FOREIGN KEY ([DataSensorId]) REFERENCES [dbo].[ComponentType] ([Id])
GO
