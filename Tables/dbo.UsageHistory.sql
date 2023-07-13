CREATE TABLE [dbo].[UsageHistory]
(
[Id] [uniqueidentifier] NOT NULL,
[UsageChannelId] [uniqueidentifier] NOT NULL,
[DateOfCalculation] [datetime] NOT NULL,
[Usage] [float] NULL,
[RemainingDays] [float] NULL,
[FailureDate] [datetime] NULL,
[LimitUsed] [float] NULL,
[RegressionUsed] [int] NULL,
[DataUsed] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ModelValueUsed] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[RSquare] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[RSum] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[TempChannel] [uniqueidentifier] NULL,
[FileName] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[LastModified] [smalldatetime] NOT NULL,
[TrafficChannel] [uniqueidentifier] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[UsageHistory] ADD CONSTRAINT [PK_UsageHistory] PRIMARY KEY NONCLUSTERED ([Id]) ON [PRIMARY]
GO
