

-- =============================================
-- Author:		JF Landry
-- Create date: 2019-11-25
-- Description:	Chargement initial des données brutes provenant de la table ContenidoPAFDescriptions
-- =============================================
CREATE PROCEDURE [dbo].[sp_ChargementInitialBrutes_ContenidoPAFDescriptions]

AS
BEGIN

	SET NOCOUNT ON;

	DECLARE @version as int,
			@Nom as varchar(50),
			@Description as varchar(100),
			@CompteRangeTable as int,
			@CreateDateTime	as datetime

	IF OBJECT_ID('[dbo].[Brute_ContenidoPAFDescriptions]', 'U') IS NOT NULL
		DROP TABLE [dbo].[Brute_ContenidoPAFDescriptions];

	SELECT [Numero]
			,[Version]
			,[Orden]
			,[LanguageId]
			,[Description]
			,[AutomaticDescription]
			,[ProductionDescription]
			,[DescriptionDeliveryGroup1]
			,[DescriptionDeliveryGroup2]
			,[DescriptionDeliveryGroup3]
			,[DescriptionDeliveryGroup4]
			,[DescriptionDeliveryGroup5]
			,[DescriptionDeliveryGroup6]
			,[Color]
			,GETDATE()						AS DateCreation
			,GETDATE()						AS DateModification
	INTO [Prevost].[dbo].[Brute_ContenidoPAFDescriptions]
	FROM [PREFDB].[ADP_Prod].[dbo].[ContenidoPAFDescriptions]

	SET @version			= 1
	SET @Nom				= 'Brute_ContenidoPAFDescriptions'
	SET @Description		= 'Chargement initial'
	SET @CompteRangeTable	= (SELECT COUNT(*) FROM [PREFDB].[ADP_Prod].[dbo].[ContenidoPAFDescriptions])
	SET @CreateDateTime		= GETDATE()

	EXEC sp_Inserer_CompteTableIntergiciel @Version, @Nom, @Description, @CompteRangeTable, @CreateDateTime 

END
GO


