CREATE TABLE [dbo].[NavigationDrawing_NavigationDrawingChild]
(
[FatherId] [uniqueidentifier] NOT NULL,
[ChildId] [uniqueidentifier] NOT NULL,
[ComponentShape] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[LastModified] [smalldatetime] NOT NULL,
[Id] [uniqueidentifier] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[NavigationDrawing_NavigationDrawingChild] ADD CONSTRAINT [PK_NavigationDrawing_NavigationDrawingChild_Id] PRIMARY KEY CLUSTERED ([Id]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[NavigationDrawing_NavigationDrawingChild] ADD CONSTRAINT [FK_NavigationDrawing_NavigationDrawingChild] FOREIGN KEY ([ChildId]) REFERENCES [dbo].[NavigationDrawing] ([Id])
GO
ALTER TABLE [dbo].[NavigationDrawing_NavigationDrawingChild] ADD CONSTRAINT [FK_NavigationDrawing_NavigationDrawingFather] FOREIGN KEY ([FatherId]) REFERENCES [dbo].[NavigationDrawing] ([Id])
GO
