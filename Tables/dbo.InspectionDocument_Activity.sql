CREATE TABLE [dbo].[InspectionDocument_Activity]
(
[InspectionDocumentId] [uniqueidentifier] NOT NULL,
[ActivityId] [uniqueidentifier] NOT NULL,
[DateLinked] [datetime] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[InspectionDocument_Activity] ADD CONSTRAINT [PK_InspectionDocument_Activity] PRIMARY KEY NONCLUSTERED ([InspectionDocumentId], [ActivityId]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[InspectionDocument_Activity] ADD CONSTRAINT [FK_InspectionDocument_Activity_Activity] FOREIGN KEY ([ActivityId]) REFERENCES [dbo].[Activity] ([Id])
GO
ALTER TABLE [dbo].[InspectionDocument_Activity] ADD CONSTRAINT [FK_InspectionDocument_Activity_InspectionDocument] FOREIGN KEY ([InspectionDocumentId]) REFERENCES [dbo].[InspectionDocument] ([Id])
GO
