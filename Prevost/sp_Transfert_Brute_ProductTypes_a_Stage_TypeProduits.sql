
-- =======================================================================================================================================
-- Author:		JF Landry
-- Create date: 2019-12-17
-- Description:	Transfert de la table [ProductTypes] contenant le matériels pour les projets 
--				dans une table transformée appelée TypeProduits.
-- =======================================================================================================================================

CREATE PROCEDURE [dbo].[sp_Transfert_Brute_ProductTypes_a_Stage_TypeProduits]

AS
BEGIN
	SET NOCOUNT ON;

	DECLARE @version as int,
			@Nom as varchar(50),
			@Description as varchar(100),
			@CompteRangeTable as int,
			@CreateDateTime	as datetime

	IF OBJECT_ID('[dbo].[Stage_TypeProduits]', 'U') IS NOT NULL
		DROP TABLE [dbo].[Stage_TypeProduits];

	SELECT	 [Code]																		AS [Code]
			,[Name]									COLLATE SQL_Latin1_General_CP1_CI_AS AS [TypeProduit]	
			,ISNULL([ProcessingClass], SPACE(0))	AS [Classe]					
			,CONVERT(DATETIME, [DateCreation])		AS [Date de creation]
			,CONVERT(DATETIME, [DateModification])	AS [Date de Modif.]
	INTO [Prevost].[dbo].[Stage_TypeProduits]
	FROM [Prevost].[dbo].[Brute_ProductTypes]

	SET @version			= 1
	SET @Nom				= '[Stage_TypeProduits]'
	SET @Description		= 'Chargement initial'
	SET @CompteRangeTable	= (SELECT COUNT(*) FROM [Prevost].[dbo].[Brute_ProductTypes])
	SET @CreateDateTime		= GETDATE()

	EXEC sp_Inserer_CompteTableIntergiciel @Version, @Nom, @Description, @CompteRangeTable, @CreateDateTime 

END
GO


