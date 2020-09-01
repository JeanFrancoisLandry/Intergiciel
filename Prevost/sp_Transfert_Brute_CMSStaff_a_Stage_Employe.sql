
-- =======================================================================================================================================
-- Author:		JF Landry
-- Create date: 2019-12-17
-- Description:	Transfert de les tables aggrégé [CMSStaff], [CMSAccountsRoles], [CMS_GetStaffRole], 
-- [CMSAccounts], [CMSContacts], [CMSAddresses], [CMSPhones], [CMSEmails]
-- contenant le matériels pour les projets 
--				dans une table transformée appelée TypeProduits.
-- =======================================================================================================================================

CREATE PROCEDURE [dbo].[sp_Transfert_Brute_CMSStaff_a_Stage_Employe]

AS
BEGIN
	SET NOCOUNT ON;

	DECLARE @version as int,
			@Nom as varchar(50),
			@Description as varchar(100),
			@CompteRangeTable as int,
			@CreateDateTime	as datetime

	IF OBJECT_ID('[dbo].[Stage_Employe]', 'U') IS NOT NULL
		DROP TABLE [dbo].[Stage_Employe];

	SELECT	 [Codigo]							AS Code
			,[Nombre]					COLLATE SQL_Latin1_General_CP1_CI_AS		AS [NomEmploye]	
			,LOGIN	COLLATE SQL_Latin1_General_CP1_CI_AS AS [Identifiant]					
			,CONVERT(DATETIME, FechaAlta)		AS [Date de creation]
	INTO [Prevost].[dbo].[Stage_Employe]
	FROM [Prevost].[dbo].[Brute_CMSStaff]

	SET @version			= 1
	SET @Nom				= '[Stage_Employe]'
	SET @Description		= 'Table stage'
	SET @CompteRangeTable	= (SELECT COUNT(*) FROM [Prevost].[dbo].[Brute_CMSStaff])
	SET @CreateDateTime		= GETDATE()

	EXEC sp_Inserer_CompteTableIntergiciel @Version, @Nom, @Description, @CompteRangeTable, @CreateDateTime 

END
GO


