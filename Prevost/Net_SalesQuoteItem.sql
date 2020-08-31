CREATE TABLE [dbo].[Net_SalesQuoteItem](
	[Sales Quote Item No] [int] IDENTITY(1,1) NOT NULL,
	[Design Tool] [int] NOT NULL,
	[Numero] [int] NOT NULL,
	[Version] [int] NOT NULL,
	[Order] [int] NOT NULL,
	[SortOrder] [int] NOT NULL,
	[Langue] [nvarchar](255) NULL,
	[Sales Quote No] [nvarchar](20) NULL,
	[Line reference No] [int] NOT NULL,
	[Project No] [nvarchar](20) NULL,
	[Item Type] [int] NULL,
	[Item No] [nvarchar](50) NULL,
	[Quantity] [decimal](38, 20) NULL,
	[Unit Price] [decimal](38, 20) NULL,
	[Shipment date] [datetime] NULL,
	[Creation Timestamp] [datetime] NULL,
	[Creation User] [nvarchar](255) NOT NULL,
	[Modification Timestamp] [datetime] NULL,
	[Modification User] [nvarchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Sales Quote Item No] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Net_SalesQuoteItem] ADD  DEFAULT ('') FOR [Item No]
GO
