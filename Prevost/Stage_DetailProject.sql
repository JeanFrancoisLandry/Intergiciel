CREATE TABLE [dbo].[Stage_DetailProject](
	[Numero] [int] NOT NULL,
	[Version] [int] NOT NULL,
	[Ordre] [smallint] NOT NULL,
	[SortOrdre] [smallint] NOT NULL,
	[Type] [nchar](3) NULL,
	[Sous-Type] [int] NOT NULL,
	[Nomenclature] [nvarchar](25) NOT NULL,
	[Concept] [nchar](50) NOT NULL,
	[Description] [nvarchar](255) NOT NULL,
	[Quantité] [float] NULL,
	[Cout Unitaire] [float] NULL,
	[Prix Unitaire] [float] NULL,
	[Mesures] [nvarchar](200) NULL,
	[Type de Cadre] [int] NULL,
	[Nombre de Feuille] [int] NULL,
	[Nombre de Poteau] [int] NULL,
	[System] [nchar](25) NOT NULL,
	[ProductType] [int] NULL,
	[Date modif. Materiel] [datetime] NULL,
	[Date modif. Main Oeuvre] [datetime] NULL,
	[Date modif. Background] [datetime] NULL
) ON [PRIMARY]
GO