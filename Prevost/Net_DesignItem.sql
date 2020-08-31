
CREATE TABLE [dbo].[Net_DesignItem](
	[Design Item No] [int] IDENTITY(1,1) NOT NULL,
	[Design Tool] [int] NOT NULL,
	[Quote No] [int] NOT NULL,
	[Version] [int] NULL,
	[Order] [int] NULL,
	[Language] [nvarchar](20) NULL,
	[Project No] [nvarchar](255) NULL,
	[Short Description] [nvarchar](255) NULL,
	[Long Description] [nvarchar](255) NULL,
	[Item Category Code] [nvarchar](20) NULL,
	[Equivalent Units] [decimal](38, 20) NOT NULL,
	[Color] [nvarchar](255) NULL,
	[Exterior Color] [nvarchar](20) NULL,
	[Interior Color] [nvarchar](20) NULL,
	[Sort Name] [nvarchar](50) NULL,
	[Length (mm)] [decimal](38, 20) NOT NULL,
	[System] [nvarchar](255) NULL,
	[Width] [nvarchar](255) NULL,
	[Height] [nvarchar](255) NULL,
	[Amperage] [decimal](38, 20) NOT NULL,
	[Geometry] [nvarchar](250) NULL,
	[Qty per Rack] [int] NULL,
	[Delicate Immersion] [nvarchar](250) NULL,
	[Difficult Rinsing] [nvarchar](250) NULL,
	[Lift Type] [nvarchar](250) NULL,
	[Creation Timestamp] [datetime] NULL,
	[Creation User] [nvarchar](255) NOT NULL,
	[Modification Timestamp] [datetime] NULL,
	[Modification User] [nvarchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Design Item No] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Net_DesignItem] ADD  DEFAULT ('') FOR [Item Category Code]
GO

ALTER TABLE [dbo].[Net_DesignItem] ADD  DEFAULT ((0)) FOR [Equivalent Units]
GO

ALTER TABLE [dbo].[Net_DesignItem] ADD  DEFAULT ('') FOR [Color]
GO

ALTER TABLE [dbo].[Net_DesignItem] ADD  DEFAULT ('') FOR [Exterior Color]
GO

ALTER TABLE [dbo].[Net_DesignItem] ADD  DEFAULT ('') FOR [Interior Color]
GO

ALTER TABLE [dbo].[Net_DesignItem] ADD  DEFAULT ((0)) FOR [Length (mm)]
GO

ALTER TABLE [dbo].[Net_DesignItem] ADD  DEFAULT ((0)) FOR [Amperage]
GO

ALTER TABLE [dbo].[Net_DesignItem] ADD  DEFAULT ('') FOR [Geometry]
GO

ALTER TABLE [dbo].[Net_DesignItem] ADD  DEFAULT ((0)) FOR [Qty per Rack]
GO

ALTER TABLE [dbo].[Net_DesignItem] ADD  DEFAULT ('') FOR [Delicate Immersion]
GO

ALTER TABLE [dbo].[Net_DesignItem] ADD  DEFAULT ('') FOR [Difficult Rinsing]
GO

ALTER TABLE [dbo].[Net_DesignItem] ADD  DEFAULT ('') FOR [Lift Type]
GO


