CREATE TABLE [dbo].[InspectionMaster]
(
[Id] [uniqueidentifier] NOT NULL,
[AssetId] [uniqueidentifier] NOT NULL,
[InspectionTypeId] [uniqueidentifier] NOT NULL,
[Frequency] [int] NOT NULL,
[DueDate] [smalldatetime] NOT NULL,
[Comments] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[TimeToPerform] [decimal] (10, 2) NULL,
[IsActive] [bit] NOT NULL,
[LastModified] [smalldatetime] NOT NULL,
[UserId] [uniqueidentifier] NOT NULL,
[Name] [nvarchar] (4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[SpanWeight] [numeric] (18, 2) NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[InspectionMaster] ADD CONSTRAINT [PK_InspectionMaster] PRIMARY KEY NONCLUSTERED ([Id]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[InspectionMaster] ADD CONSTRAINT [FK_InspectionMaster_Asset] FOREIGN KEY ([AssetId]) REFERENCES [dbo].[Asset] ([Id])
GO
ALTER TABLE [dbo].[InspectionMaster] ADD CONSTRAINT [FK_InspectionMaster_InspectionType] FOREIGN KEY ([InspectionTypeId]) REFERENCES [dbo].[InspectionType] ([Id])
GO
ALTER TABLE [dbo].[InspectionMaster] ADD CONSTRAINT [FK_InspectionMaster_User] FOREIGN KEY ([UserId]) REFERENCES [dbo].[User] ([Id])
GO
