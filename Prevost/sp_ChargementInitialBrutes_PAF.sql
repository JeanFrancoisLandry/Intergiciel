﻿

-- =============================================
-- Author:		JF Landry
-- Create date: 2019-11-25
-- Description:	Chargement initial des données brutes provenant de la table PAF
-- =============================================
CREATE PROCEDURE [dbo].[sp_ChargementInitialBrutes_PAF]

AS
BEGIN

	SET NOCOUNT ON;

	DECLARE @version as int,
			@Nom as varchar(50),
			@Description as varchar(100),
			@CompteRangeTable as int,
			@CreateDateTime	as datetime

	IF OBJECT_ID('[dbo].[Brute_PAF]', 'U') IS NOT NULL
		DROP TABLE [dbo].[Brute_PAF];

		SELECT [Numero]
			,[Version]
			,[RowId]
			,[Alias]
			,[EntityId]
			,[FechaSolicitud]
			,[Type]
			,[SubType]
			,[NumerationId]
			,[Referencia]
			,[UserCode]
			,[Divisa]
			,[PriceCurrency]
			,[CostCurrency]
			,[NumeroPedido]
			,[CIP]
			,[FechaConfirmacion]
			,[Confirmado]
			,[ReadyToProdDate]
			,[IsActive]
			,[NombreVersion]
			,[SubOrderNumber]
			,[VersionCopiaDe]
			,[CodigoCliente]
			,[CustomerEntityId]
			,[Nombre]
			,[Domicilio]
			,[Domicilio2]
			,[Localidad]
			,[CodigoPostal]
			,[Provincia]
			,[Pais]
			,[Telefono]
			,[EMail]
			,[NIF]
			,[GLN]
			,[CustomerRoleId]
			,[NombreTarifa]
			,[NombreTarifaOpcional]
			,[GoalTariff]
			,[ResellerTariff]
			,[ResellerSalesTariff]
			,[CostTariff]
			,[Importe]
			,[GoalAmount]
			,[SubTotal]
			,[IVA]
			,[RecargoEquivalencia]
			,[Obra]
			,[DireccionObra]
			,[DireccionObra2]
			,[CodigoPostalObra]
			,[LocalidadObra]
			,[ProvinciaObra]
			,[PaisObra]
			,[TelefonoObra]
			,[ShipToFax]
			,[ShipToContactName]
			,[ShipToComments]
			,[ShipToAreaCode]
			,[SemanaEntrega]
			,[RealDeliveryWeek]
			,[FechaEntrega]
			,[RealDeliveryDate]
			,[Urgente]
			,[Provisional]
			,[NombreFactura]
			,[DireccionFactura]
			,[DireccionFactura2]
			,[CodigoPostalFactura]
			,[LocalidadFactura]
			,[ProvinciaFactura]
			,[PaisFactura]
			,[TelefonoFactura]
			,[BillToComments]
			,[Comentario]
			,[Anotacion]
			,[Sucio]
			,[RecalculateOnLoad]
			,[IncluirEnFacturacion]
			,[Cerrado]
			,[ForMounting]
			,[AcceptedDate]
			,[FechaRevision]
			,[FechaDespiece]
			,[MeasurementDate]
			,[FechaEntradaTaller]
			,[FechaSalidaTaller]
			,[FechaMontaje]
			,[FechaFacturado]
			,[FechaPagado]
			,[CommissionPaymentDate]
			,[FechaCancelado]
			,[CancellationReasonId]
			,[FechaContabilizado]
			,[FechaCompras]
			,[StockUpdateDate]
			,[ShippingDate]
			,[SalesmanCode]
			,[Salesman2Code]
			,[RecargoComercial]
			,[Certificacion]
			,[Retencion]
			,[RetentionType]
			,[TotalCertificacionAnterior]
			,[FormaDePago]
			,[CantidadACuenta]
			,[InvoicingType]
			,[IdOpciones]
			,[ShopNumber]
			,[ShopVersion]
			,[LanguageId]
			,[PrefRowVersion]
			,[Severity]
			,[CommissionPercentage]
			,[User1]
			,[User2]
			,[XMLParam]
			,[ProductionPlantCode]
			,[CommissionXML]
			,[CommissionBlocked]
			,[DrawingVisualPropertiesXML]
			,[XMLExtraData]
			,[KernelUTCModificationTime]
			,[BackgroundUTCModificationTime]
			,[ErrorOnBackgroundSaving]
			,[ProductionState]
			,[OwnerEntityId]
			,[Public]
			,[ReadyForFactoryDate]
			,[NewWizardMode]
			,[DiscountTypeForCost]
			,[DiscountTypeForPrice]
			,[PDEDiscountsDisabled]
			,[ServiceAgentCode]
			,[WarrantyAccepted]
			,[WarrantyType]
			,[PreSettingDefinition]
			,[ProjectName]
			,[PlanningCalculationDate]
			,[RequiredPaymentDate]
			,[TermOfDelivery]
			,[ModeOfTransport]
			,[ShippingMethodId]
			,[CommercialDeliveryDate]
			,[OwnerChangeUTCTime]
			,[UnitsMode]
			,[DeletedUTCDate]
			,[BillToEMail]
			,GETDATE()						AS DateCreation
			,GETDATE()						AS DateModification
	INTO [Prevost].[dbo].[Brute_PAF]
	FROM [ADP_Prod].[dbo].[PAF]

	SET @version			= 1
	SET @Nom				= 'Brute_PAF'
	SET @Description		= 'Chargement initial'
	SET @CompteRangeTable	= (SELECT COUNT(*) FROM [ADP_Prod].[dbo].[PAF])
	SET @CreateDateTime		= GETDATE()

	EXEC sp_Inserer_CompteTableIntergiciel @Version, @Nom, @Description, @CompteRangeTable, @CreateDateTime 

END
GO
