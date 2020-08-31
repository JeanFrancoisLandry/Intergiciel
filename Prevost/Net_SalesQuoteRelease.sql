CREATE TABLE [dbo].[Net_SalesQuoteRelease](
	[Sales Quote Release No] [int] IDENTITY(1,1) NOT NULL,
	[Design Tool] [int] NOT NULL,
	[Numero] [int] NOT NULL,
	[Version] [int] NOT NULL,
	[Order] [int] NOT NULL,
	[Lot] [int] NULL,
	[Sales Quote No_] [nvarchar](20) NOT NULL,
	[Release No_] [int] NOT NULL,
	[Line Reference No_] [int] NOT NULL,
	[Project No_] [nvarchar](20) NOT NULL,
	[Quantity] [decimal](38, 20) NOT NULL,
	[Creation Timestamp] [datetime] NOT NULL,
	[Creation User] [nvarchar](50) NOT NULL,
	[Modification Timestamp] [datetime] NOT NULL,
	[Modification User] [nvarchar](50) NOT NULL
) ON [PRIMARY]
GO
