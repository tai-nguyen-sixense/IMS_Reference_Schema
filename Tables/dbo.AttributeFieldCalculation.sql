CREATE TABLE [dbo].[AttributeFieldCalculation]
(
[AttributeFieldId] [uniqueidentifier] NOT NULL,
[AttributeFieldIdParameter] [uniqueidentifier] NOT NULL,
[Weight] [float] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AttributeFieldCalculation] ADD CONSTRAINT [PK_AttributeFieldCalculation] PRIMARY KEY NONCLUSTERED ([AttributeFieldId], [AttributeFieldIdParameter]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AttributeFieldCalculation] ADD CONSTRAINT [FK_AttributeFieldCalculation_AttributeField] FOREIGN KEY ([AttributeFieldId]) REFERENCES [dbo].[AttributeField] ([Id])
GO
ALTER TABLE [dbo].[AttributeFieldCalculation] ADD CONSTRAINT [FK_AttributeFieldCalculation_AttributeField1] FOREIGN KEY ([AttributeFieldIdParameter]) REFERENCES [dbo].[AttributeField] ([Id])
GO
