CREATE TABLE [dbo].[Relation_ItemCategoryCode](
	[NoCategory] [int] IDENTITY(1,1) NOT NULL,
	[System] [varchar](50) NULL,
	[Name] [varchar](50) NULL,
	[Catégorie NAV] [varchar](50) NULL,
	[Catégorie Batch] [varchar](50) NULL,
	[Active] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[NoCategory] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Relation_ItemCategoryCode] ADD  DEFAULT ((1)) FOR [Active]
GO


