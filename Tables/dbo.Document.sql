CREATE TABLE [dbo].[Document]
(
[Id] [uniqueidentifier] NOT NULL,
[AssetId] [uniqueidentifier] NULL,
[Name] [nvarchar] (4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Comments] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[IsUsedForInspection] [bit] NOT NULL,
[DocumentTypeId] [uniqueidentifier] NOT NULL,
[LastModified] [smalldatetime] NOT NULL,
[UserId] [uniqueidentifier] NOT NULL,
[AuthorId] [uniqueidentifier] NOT NULL,
[ActivityId] [uniqueidentifier] NULL,
[AuditId] [uniqueidentifier] NULL,
[LandmarkId] [uniqueidentifier] NULL,
[DeltaX] [float] NULL,
[DeltaY] [float] NULL,
[DeltaZ] [float] NULL,
[TaskOrderId] [uniqueidentifier] NULL,
[RequestId] [uniqueidentifier] NULL,
[IncludeInReport] [bit] NOT NULL,
[UserLinkId] [uniqueidentifier] NULL,
[GeographyId] [uniqueidentifier] NULL,
[FatherId] [uniqueidentifier] NULL,
[SMCanBeDownloaded] [bit] NOT NULL CONSTRAINT [DF__Document__SMCanB__05C3D225] DEFAULT ((0)),
[Category] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ContactId] [uniqueidentifier] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Document] ADD CONSTRAINT [PK_Document] PRIMARY KEY NONCLUSTERED ([Id]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Document] ADD CONSTRAINT [FK_Document_Activity] FOREIGN KEY ([ActivityId]) REFERENCES [dbo].[Activity] ([Id])
GO
ALTER TABLE [dbo].[Document] ADD CONSTRAINT [FK_Document_Asset] FOREIGN KEY ([AssetId]) REFERENCES [dbo].[Asset] ([Id])
GO
ALTER TABLE [dbo].[Document] ADD CONSTRAINT [FK_Document_Audit] FOREIGN KEY ([AuditId]) REFERENCES [dbo].[Audit] ([Id])
GO
ALTER TABLE [dbo].[Document] ADD CONSTRAINT [FK_Document_Contact] FOREIGN KEY ([ContactId]) REFERENCES [dbo].[Contact] ([Id])
GO
ALTER TABLE [dbo].[Document] ADD CONSTRAINT [FK_Document_DocumentType] FOREIGN KEY ([DocumentTypeId]) REFERENCES [dbo].[DocumentType] ([Id])
GO
ALTER TABLE [dbo].[Document] ADD CONSTRAINT [FK_Document_Landmark] FOREIGN KEY ([LandmarkId]) REFERENCES [dbo].[Landmark] ([Id])
GO
ALTER TABLE [dbo].[Document] ADD CONSTRAINT [FK_Document_Request] FOREIGN KEY ([RequestId]) REFERENCES [dbo].[Request] ([Id])
GO
ALTER TABLE [dbo].[Document] ADD CONSTRAINT [FK_Document_TaskOrder] FOREIGN KEY ([TaskOrderId]) REFERENCES [dbo].[TaskOrder] ([Id])
GO
ALTER TABLE [dbo].[Document] ADD CONSTRAINT [FK_Document_User] FOREIGN KEY ([UserId]) REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[Document] ADD CONSTRAINT [FK_Document_User1] FOREIGN KEY ([AuthorId]) REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[Document] ADD CONSTRAINT [FK_Document_UserLink] FOREIGN KEY ([UserLinkId]) REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[Document] ADD CONSTRAINT [FK__Document__IdGeog__07420643] FOREIGN KEY ([GeographyId]) REFERENCES [dbo].[Geography] ([Id])
GO
