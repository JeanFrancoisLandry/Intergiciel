CREATE TABLE [dbo].[Stage_Materiel](
	[ReferenceBase] [nchar](25) NOT NULL,
	[Reference] [nchar](50) NOT NULL,
	[NoArticle_PREF] [nvarchar](255) NULL,
	[NoArticle_NAV] [nvarchar](50) NULL,
	[ConfigurationCode] [int] NOT NULL,
	[Couleur] [nvarchar](50) NOT NULL,
	[Longueur] [real] NOT NULL,
	[Perte] [decimal](19, 6) NOT NULL,
	[UtilisationPerte] [smallint] NOT NULL,
	[UdM_Pref] [nvarchar](10) NULL,
	[UdM_NAV] [nvarchar](10) NULL,
	[Facteur] [int] NULL,
	[Active] [bit] NULL,
	[EstNAVRelated] [bit] NULL,
	[EstAssemblage] [bit] NULL,
	[EstBOM] [bit] NULL,
	[EstIndependant] [bit] NULL,
	[EstArticlePeint] [bit] NULL,
	[EstAssemblagePeint] [bit] NULL,
	[Date de creation] [datetime] NOT NULL,
	[Date de Modif] [datetime] NOT NULL
) ON [PRIMARY]
GO
