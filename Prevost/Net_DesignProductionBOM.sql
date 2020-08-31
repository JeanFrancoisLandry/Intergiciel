CREATE TABLE [dbo].[Net_DesignProductionBOM](
	[Design BOM No] [int] IDENTITY(1,1) NOT NULL,
	[Design Tool] [int] NOT NULL,
	[Design Item No] [int] NOT NULL,
	[Quote No] [int] NOT NULL,
	[Version] [int] NOT NULL,
	[Order] [int] NOT NULL,
	[Component Type] [int] NOT NULL,
	[Article de base] [nvarchar](255) NOT NULL,
	[Article PREF] [nvarchar](255) NOT NULL,
	[Component No] [nvarchar](50) NOT NULL,
	[Project No] [nvarchar](20) NOT NULL,
	[Sort Name] [nvarchar](50) NOT NULL,
	[Quantity per] [decimal](38, 20) NOT NULL,
	[Unit of Measure Code] [nvarchar](10) NOT NULL,
	[Scrap %] [decimal](38, 20) NOT NULL,
	[Routing Link Code] [nvarchar](20) NOT NULL,
	[Creation Timestamp] [datetime] NOT NULL,
	[Creation User] [nvarchar](max) NOT NULL,
	[Modification Timestamp] [datetime] NOT NULL,
	[Modification User] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Design BOM No] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO


