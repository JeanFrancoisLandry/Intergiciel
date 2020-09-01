
-- =======================================================================================================================================
-- Author:		JF Landry
-- Create date: 2019-11-26
-- Description:	Transfert de la table [Brute_PAF] contenant les projet (soummision, commande, facture & bon de livraison)
--				dans une table transformée appelée Projet.
-- =======================================================================================================================================

CREATE PROCEDURE [dbo].[sp_Transfert_Brute_PAF_a_Stage_Project]

AS
BEGIN
	SET NOCOUNT ON;

	DECLARE @version as int,
			@Nom as varchar(50),
			@Description as varchar(100),
			@CompteRangeTable as int,
			@CreateDateTime	as datetime

	IF OBJECT_ID('[dbo].[Stage_Projet]', 'U') IS NOT NULL
		DROP TABLE [dbo].[Stage_Projet];

	SELECT [Numero]																
		  ,[Version]
		  ,CONVERT(NVARCHAR(50), ISNULL([NumeroPedido], 0))				COLLATE SQL_Latin1_General_CP1_CI_AS AS [Numero Commande]
		  ,CONVERT(DATE, [FechaSolicitud])									  								 AS [Date de Demande]
		  ,[Type]	
		  ,[SubType] 
		  ,[NumerationId]
		  ,ISNULL([Referencia], SPACE(0))								COLLATE SQL_Latin1_General_CP1_CI_AS AS [Reference]
		  ,[UserCode]																						 AS [Code Utilisateur]
		  ,u.EmployeeName												COLLATE SQL_Latin1_General_CP1_CI_AS AS [Nom Utilisateur]
		  ,ISNULL(CONVERT(DATE, [FechaConfirmacion]), '1754-01-01')											 AS [Date de Confirmation]
		  ,ISNULL([Confirmado], SPACE(0))																	 AS [Confirmation]
		  ,ISNULL(CONVERT(DATE, [ReadyToProdDate]), '1754-01-01')											 AS [Pret Production]
		  ,[IsActive]																						 AS [Active]
		  ,ISNULL([NombreVersion], SPACE(0))																 AS [Nom de version]
		  ,ISNULL([SubOrderNumber], SPACE(0)) 																 AS [Numero Sous-Comm.]
		  ,[VersionCopiaDe]																					 AS [Copie de version]
		  ,[CodigoCliente]																					 AS [Code Client]
		  ,[Nombre] COLLATE SQL_Latin1_General_CP1_CI_AS													 AS [Nom]
		  ,ISNULL([Domicilio], SPACE(0))								COLLATE SQL_Latin1_General_CP1_CI_AS AS [Adresse]
		  ,ISNULL([Domicilio2], SPACE(0))								COLLATE SQL_Latin1_General_CP1_CI_AS AS [Adresse2]
		  ,ISNULL([Localidad], SPACE(0))								COLLATE SQL_Latin1_General_CP1_CI_AS AS [Ville]
		  ,ISNULL([CodigoPostal], SPACE(0))								COLLATE SQL_Latin1_General_CP1_CI_AS AS [Code Postal]
		  ,ISNULL([Provincia], SPACE(0))								COLLATE SQL_Latin1_General_CP1_CI_AS AS [Province]
		  ,ISNULL([Pais], SPACE(0))										COLLATE SQL_Latin1_General_CP1_CI_AS AS [Pays]
		  ,ISNULL([Telefono], SPACE(0))									COLLATE SQL_Latin1_General_CP1_CI_AS AS [Telephone]
		  ,ISNULL([EMail], SPACE(0))									COLLATE SQL_Latin1_General_CP1_CI_AS AS [Courriel]
		  ,ISNULL([NIF], SPACE(0))										COLLATE SQL_Latin1_General_CP1_CI_AS AS [Nom Client]
		  ,[NombreTarifa]												COLLATE SQL_Latin1_General_CP1_CI_AS AS [Code de tarif]
		  ,[GoalTariff]													COLLATE SQL_Latin1_General_CP1_CI_AS AS [Code de tarif 2]
		  ,[Importe]													
		  ,[SubTotal] 
		  ,ISNULL([Obra], SPACE(0))										COLLATE SQL_Latin1_General_CP1_CI_AS AS [Projet]
		  ,ISNULL([DireccionObra], SPACE(0))							COLLATE SQL_Latin1_General_CP1_CI_AS AS [Adresse des travaux]
		  ,ISNULL([CodigoPostalObra], SPACE(0))							COLLATE SQL_Latin1_General_CP1_CI_AS AS [Code postal Travaux]
		  ,ISNULL([LocalidadObra], SPACE(0))							COLLATE SQL_Latin1_General_CP1_CI_AS AS [Ville Travaux]
		  ,ISNULL([ProvinciaObra], SPACE(0))							COLLATE SQL_Latin1_General_CP1_CI_AS AS [Province Travaux]
		  ,ISNULL([PaisObra], SPACE(0))									COLLATE SQL_Latin1_General_CP1_CI_AS AS [Pays travaux]
		  ,ISNULL([TelefonoObra], SPACE(0))								COLLATE SQL_Latin1_General_CP1_CI_AS AS [Telephone Travaux]
		  ,ISNULL([ShipToFax], SPACE(0))								COLLATE SQL_Latin1_General_CP1_CI_AS AS [Type de construction]		--Non
		  ,ISNULL([ShipToContactName]	, SPACE(0))						COLLATE SQL_Latin1_General_CP1_CI_AS AS [Region Administrative]
		  ,ISNULL([SemanaEntrega], SPACE(0))																 AS [Semaine de livraison]
		  ,ISNULL(CONVERT(DATE, [FechaEntrega]),  '1754-01-01')												 AS [Date de livraison]
		  ,ISNULL([DireccionFactura], SPACE(0))							COLLATE SQL_Latin1_General_CP1_CI_AS AS [Adresse de facturation]			
		  ,ISNULL([DireccionFactura2], SPACE(0))						COLLATE SQL_Latin1_General_CP1_CI_AS AS [Adresse de facturation 2]			
		  ,ISNULL([CodigoPostalFactura]	, SPACE(0))						COLLATE SQL_Latin1_General_CP1_CI_AS AS [Code postal facturation]
		  ,ISNULL([LocalidadFactura], SPACE(0))							COLLATE SQL_Latin1_General_CP1_CI_AS AS [Ville Facturation]
		  ,ISNULL([ProvinciaFactura], SPACE(0))							COLLATE SQL_Latin1_General_CP1_CI_AS AS [Province Facturation]
		  ,ISNULL([PaisFactura], SPACE(0))								COLLATE SQL_Latin1_General_CP1_CI_AS AS [Pays Facturation]
		  ,ISNULL([TelefonoFactura], SPACE(0))							COLLATE SQL_Latin1_General_CP1_CI_AS AS [Telephone Facturation]
		  ,ISNULL([Comentario], SPACE(0))								COLLATE SQL_Latin1_General_CP1_CI_AS AS [Commentaire]
		  ,ISNULL([Anotacion], SPACE(0))								COLLATE SQL_Latin1_General_CP1_CI_AS AS [Note]
		  ,[Sucio]																							 AS [Vente]
		  ,ISNULL(CONVERT(DATE, [AcceptedDate]), '1754-01-01')												 AS [Date d'acceptation]
		  ,ISNULL(CONVERT(DATE, [FechaDespiece]), '1754-01-01')												 AS [Date de decoupe]
		  ,ISNULL(CONVERT(DATE, [FechaContabilizado]), '1754-01-01')										 AS [Date compte]
		  ,ISNULL([FormaDePago], SPACE(0))								COLLATE SQL_Latin1_General_CP1_CI_AS AS [Termes paiement]
		  ,[LanguageId]																						 AS [Langue]
		  ,[PrefRowVersion] 
		  ,ISNULL([User1], SPACE(0))									COLLATE SQL_Latin1_General_CP1_CI_AS AS [Contact]
		  ,ISNULL([User2], SPACE(0))									COLLATE SQL_Latin1_General_CP1_CI_AS AS [Information]					
		  ,CONVERT(DATE, [KernelUTCModificationTime])														 AS [Date Modif. Syst.]
		  ,[ProductionState]																				 AS [Etat de production]
		  ,ISNULL(CONVERT(DATE, [PlanningCalculationDate]), '1754-01-01')									 AS [Date de planif.]
		  ,ISNULL([BillToEMail], SPACE(0))								COLLATE SQL_Latin1_General_CP1_CI_AS AS [Facture par email]
		  ,CONVERT(DATETIME, [DateCreation])																 AS [Date de creation]
		  ,CONVERT(DATETIME, [DateModification])															 AS [Date de Modif.]
	INTO [Prevost].[dbo].[Stage_Projet]
	FROM [Prevost].[dbo].[Brute_PAF] bp
		INNER JOIN [ADP_Prod].[dbo].[vwCMSStaffCodeName] u
			ON bp.[userCode] = u.[EmployeeCode]
	ORDER BY Numero DESC

	SET @version			= 1
	SET @Nom				= 'Stage_Projet'
	SET @Description		= 'Chargement initial'
	SET @CompteRangeTable	= (SELECT COUNT(*) FROM [Prevost].[dbo].[Brute_PAF])
	SET @CreateDateTime		= GETDATE()

	EXEC sp_Inserer_CompteTableIntergiciel @Version, @Nom, @Description, @CompteRangeTable, @CreateDateTime 

END
GO


