

-- =======================================================================================================================================
-- Author:		JF Landry
-- Create date: 2019-12-17
-- Description:	Transfert de la table [ColorConfigurations] contenant le matériels pour les projets 
--				dans une table transformée appelée ConfigurationCouleur.
-- =======================================================================================================================================

CREATE PROCEDURE [dbo].[sp_Transfert_Brute_ColorConfigurations_a_Stage_ConfigurationCouleur]

AS
BEGIN
	SET NOCOUNT ON;

	DECLARE @version as int,
			@Nom as varchar(50),
			@Description as varchar(100),
			@CompteRangeTable as int,
			@CreateDateTime	as datetime

	IF OBJECT_ID('[dbo].[Stage_ConfigurationCouleur]', 'U') IS NOT NULL
		DROP TABLE [dbo].[Stage_ConfigurationCouleur];

	SELECT	[ConfigurationCode]
			,ISNULL([ColorName], SPACE(0))			COLLATE SQL_Latin1_General_CP1_CI_AS AS [Couleur]		
			,ISNULL([InnerColor], SPACE(0))			COLLATE SQL_Latin1_General_CP1_CI_AS AS [CouleurInterieur]
			,ISNULL([OuterColor], SPACE(0))			COLLATE SQL_Latin1_General_CP1_CI_AS AS [CouleurExtérieur]				
			,CONVERT(DATETIME, [DateCreation])											 AS [Date de creation]
			,CONVERT(DATETIME, [DateModification])										 AS [Date de Modif.]
	INTO [Prevost].[dbo].[Stage_ConfigurationCouleur]
	FROM [Prevost].[dbo].[Brute_ColorConfigurations]
	ORDER BY [ConfigurationCode]

	ALTER TABLE [Prevost].[dbo].[Stage_ConfigurationCouleur]
		ALTER COLUMN [Couleur] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL;

	ALTER TABLE [Prevost].[dbo].[Stage_ConfigurationCouleur]
		ALTER COLUMN [CouleurInterieur] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL;

	ALTER TABLE [Prevost].[dbo].[Stage_ConfigurationCouleur]
		ALTER COLUMN [CouleurExtérieur] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL;

	SET @version			= 1
	SET @Nom				= 'Stage_ConfigurationCouleur'
	SET @Description		= 'Chargement initial'
	SET @CompteRangeTable	= (SELECT COUNT(*) FROM [Prevost].[dbo].[Brute_ColorConfigurations])
	SET @CreateDateTime		= GETDATE()

	EXEC sp_Inserer_CompteTableIntergiciel @Version, @Nom, @Description, @CompteRangeTable, @CreateDateTime 

END
GO


