-- =============================================
-- Author:		JF Landry
-- Create date: 2019-11-25
-- Description:	Chargement initial des données brutes provenant 
--				de l'aggrégation des tables utilisateurs
-- =============================================
CREATE PROCEDURE [dbo].[sp_ChargementInitialBrutes_CMSStaff]

AS
BEGIN

	SET NOCOUNT ON;

	DECLARE @version as int,
			@Nom as varchar(50),
			@Description as varchar(100),
			@CompteRangeTable as int,
			@CreateDateTime	as datetime

	IF OBJECT_ID('[dbo].[Brute_CMSStaff]', 'U') IS NOT NULL
		DROP TABLE [dbo].[Brute_CMSStaff];

		SELECT AR.RoleSpecificCode AS Codigo
			,[ADP_Prod].dbo.CMS_GetComposedName(C.ContactId) AS Nombre
			,ADR.Address1 AS Domicilio
			,ADR.City AS Localidad
			,ADR.PostalCode AS CodigoPostal
			,ADR.Province AS Provincia
			,ADR.Country AS Pais
			,LTRIM(RTRIM(LEFT((ISNULL(CAST(PHO.InternationalCode AS NCHAR(4)), N'') + ISNULL(PHO.AreaCode, N'') + PHO.Number + ISNULL(PHO.Extension, N'')), 25))) AS Telefono
			,N'' AS Fax
			,ACC.FIN AS Nif
			,ACC.CreationDate AS FechaAlta
			,N'' AS Texto
			,N'' AS Telefono1
			,N'' AS Telefono2
			,N'' AS Telefono3
			,N'' AS Fax1
			,N'' AS Fax2
			,ACC.Website AS www
			,EML.Email AS email
			,S.MagneticBand AS BandaMagnetica
			,S.Password AS ProdPassword
			,S.LOGIN AS LOGIN
			,C.Profession
			,C.Job
			,C.Office
			,C.Department
	INTO [Prevost].[dbo].[Brute_CMSStaff]
	FROM [ADP_Prod].[dbo].CMSStaff S
		INNER JOIN [ADP_Prod].[dbo].CMSAccountsRoles AR 
			ON AR.AccountId = S.AccountId
			AND AR.RoleId = [ADP_Prod].[dbo].[CMS_GetStaffRole]()
		INNER JOIN [ADP_Prod].[dbo].CMSAccounts ACC 
			ON ACC.AccountId = AR.AccountId
		INNER JOIN [ADP_Prod].[dbo].CMSContacts C 
			ON C.ContactId = ACC.AccountId
		LEFT OUTER JOIN [ADP_Prod].[dbo].CMSAddresses ADR 
			ON ADR.AddressId = ACC.MainAddressId
		LEFT OUTER JOIN [ADP_Prod].[dbo].CMSPhones PHO 
			ON PHO.PhoneId = ACC.MainPhoneId
		LEFT OUTER JOIN [ADP_Prod].[dbo].CMSEmails EML 
			ON EML.EmailId = ACC.MainEmailId

	SET @version			= 1
	SET @Nom				= 'Brute_CMSStaff'
	SET @Description		= 'Chargement initial'
	SET @CompteRangeTable	= (SELECT COUNT(*) FROM [Prevost].[dbo].[Brute_CMSStaff])
	SET @CreateDateTime		= GETDATE()

	EXEC sp_Inserer_CompteTableIntergiciel @Version, @Nom, @Description, @CompteRangeTable, @CreateDateTime 

END
GO


