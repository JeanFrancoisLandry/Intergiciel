CREATE TABLE [dbo].[Stage_DetailDescriptionProject](
	[Numero] [int] NOT NULL,
	[Version] [int] NOT NULL,
	[Ordre] [smallint] NOT NULL,
	[Langue] [varchar](8) NOT NULL,
	[Description] [nvarchar](255) NOT NULL,
	[Description Auto.] [nvarchar](max) NOT NULL,
	[Description Prod.] [varchar](max) NOT NULL,
	[Couleur] [varchar](50) NOT NULL,
	[DateCreation] [datetime] NOT NULL,
	[DateModification] [datetime] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO