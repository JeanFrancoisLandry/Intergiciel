CREATE TABLE [dbo].[Relation_PosteDeTravail](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[PosteTravail] [nvarchar](255) NULL,
	[Departement] [nvarchar](255) NULL,
	[Categorie produit] [nvarchar](25) NULL,
	[Atelier NAV] [nvarchar](255) NULL,
	[Routing Link Code] [nvarchar](255) NULL,
	[Active] [bit] NOT NULL,
 CONSTRAINT [PK__Relation__3214EC27EDC27AF1] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Relation_PosteDeTravail] ADD  CONSTRAINT [DF__Relation___Activ__42E1EEFE]  DEFAULT ((1)) FOR [Active]
GO


