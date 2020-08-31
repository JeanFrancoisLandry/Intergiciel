CREATE TABLE [dbo].[Net_DesignRouting](
	[Design Routing No] [int] IDENTITY(1,1) NOT NULL,
	[Design Item No] [int] NOT NULL,
	[Design Tool] [int] NOT NULL,
	[Quote No] [int] NOT NULL,
	[Version] [int] NULL,
	[Order] [int] NULL,
	[Operation No] [int] NOT NULL,
	[Project No] [nvarchar](20) NOT NULL,
	[Work Center No] [nvarchar](20) NOT NULL,
	[SetUp Time] [nvarchar](max) NOT NULL,
	[Run Time] [nvarchar](max) NOT NULL,
	[Routing Link Code] [nvarchar](max) NOT NULL,
	[Creation Timestamp] [datetime] NOT NULL,
	[Creation User] [nvarchar](max) NOT NULL,
	[Modification Timestamp] [datetime] NOT NULL,
	[Modification User] [nvarchar](max) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Design Routing No] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO