

-- =============================================
-- Author:		JF Landry
-- Create date: 2019-11-25
-- Description:	Chargement initial des données brutes provenant de la table MaterialNeedsMaster
-- =============================================
CREATE PROCEDURE [dbo].[sp_ChargementInitialBrutes_MaterialNeedsMaster]

AS
BEGIN

	SET NOCOUNT ON;

	DECLARE @version as int,
			@Nom as varchar(50),
			@Description as varchar(100),
			@CompteRangeTable as int,
			@CreateDateTime	as datetime

	IF OBJECT_ID('[dbo].[Brute_MaterialNeedsMaster]', 'U') IS NOT NULL
		DROP TABLE [dbo].[Brute_MaterialNeedsMaster];

	SELECT  [Number]
			,[Version]
			,[ProductionSet]
			,[ReproductionNeedsCode]
			,[MNSet]
			,[CalculationDate]
			,[Obsolete]
			,[Description]
			,[Discounted]
			,[PrefRowVersion]
			,[TypeMNSet]
			,[ComponentsAssemblyUTCDate]
			,[CalculationUTCDate]
			,GETDATE()						AS DateCreation
			,GETDATE()						AS DateModification
	INTO [Prevost].[dbo].[Brute_MaterialNeedsMaster]
	FROM [PREFDB].[ADP_Prod].[dbo].[MaterialNeedsMaster]

	SET @version			= 1
	SET @Nom				= 'Brute_MaterialNeedsMaster'
	SET @Description		= 'Chargement initial'
	SET @CompteRangeTable	= (SELECT COUNT(*) FROM [PREFDB].[ADP_Prod].[dbo].[MaterialNeedsMaster])
	SET @CreateDateTime		= GETDATE()

	EXEC sp_Inserer_CompteTableIntergiciel @Version, @Nom, @Description, @CompteRangeTable, @CreateDateTime 

END
GO


