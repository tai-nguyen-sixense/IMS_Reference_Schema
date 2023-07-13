CREATE TABLE [dbo].[AttributeFieldRange]
(
[AttributeFieldId] [uniqueidentifier] NOT NULL,
[Position] [numeric] (2, 0) NOT NULL,
[Description] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ValueNumericFrom] [float] NULL,
[ValueNumericTo] [float] NULL,
[ValueDateFrom] [datetime] NULL,
[ValueDateTo] [datetime] NULL,
[Icon] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Color] [nvarchar] (4000) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AttributeFieldRange] ADD CONSTRAINT [PK_AttributeFieldRange] PRIMARY KEY NONCLUSTERED ([AttributeFieldId], [Position]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AttributeFieldRange] ADD CONSTRAINT [FK_AttributeFieldRange_AttributeField] FOREIGN KEY ([AttributeFieldId]) REFERENCES [dbo].[AttributeField] ([Id])
GO
