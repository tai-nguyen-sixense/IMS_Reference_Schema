CREATE TABLE [dbo].[InspectionAttributeValueHistory]
(
[InspectionId] [uniqueidentifier] NOT NULL,
[AttributeFieldId] [uniqueidentifier] NOT NULL,
[ValueVersionId] [uniqueidentifier] NOT NULL,
[DateArchived] [datetime] NOT NULL,
[Value] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Comments] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[LastModified] [datetime] NOT NULL,
[UserId] [uniqueidentifier] NOT NULL,
[InspectionChapterId] [uniqueidentifier] NOT NULL,
[ValueTagId] [uniqueidentifier] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[InspectionAttributeValueHistory] ADD CONSTRAINT [PK_InspectionAttributeValueHistory] PRIMARY KEY CLUSTERED ([InspectionId], [AttributeFieldId], [ValueVersionId], [InspectionChapterId], [DateArchived]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[InspectionAttributeValueHistory] ADD CONSTRAINT [FK_Inspection_avh_ValueTagId] FOREIGN KEY ([ValueTagId]) REFERENCES [dbo].[ValueTag] ([Id])
GO
ALTER TABLE [dbo].[InspectionAttributeValueHistory] ADD CONSTRAINT [FK_InspectionAttributeValueHistory_AttributeField1] FOREIGN KEY ([AttributeFieldId]) REFERENCES [dbo].[AttributeField] ([Id])
GO
ALTER TABLE [dbo].[InspectionAttributeValueHistory] ADD CONSTRAINT [FK_InspectionAttributeValueHistory_Inspection] FOREIGN KEY ([InspectionId]) REFERENCES [dbo].[Inspection] ([Id])
GO
ALTER TABLE [dbo].[InspectionAttributeValueHistory] ADD CONSTRAINT [FK_InspectionAttributeValueHistory_InspectionChapter] FOREIGN KEY ([InspectionChapterId]) REFERENCES [dbo].[InspectionChapter] ([Id])
GO
ALTER TABLE [dbo].[InspectionAttributeValueHistory] ADD CONSTRAINT [FK_InspectionAttributeValueHistory_User] FOREIGN KEY ([UserId]) REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[InspectionAttributeValueHistory] ADD CONSTRAINT [FK_InspectionAttributeValueHistory_ValueVersion] FOREIGN KEY ([ValueVersionId]) REFERENCES [dbo].[ValueVersion] ([Id])
GO
