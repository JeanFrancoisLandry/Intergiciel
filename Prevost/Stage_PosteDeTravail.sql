CREATE TABLE [dbo].[Stage_PosteDeTravail](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Numero] [int] NOT NULL,
	[Version] [int] NOT NULL,
	[Ordre] [int] NOT NULL,
	[PosteTravail] [nvarchar](255) NULL,
	[Secondes] [real] NULL,
	[Date de creation] [datetime] NULL,
	[Date de Modif.] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

