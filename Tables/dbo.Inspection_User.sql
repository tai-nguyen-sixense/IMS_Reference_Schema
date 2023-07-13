CREATE TABLE [dbo].[Inspection_User]
(
[InspectionId] [uniqueidentifier] NOT NULL,
[UserId] [uniqueidentifier] NOT NULL,
[Comments] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Inspection_User] ADD CONSTRAINT [PK_Inspection_User] PRIMARY KEY NONCLUSTERED ([InspectionId], [UserId]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Inspection_User] ADD CONSTRAINT [FK_Inspection_User_Inspection] FOREIGN KEY ([InspectionId]) REFERENCES [dbo].[Inspection] ([Id])
GO
ALTER TABLE [dbo].[Inspection_User] ADD CONSTRAINT [FK_Inspection_User_User] FOREIGN KEY ([UserId]) REFERENCES [dbo].[User] ([Id])
GO
