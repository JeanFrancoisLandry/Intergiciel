
-- =======================================================================================================================================
-- Author:		JF Landry
-- Create date: 2019-11-26
-- Description:	Transfert de la table ContenidoPAFDescriptionsBrute dans une table transformée appelée DetailDescriptionProjectStage.
-- =======================================================================================================================================

CREATE PROCEDURE [dbo].[sp_Transfert_Brute_ContenidoPAFDescriptions_a_Stage_DetailDescriptionProject]

AS
BEGIN
	SET NOCOUNT ON;

	DECLARE @Version as int,
			@Nom as varchar(50),
			@Description as varchar(100),
			@CompteRangeTable as int,
			@CreateDateTime	as datetime

	IF OBJECT_ID('[dbo].[Stage_DetailDescriptionProject]', 'U') IS NOT NULL
		DROP TABLE [dbo].[Stage_DetailDescriptionProject];

	SELECT [Numero]
		  ,[Version]
		  ,[Orden]															AS [Ordre]
		  ,CASE WHEN ([LanguageId]=3084) 
				THEN 'Français' 
				ELSE 'Anglais' 
			END														COLLATE SQL_Latin1_General_CP1_CI_AS AS Langue
		  ,[Description]											COLLATE SQL_Latin1_General_CP1_CI_AS AS [Description]
		  ,[AutomaticDescription]									COLLATE SQL_Latin1_General_CP1_CI_AS AS [Description Auto.]
		  ,[ProductionDescription]									COLLATE SQL_Latin1_General_CP1_CI_AS AS [Description Prod.]
		  ,ISNULL([Color], SPACE(0))								COLLATE SQL_Latin1_General_CP1_CI_AS AS [Couleur]
		  ,[DateCreation]
		  ,[DateModification]
	INTO [Prevost].[dbo].[Stage_DetailDescriptionProject]
	FROM [Prevost].[dbo].[Brute_ContenidoPAFDescriptions]

	ALTER TABLE [Prevost].[dbo].[Stage_DetailDescriptionProject]
		ALTER COLUMN [Description] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL;

	ALTER TABLE [Prevost].[dbo].[Stage_DetailDescriptionProject]
		ALTER COLUMN [Description Auto.] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL;

	ALTER TABLE [Prevost].[dbo].[Stage_DetailDescriptionProject]
		ALTER COLUMN [Description Prod.] [varchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL;

	ALTER TABLE [Prevost].[dbo].[Stage_DetailDescriptionProject]
		ALTER COLUMN [Couleur] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL;

	SET @version			= 1
	SET @Nom				= 'Stage_DetailDescriptionProject'
	SET @Description		= 'Chargement initial'
	SET @CompteRangeTable	= (SELECT COUNT(*) FROM [Prevost].[dbo].[Brute_ContenidoPAFDescriptions])
	SET @CreateDateTime		= GETDATE()

	EXEC sp_Inserer_CompteTableIntergiciel @Version, @Nom, @Description, @CompteRangeTable, @CreateDateTime 

END
GO

