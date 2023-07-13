CREATE TABLE [dbo].[InspectionType]
(
[Id] [uniqueidentifier] NOT NULL,
[Name] [nvarchar] (4000) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Description] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Icon] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Color] [nvarchar] (4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Position] [int] NOT NULL,
[ManagementRestrictedTo] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[SpanCoefficient] [nvarchar] (32) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[SMInterface] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[IsRetired] [bit] NOT NULL CONSTRAINT [DF_InspectionType_IsRetired] DEFAULT ((0)),
[FatherId] [uniqueidentifier] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[InspectionType] ADD CONSTRAINT [PK_InspectionType] PRIMARY KEY NONCLUSTERED ([Id]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[InspectionType] ADD CONSTRAINT [FK_InspectionType_InspectionType] FOREIGN KEY ([FatherId]) REFERENCES [dbo].[InspectionType] ([Id])
GO
