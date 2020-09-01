
-- =======================================================================================================================================
-- Author:		JF Landry
-- Create date: 2019-12-17
-- Description:	Transfert de la table [Stage_MainOeuvreProjet] 
-- =======================================================================================================================================

CREATE PROCEDURE [dbo].[sp_Transfert_Brute_ManoObraPAF_a_Stage_MainOeuvreProjet]


AS
BEGIN
	SET NOCOUNT ON;

	DECLARE @version as int,
			@Nom as varchar(50),
			@Description as varchar(100),
			@CompteRangeTable as int,
			@CreateDateTime	as datetime

	IF OBJECT_ID('[dbo].[Stage_MainOeuvreProjet]', 'U') IS NOT NULL
		DROP TABLE [dbo].[Stage_MainOeuvreProjet];

	SELECT   [Numero]
			,[Version]
			,[Orden]																			 AS [Ordre]
			,[SubModelId]																		 AS [IdSousModele]
			,[Puesto]										COLLATE SQL_Latin1_General_CP1_CI_AS AS [PosteTravail]
			,[Segundos]																			 AS [Secondes]
			,[idWorkforce]																		 AS [IdMainOeuvre]			
			,[ProductTypeCode]																	 AS [CodeTypeProduit]
			,ISNULL([ProcessingClassInstance], SPACE(0))										 AS [InstanceClasseTraitement]
			,CONVERT(DATETIME, [DateCreation])													 AS [Date de creation]
			,CONVERT(DATETIME, [DateModification])												 AS [Date de Modif.]
	INTO [Prevost].[dbo].[Stage_MainOeuvreProjet]
	FROM [Prevost].[dbo].[Brute_ManoObraPAF]

	SET @version			= 1
	SET @Nom				= 'Stage_MainOeuvreProjet'
	SET @Description		= 'Chargement initial'
	SET @CompteRangeTable	= (SELECT COUNT(*) FROM [Prevost].[dbo].[Brute_ManoObraPAF])
	SET @CreateDateTime		= GETDATE()

	EXEC sp_Inserer_CompteTableIntergiciel @Version, @Nom, @Description, @CompteRangeTable, @CreateDateTime 

END
GO


