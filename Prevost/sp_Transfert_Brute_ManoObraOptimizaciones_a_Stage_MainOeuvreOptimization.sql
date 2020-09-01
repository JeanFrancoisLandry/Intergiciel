
-- =======================================================================================================================================
-- Author:		JF Landry
-- Create date: 2019-11-26
-- Description:	Transfert de la table [Brute_ManoObraOptimizaciones] contenant l'optimization de la main-d'oeuvre.
--				vers la table stage MainOeuvreOptimization
-- =======================================================================================================================================
CREATE PROCEDURE [dbo].[sp_Transfert_Brute_ManoObraOptimizaciones_a_Stage_MainOeuvreOptimization]

AS
BEGIN
	SET NOCOUNT ON;

	DECLARE @version as int,
			@Nom as varchar(50),
			@Description as varchar(100),
			@CompteRangeTable as int,
			@CreateDateTime	as datetime

	IF OBJECT_ID('[dbo].[Stage_MainOeuvreOptimization]', 'U') IS NOT NULL
		DROP TABLE [dbo].[Stage_MainOeuvreOptimization];

	SELECT   [id]										
			,[Numero]									AS [NumeroOptimization]
			,[Presupuesto]								AS [Numero]
			,[Version]									AS [Version]
			,[Orden]									AS [Ordre]
			,[SubModel]									AS [SousModele]
			,[Puesto]									AS [PosteTravail]
			,[Segundos]									AS [Secondes]
			,[Quantity]									AS [Quantite]
			,CONVERT(DATETIME, [DateCreation])			AS [Date de creation]
			,CONVERT(DATETIME, [DateModification])		AS [Date de Modif.]	
	INTO [Prevost].[dbo].[Stage_MainOeuvreOptimization]
	FROM [Prevost].[dbo].[Brute_ManoObraOptimizaciones]

	SET @version			= 1
	SET @Nom				= 'Stage_MainOeuvreOptimization'
	SET @Description		= 'Chargement initial'
	SET @CompteRangeTable	= (SELECT COUNT(*) FROM [Prevost].[dbo].[Brute_PuestosMO])
	SET @CreateDateTime		= GETDATE()

	EXEC sp_Inserer_CompteTableIntergiciel @Version, @Nom, @Description, @CompteRangeTable, @CreateDateTime 

END
GO


