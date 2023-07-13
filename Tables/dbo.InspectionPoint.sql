CREATE TABLE [dbo].[InspectionPoint]
(
[Id] [uniqueidentifier] NOT NULL,
[InspectionId] [uniqueidentifier] NOT NULL,
[InspectionSheetId] [uniqueidentifier] NULL,
[AttributeFieldId] [uniqueidentifier] NOT NULL,
[AssetComponentId] [uniqueidentifier] NOT NULL,
[Value] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ValueBis] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[IsHighlighted] [bit] NOT NULL,
[LastModified] [smalldatetime] NOT NULL,
[UserId] [uniqueidentifier] NOT NULL,
[Comments] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CommentsBis] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ValueNumeric] [numeric] (18, 2) NULL,
[ValueDateComputed] AS (TRY_PARSE(left([value],(50)) AS [datetime]))
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[InspectionPoint] ADD CONSTRAINT [PK_InspectionPoint] PRIMARY KEY NONCLUSTERED ([Id]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[InspectionPoint] ADD CONSTRAINT [FK_InspectionPoint_AssetComponent] FOREIGN KEY ([AssetComponentId]) REFERENCES [dbo].[AssetComponent] ([Id])
GO
ALTER TABLE [dbo].[InspectionPoint] ADD CONSTRAINT [FK_InspectionPoint_AttributeField] FOREIGN KEY ([AttributeFieldId]) REFERENCES [dbo].[AttributeField] ([Id])
GO
ALTER TABLE [dbo].[InspectionPoint] ADD CONSTRAINT [FK_InspectionPoint_Inspection] FOREIGN KEY ([InspectionId]) REFERENCES [dbo].[Inspection] ([Id])
GO
ALTER TABLE [dbo].[InspectionPoint] ADD CONSTRAINT [FK_InspectionPoint_InspectionSheet] FOREIGN KEY ([InspectionSheetId]) REFERENCES [dbo].[InspectionSheet] ([Id])
GO
ALTER TABLE [dbo].[InspectionPoint] ADD CONSTRAINT [FK_InspectionPoint_User] FOREIGN KEY ([UserId]) REFERENCES [dbo].[User] ([Id])
GO
