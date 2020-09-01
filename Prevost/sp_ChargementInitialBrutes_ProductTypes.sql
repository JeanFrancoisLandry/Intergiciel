

-- =================================================================================================
-- Author:		JF Landry
-- Create date: 2020-01-27
-- Description:	Chargement initial des données brutes provenant de la table ProductTypes
-- =================================================================================================

CREATE PROCEDURE [dbo].[sp_ChargementInitialBrutes_ProductTypes]

AS
BEGIN

	SET NOCOUNT ON;

	DECLARE @version as int,
			@Nom as varchar(50),
			@Description as varchar(100),
			@CompteRangeTable as int,
			@CreateDateTime	as datetime

	IF OBJECT_ID('[dbo].[Brute_ProductTypes]', 'U') IS NOT NULL
		DROP TABLE [dbo].[Brute_ProductTypes];

	SELECT   [Code]
			,[Name]
			,[ProcessingClass]
 			,GETDATE()						AS DateCreation
			,GETDATE()						AS DateModification
	INTO [Prevost].[dbo].[Brute_ProductTypes]
	FROM [ADP_Prod].[dbo].[ProductTypes]
	ORDER BY [Code]

	SET @version			= 1
	SET @Nom				= 'Brute_ProductTypes'
	SET @Description		= 'Chargement initial'
	SET @CompteRangeTable	= (SELECT COUNT(*) FROM [PREFDB].[ADP_Prod].[dbo].[ProductTypes])
	SET @CreateDateTime		= GETDATE()

	EXEC sp_Inserer_CompteTableIntergiciel @Version, @Nom, @Description, @CompteRangeTable, @CreateDateTime 

END
GO


