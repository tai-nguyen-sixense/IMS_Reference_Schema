CREATE TABLE [dbo].[FlowDataGraph]
(
[Id] [uniqueidentifier] NOT NULL,
[Name] [nvarchar] (4000) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Description] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Parameters] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[LastModified] [smalldatetime] NOT NULL,
[UserId] [uniqueidentifier] NOT NULL,
[AuthorId] [uniqueidentifier] NOT NULL,
[IsReport] [bit] NOT NULL,
[Title] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ScaleYPrimaryMax] [float] NULL,
[ScaleYPrimaryMin] [float] NULL,
[ScaleYSecondaryMax] [float] NULL,
[ScaleYSecondaryMin] [float] NULL,
[DateBegin] [datetime] NULL,
[DateEnd] [datetime] NULL,
[DateRelative] [bit] NOT NULL,
[IsForValidation] [bit] NOT NULL,
[IsPrivate] [bit] NOT NULL,
[ScaleXIsTemporal] [bit] NOT NULL CONSTRAINT [DF__FlowDataGraph_ScaleXIsTemporal] DEFAULT ((0)),
[ScaleXMax] [float] NULL,
[ScaleXMin] [float] NULL,
[ScaleZMax] [float] NULL,
[ScaleZMin] [float] NULL,
[ScaleYPrimaryStep] [float] NULL,
[ScaleYSecondaryStep] [float] NULL,
[ScaleXStep] [float] NULL,
[ScaleZStep] [float] NULL,
[ScaleXYIsLogarithmic] [bit] NOT NULL CONSTRAINT [DF__FlowDataGraph_ScaleXYIsLogarithmic] DEFAULT ((0)),
[ReportModelId] [uniqueidentifier] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[FlowDataGraph] ADD CONSTRAINT [PK_FlowDataGraph] PRIMARY KEY NONCLUSTERED ([Id]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[FlowDataGraph] ADD CONSTRAINT [FK_FlowDataGraph_ReportModel] FOREIGN KEY ([ReportModelId]) REFERENCES [dbo].[ReportModel] ([Id])
GO
ALTER TABLE [dbo].[FlowDataGraph] ADD CONSTRAINT [FK_FlowDataGraph_User] FOREIGN KEY ([UserId]) REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[FlowDataGraph] ADD CONSTRAINT [FK_FlowDataGraph_User1] FOREIGN KEY ([AuthorId]) REFERENCES [dbo].[User] ([Id])
GO
