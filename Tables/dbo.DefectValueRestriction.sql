CREATE TABLE [dbo].[DefectValueRestriction]
(
[DefectTypeComponentTypeMaterialId] [uniqueidentifier] NOT NULL,
[AttributeFIeldId] [uniqueidentifier] NOT NULL,
[Value] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Description] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[DefectValueRestriction] ADD CONSTRAINT [PK_DefectValueRestriction] PRIMARY KEY NONCLUSTERED ([DefectTypeComponentTypeMaterialId], [AttributeFIeldId], [Value]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[DefectValueRestriction] ADD CONSTRAINT [FK_DefectValueRestriction_AllowableValue] FOREIGN KEY ([AttributeFIeldId], [Value]) REFERENCES [dbo].[AllowableValue] ([AttributeFieldId], [Value])
GO
ALTER TABLE [dbo].[DefectValueRestriction] ADD CONSTRAINT [FK_DefectValueRestriction_DefectType_ComponentType_Material] FOREIGN KEY ([DefectTypeComponentTypeMaterialId]) REFERENCES [dbo].[DefectType_ComponentType_Material] ([Id])
GO
