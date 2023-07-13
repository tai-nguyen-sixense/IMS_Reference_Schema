CREATE TABLE [dbo].[Chapter_Attribute]
(
[ChapterId] [uniqueidentifier] NOT NULL,
[AttributeFieldId] [uniqueidentifier] NOT NULL,
[IsActive] [bit] NOT NULL,
[Position] [int] NULL,
[IsFeatured] [bit] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Chapter_Attribute] ADD CONSTRAINT [PK_Chapter_Attribute] PRIMARY KEY NONCLUSTERED ([ChapterId], [AttributeFieldId]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Chapter_Attribute] ADD CONSTRAINT [FK_Chapter_Attribute_AttributeField] FOREIGN KEY ([AttributeFieldId]) REFERENCES [dbo].[AttributeField] ([Id])
GO
ALTER TABLE [dbo].[Chapter_Attribute] ADD CONSTRAINT [FK_Chapter_Attribute_Chapter] FOREIGN KEY ([ChapterId]) REFERENCES [dbo].[Chapter] ([Id])
GO
