CREATE TABLE [dbo].[Contact_Matrix]
(
[ContactId] [uniqueidentifier] NOT NULL,
[MatrixId] [uniqueidentifier] NOT NULL,
[DateLinked] [datetime] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Contact_Matrix] ADD CONSTRAINT [PK_Contact_Matrix] PRIMARY KEY NONCLUSTERED ([ContactId], [MatrixId]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Contact_Matrix] ADD CONSTRAINT [FK_Contact_Matrix_Contact] FOREIGN KEY ([ContactId]) REFERENCES [dbo].[Contact] ([Id])
GO
ALTER TABLE [dbo].[Contact_Matrix] ADD CONSTRAINT [FK_Contact_Matrix_Matrix] FOREIGN KEY ([MatrixId]) REFERENCES [dbo].[Matrix] ([Id])
GO
