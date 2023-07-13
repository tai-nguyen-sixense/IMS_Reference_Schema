CREATE TABLE [dbo].[InspectionAttributeValue]
(
[InspectionId] [uniqueidentifier] NOT NULL,
[AttributeFieldId] [uniqueidentifier] NOT NULL,
[Value] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Comments] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[LastModified] [smalldatetime] NOT NULL,
[UserId] [uniqueidentifier] NOT NULL,
[ValueDateComputed] AS (TRY_PARSE(left([value],(50)) AS [datetime])),
[InspectionChapterId] [uniqueidentifier] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[InspectionAttributeValue] ADD CONSTRAINT [PK_InspectionAttributeValue] PRIMARY KEY NONCLUSTERED ([InspectionId], [InspectionChapterId], [AttributeFieldId]) WITH (FILLFACTOR=80) ON [PRIMARY]
GO
ALTER TABLE [dbo].[InspectionAttributeValue] ADD CONSTRAINT [FK_InspectionAttributeValue_AttributeField] FOREIGN KEY ([AttributeFieldId]) REFERENCES [dbo].[AttributeField] ([Id])
GO
ALTER TABLE [dbo].[InspectionAttributeValue] ADD CONSTRAINT [FK_InspectionAttributeValue_Inspection] FOREIGN KEY ([InspectionId]) REFERENCES [dbo].[Inspection] ([Id])
GO
ALTER TABLE [dbo].[InspectionAttributeValue] ADD CONSTRAINT [FK_InspectionAttributeValue_InspectionChapter] FOREIGN KEY ([InspectionChapterId]) REFERENCES [dbo].[InspectionChapter] ([Id])
GO
