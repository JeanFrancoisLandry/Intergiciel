
-- =============================================
-- Author:		JF Landry
-- Create date: 2020-03-24
-- Description:	Chargement initial des données brutes provenant de la table MaterialNeedLinks
-- =============================================
CREATE PROCEDURE [dbo].[sp_ChargementInitialBrutes_MaterialNeedLinks]

AS
BEGIN

	SET NOCOUNT ON;

	DECLARE @version as int,
			@Nom as varchar(50),
			@Description as varchar(100),
			@CompteRangeTable as int,
			@CreateDateTime	as datetime

	IF OBJECT_ID('[dbo].[Brute_MaterialNeedLinks]', 'U') IS NOT NULL
		DROP TABLE [dbo].[Brute_MaterialNeedLinks];

	SELECT [Number]
			,[Version]
			,[ProductionSet]
			,[ReproductionNeedsCode]
			,[MNSet]
			,[CompositeMaterialNeedId]
			,[ComponentMaterialNeedId]
			,[ComponentCode]
			,GETDATE()						AS DateCreation
			,GETDATE()						AS DateModification
	INTO [Prevost].[dbo].[Brute_MaterialNeedLinks]
	FROM [ADP_Prod].[dbo].[MaterialNeedLinks]

	SET @version			= 1
	SET @Nom				= 'Brute_MaterialNeedLinks'
	SET @Description		= 'Chargement initial'
	SET @CompteRangeTable	= (SELECT COUNT(*) FROM [ADP_Prod].[dbo].[MaterialNeedLinks])
	SET @CreateDateTime		= GETDATE()

	EXEC sp_Inserer_CompteTableIntergiciel @Version, @Nom, @Description, @CompteRangeTable, @CreateDateTime 

END
GO


