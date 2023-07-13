CREATE TABLE [dbo].[HomogeneousZoneAttributeValue]
(
[HomogeneousZoneId] [uniqueidentifier] NOT NULL,
[AttributeFieldId] [uniqueidentifier] NOT NULL,
[Value] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Comments] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[LastModified] [datetime] NOT NULL,
[UserId] [uniqueidentifier] NOT NULL,
[ValueNumeric] [float] NULL,
[ValueDate] [datetime] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[HomogeneousZoneAttributeValue] ADD CONSTRAINT [PK_HomogeneousZoneAttributeValue] PRIMARY KEY NONCLUSTERED ([HomogeneousZoneId], [AttributeFieldId]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[HomogeneousZoneAttributeValue] ADD CONSTRAINT [FK_HomogeneousZoneAttributeValue_AttributeField] FOREIGN KEY ([AttributeFieldId]) REFERENCES [dbo].[AttributeField] ([Id])
GO
ALTER TABLE [dbo].[HomogeneousZoneAttributeValue] ADD CONSTRAINT [FK_HomogeneousZoneAttributeValue_HomogeneousZone] FOREIGN KEY ([HomogeneousZoneId]) REFERENCES [dbo].[HomogeneousZone] ([Id])
GO
ALTER TABLE [dbo].[HomogeneousZoneAttributeValue] ADD CONSTRAINT [FK_HomogeneousZoneAttributeValue_User] FOREIGN KEY ([UserId]) REFERENCES [dbo].[User] ([Id])
GO
