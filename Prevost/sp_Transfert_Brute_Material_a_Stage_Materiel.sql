
-- =======================================================================================================================================
-- Author:		JF Landry
-- Create date: 2019-12-17
-- Description:	Transfert de la table [Materiales] contenant le matériels pour les projets (soummision, commande, facture & bon de livraison)
--				dans une table transformée appelée materiel.
-- =======================================================================================================================================

CREATE PROCEDURE [dbo].[sp_Transfert_Brute_Material_a_Stage_Materiel]


AS
BEGIN
	SET NOCOUNT ON;

	DECLARE @version as int,
			@Nom as varchar(50),
			@Description as varchar(100),
			@CompteRangeTable as int,
			@CreateDateTime	as datetime

	IF OBJECT_ID('[dbo].[Stage_Materiel]', 'U') IS NOT NULL
		DROP TABLE [dbo].[Stage_Materiel];

	SELECT DISTINCT  [ReferenciaBase]		COLLATE SQL_Latin1_General_CP1_CI_AS AS [ReferenceBase]
					 ,[Referencia]			COLLATE SQL_Latin1_General_CP1_CI_AS AS [Reference]
					 ,CASE WHEN ([Color] <> '510')  
						AND ([Color] <> '518')  
						AND  ([Color] <> '541') 
						AND  ([Color] <> '543') 
						AND  ([Color] <> '546') 
						AND  ([Color] <> '549')  THEN 'Peint'
					ELSE ISNULL([Color], SPACE(0))
					END COLLATE SQL_Latin1_General_CP1_CI_AS [Couleur]
					,ISNULL([LongitudBarra], SPACE(0)) AS [Longueur]
					,[WastageAllowance]				   AS [Perte]
					,[UseWastageAllowanceInMN]		   AS [UtilisationPerte]
					,CONVERT(DATETIME, [DateCreation])		AS [Date de creation]
					,CONVERT(DATETIME, [DateModification])	AS [Date de Modif.]
	  INTO [Prevost].[dbo].[Stage_Materiel]
	  FROM [Prevost].[dbo].[Brute_Material]
	  ORDER BY 1 ASC

	SET @version			= 1
	SET @Nom				= 'Stage_Materiel'
	SET @Description		= 'Chargement initial'
	SET @CompteRangeTable	= (SELECT COUNT(*) FROM [Prevost].[dbo].[Brute_Material])
	SET @CreateDateTime		= GETDATE()

	EXEC sp_Inserer_CompteTableIntergiciel @Version, @Nom, @Description, @CompteRangeTable, @CreateDateTime 

END
GO


