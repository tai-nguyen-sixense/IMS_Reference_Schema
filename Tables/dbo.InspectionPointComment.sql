CREATE TABLE [dbo].[InspectionPointComment]
(
[Id] [uniqueidentifier] NOT NULL,
[InspectionPointId] [uniqueidentifier] NOT NULL,
[Comment] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CommentIndex] [int] NOT NULL,
[IsBis] [bit] NOT NULL,
[LastModified] [smalldatetime] NOT NULL,
[UserId] [uniqueidentifier] NOT NULL,
[Value] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ValueBis] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[InspectionPointComment] ADD CONSTRAINT [PK_InspectionPointComment] PRIMARY KEY NONCLUSTERED ([Id]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[InspectionPointComment] ADD CONSTRAINT [FK_InspectionPointComment_InspectionPoint] FOREIGN KEY ([InspectionPointId]) REFERENCES [dbo].[InspectionPoint] ([Id])
GO
ALTER TABLE [dbo].[InspectionPointComment] ADD CONSTRAINT [FK_InspectionPointComment_User] FOREIGN KEY ([UserId]) REFERENCES [dbo].[User] ([Id])
GO
