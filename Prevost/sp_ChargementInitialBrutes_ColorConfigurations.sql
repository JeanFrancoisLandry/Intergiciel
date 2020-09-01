
-- =================================================================================================
-- Author:		JF Landry
-- Create date: 2020-01-27
-- Description:	Chargement initial des données brutes provenant de la table ColorConfigurations
-- =================================================================================================

CREATE PROCEDURE [dbo].[sp_ChargementInitialBrutes_ColorConfigurations]

AS
BEGIN

	SET NOCOUNT ON;

	DECLARE @version as int,
			@Nom as varchar(50),
			@Description as varchar(100),
			@CompteRangeTable as int,
			@CreateDateTime	as datetime

	IF OBJECT_ID('[dbo].[Brute_ColorConfigurations]', 'U') IS NOT NULL
		DROP TABLE [dbo].[Brute_ColorConfigurations];

	SELECT   [ConfigurationCode]
			,[ColorName]
			,[InnerColor]
			,[OuterColor]
			,GETDATE()						AS DateCreation
			,GETDATE()						AS DateModification
	INTO [Prevost].[dbo].[Brute_ColorConfigurations]
	FROM [ADP_Prod].[dbo].[ColorConfigurations]
	ORDER BY [ConfigurationCode]

	SET @version			= 1
	SET @Nom				= 'Brute_ColorConfigurations'
	SET @Description		= 'Chargement initial'
	SET @CompteRangeTable	= (SELECT COUNT(*) FROM [PREFDB].[ADP_Prod].[dbo].[ColorConfigurations])
	SET @CreateDateTime		= GETDATE()

	EXEC sp_Inserer_CompteTableIntergiciel @Version, @Nom, @Description, @CompteRangeTable, @CreateDateTime 

END
GO


