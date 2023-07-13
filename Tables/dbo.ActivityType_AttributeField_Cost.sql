CREATE TABLE [dbo].[ActivityType_AttributeField_Cost]
(
[ActivityTypeId] [uniqueidentifier] NOT NULL,
[AttributeFieldId] [uniqueidentifier] NOT NULL,
[Code] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Defaultvalue] [float] NOT NULL,
[Position] [int] NOT NULL,
[IsActive] [bit] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ActivityType_AttributeField_Cost] ADD CONSTRAINT [PK_ActivityType_AttributeField_Cost] PRIMARY KEY NONCLUSTERED ([ActivityTypeId], [AttributeFieldId], [Code]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ActivityType_AttributeField_Cost] ADD CONSTRAINT [FK_ActivityType_AttributeField_Cost_ActivityType] FOREIGN KEY ([ActivityTypeId]) REFERENCES [dbo].[ActivityType] ([Id])
GO
ALTER TABLE [dbo].[ActivityType_AttributeField_Cost] ADD CONSTRAINT [FK_ActivityType_AttributeField_Cost_AttributeField] FOREIGN KEY ([AttributeFieldId]) REFERENCES [dbo].[AttributeField] ([Id])
GO
