

-- =======================================================================================================================================
-- Author:		JF Landry
-- Create date: 2019-12-17
-- Description:	Transfert de la table [Groups] contenant le matériels pour les projets 
--				dans une table transformée appelée Groupes.
-- =======================================================================================================================================

CREATE PROCEDURE [dbo].[sp_Transfert_Brute_Groups_a_Stage_Groupes]


AS
BEGIN
	SET NOCOUNT ON;

	DECLARE @version as int,
			@Nom as varchar(50),
			@Description as varchar(100),
			@CompteRangeTable as int,
			@CreateDateTime	as datetime

	IF OBJECT_ID('[dbo].[Stage_Groupes]', 'U') IS NOT NULL
		DROP TABLE [dbo].[Stage_Groupes];

	SELECT   [GroupId]																	AS [IdGroupe]
			,[GroupType]																AS [TypeGroupe]
			,[GroupName]						COLLATE SQL_Latin1_General_CP1_CI_AS	AS [Nom]
			,[Description]						COLLATE SQL_Latin1_General_CP1_CI_AS	AS [Description]
			,CONVERT(DATETIME, [DateCreation])											AS [Date de creation]
			,CONVERT(DATETIME, [DateModification])										AS [Date de Modif.]
	INTO [Prevost].[dbo].[Stage_Groupes]
	FROM [Prevost].[dbo].[Brute_Groups]
	ORDER BY GroupId

	SET @version			= 1
	SET @Nom				= 'Stage_Groupes'
	SET @Description		= 'Chargement initial'
	SET @CompteRangeTable	= (SELECT COUNT(*) FROM [Prevost].[dbo].[Brute_Groups])
	SET @CreateDateTime		= GETDATE()

	EXEC sp_Inserer_CompteTableIntergiciel @Version, @Nom, @Description, @CompteRangeTable, @CreateDateTime 

END
GO


