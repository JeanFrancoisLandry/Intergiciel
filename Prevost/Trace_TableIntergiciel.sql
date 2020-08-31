CREATE TABLE [dbo].[Trace_TableIntergiciel](
	[Numero] [int] IDENTITY(1,1) NOT NULL,
	[Commande] [int] NOT NULL,
	[Version] [int] NOT NULL,
	[Nom] [nvarchar](50) NOT NULL,
	[NomOriginal] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](100) NOT NULL,
	[CompteRangeTable] [int] NOT NULL,
	[CreateDateTime] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Numero] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
