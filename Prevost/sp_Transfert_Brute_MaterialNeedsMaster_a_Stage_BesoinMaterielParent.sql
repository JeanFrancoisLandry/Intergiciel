

-- =======================================================================================================================================
-- Author:		JF Landry
-- Create date: 2019-11-26
-- Description:	Transfert de la table [Brute_MaterialNeedsMaster] contenant les données des besoins matériels d'une tâche
--				dans une table transformée appelée Stage_BesoinMaterielParent.
-- =======================================================================================================================================

CREATE PROCEDURE [dbo].[sp_Transfert_Brute_MaterialNeedsMaster_a_Stage_BesoinMaterielParent]

AS
BEGIN
	SET NOCOUNT ON;

	DECLARE @version as int,
			@Nom as varchar(50),
			@Description as varchar(100),
			@CompteRangeTable as int,
			@CreateDateTime	as datetime

	IF OBJECT_ID('[dbo].[Stage_BesoinMaterielParent]', 'U') IS NOT NULL
		DROP TABLE [dbo].[Stage_BesoinMaterielParent];

	SELECT   ABS([Number])												AS [Numero]
			,ABS([Version])												AS [Version]
			,ABS([ProductionSet])										AS [Ensemble Production]
			,ABS([ReproductionNeedsCode])								AS [Code Besoin Production]
			,[MNSet]
			,ISNULL(CONVERT(DATE, [CalculationDate]), '1754-01-01')		AS [Date de calcul]
			,[Obsolete]
			,[Description]			COLLATE SQL_Latin1_General_CP1_CI_AS AS [Description]
			--,[Discounted]
			--,[PrefRowVersion]
			,[TypeMNSet]
			--,[ComponentsAssemblyUTCDate]
			,ISNULL(CONVERT(DATE, [CalculationUTCDate]), '1754-01-01')	AS [Date de calcul UTC]
			,CONVERT(DATETIME, [DateCreation])							AS [Date de creation]
			,CONVERT(DATETIME, [DateModification])						AS [Date de Modif.]
	INTO [Prevost].[dbo].[Stage_BesoinMaterielParent] 
	FROM [Prevost].[dbo].[Brute_MaterialNeedsMaster]

	SET @version			= 1
	SET @Nom				= 'Stage_BesoinMaterielParent'
	SET @Description		= 'Chargement initial'
	SET @CompteRangeTable	= (SELECT COUNT(*) FROM [Prevost].[dbo].[Brute_MaterialNeedsMaster])
	SET @CreateDateTime		= GETDATE()

	EXEC sp_Inserer_CompteTableIntergiciel @Version, @Nom, @Description, @CompteRangeTable, @CreateDateTime 

END
GO

