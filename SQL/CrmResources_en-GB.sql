/*=CONCATENATE("SELECT N'";A1;"', N'";B1;"' UNION ALL")*/
DECLARE @ResourcesTable TABLE (Name VARCHAR (128), Value NVARCHAR (MAX), Description NVARCHAR (MAX))

DECLARE @ResourceID INT, @ResourceTypeID INT, @LanguageID INT
DECLARE @Name VARCHAR (128), @Value NVARCHAR (MAX), @Description NVARCHAR (MAX)

SET @ResourceTypeID = NULL
SELECT TOP 1 @ResourceTypeID = ResourceTypeID FROM ResourceTypes WHERE Name = 'CrmResources'
SET @ResourceTypeID = ISNULL (@ResourceTypeID, 0)

SET @LanguageID = NULL
SELECT TOP 1 @LanguageID = LanguageID FROM Languages WHERE CultureName = 'en-GB' --AND IsEnabled = 1
SET @LanguageID = ISNULL(@LanguageID, 0)

IF (@ResourceTypeID > 0 AND @LanguageID > 0) BEGIN
	INSERT INTO @ResourcesTable (Name, Value)
		SELECT N'ActivationEmail_ResetPassword', N'Please log in to your {0} account to change your password. Your temporary password is: {1}' UNION ALL
		SELECT N'Aprove_as_Customer', N'Lead to Customer' UNION ALL
		SELECT N'AvatarPanel_Button_Reset', N'Reset' UNION ALL
		SELECT N'AvatarPanel_Button_UploadLogo', N'Upload Logo' UNION ALL
		SELECT N'Button_AddToInventory', N'Add to Inventory' UNION ALL
		SELECT N'Button_BuySubscription', N'Buy Subscription' UNION ALL
		SELECT N'Button_IncludePDFAttachment', N'Include PDF attachment' UNION ALL
		SELECT N'Button_MarkAsSent', N'Mark as sent' UNION ALL
		SELECT N'Button_SaveOrder', N'Save Order' UNION ALL
		SELECT N'Button_SaveQuote', N'Save Quote' UNION ALL
		SELECT N'Button_SelectOption', N'Select Option' UNION ALL
		SELECT N'Button_SendMeACopy', N'Send me a copy' UNION ALL
		SELECT N'Cancel_Title', N'Canceled' UNION ALL
		SELECT N'Category_Message_LevelForbidden', N'Can not add child category at this level!' UNION ALL
		SELECT N'Company_Message_AlredySelectedDiscunt', N'There is already a discount for the selected product!' UNION ALL
		SELECT N'ContentType_BOM', N'BOM' UNION ALL
		SELECT N'ContentType_Company', N'Company' UNION ALL
		SELECT N'ContentType_Customer', N'Customer' UNION ALL
		SELECT N'ContentType_Document', N'Document' UNION ALL
		SELECT N'ContentType_Employee', N'Employee' UNION ALL
		SELECT N'ContentType_Industry', N'Industry' UNION ALL
		SELECT N'ContentType_Location', N'Location' UNION ALL
		SELECT N'ContentType_Product', N'Product' UNION ALL
		SELECT N'ContentType_Store', N'Store' UNION ALL
		SELECT N'ContentType_Subscription', N'Subscription' UNION ALL
		SELECT N'ContentType_Supplier', N'Supplier' UNION ALL
		SELECT N'ContentType_TimeEntry', N'Time Entry' UNION ALL
		SELECT N'Data_Active', N'Active' UNION ALL
		SELECT N'Data_ActivitiesAndSocieties', N'Activities And Societies' UNION ALL
		SELECT N'Data_ActualFinish', N'Actual Finish' UNION ALL
		SELECT N'Data_ActualStart', N'Actual Start' UNION ALL
		SELECT N'Data_Add', N'Add' UNION ALL
		SELECT N'Data_Admin', N'Admin' UNION ALL
		SELECT N'Data_After', N'After' UNION ALL
		SELECT N'Data_AnnualPlanSave', N'You save {0}{1} with annual plan' UNION ALL
		SELECT N'Data_Available', N'Available' UNION ALL
		SELECT N'Data_AssignedTo', N'Assigned To' UNION ALL
		SELECT N'Data_Barcode', N'Barcode' UNION ALL
		SELECT N'Data_BilledAnnually', N'Billed Annually' UNION ALL
		SELECT N'Data_BilledMonthly', N'Billed Monthly' UNION ALL
		SELECT N'Data_BillingShippingInfo', N'Billing/Shipping info' UNION ALL
		SELECT N'Data_BillOfMaterial', N'Bill of Material' UNION ALL
		SELECT N'Data_BillTo', N'Bill To' UNION ALL
		SELECT N'Data_BOM', N'Bill of Material' UNION ALL
		SELECT N'Data_BOMNumber', N'BOM #' UNION ALL
		SELECT N'Data_Booked', N'Booked' UNION ALL
		SELECT N'Data_BuyPrice', N'Buy Price' UNION ALL
		SELECT N'Data_ChangeSubscriptionPlanTitle', N'Change your subscription plan' UNION ALL
		SELECT N'Data_ClaimLimit', N'Claim Limit' UNION ALL
		SELECT N'Data_Client', N'Client' UNION ALL
		SELECT N'Data_CloneDocument', N'Clone Document' UNION ALL
		SELECT N'Data_CloneProduct', N'Clone Product' UNION ALL
		SELECT N'Data_Code', N'Code' UNION ALL
		SELECT N'Data_Code_URL', N'Code / Url' UNION ALL
		SELECT N'Data_Committed', N'Committed' UNION ALL
		SELECT N'Data_Company', N'Company' UNION ALL
		SELECT N'Data_CompanyCode', N'Company Code' UNION ALL
		SELECT N'Data_CompanyLogo', N'Company Logo' UNION ALL
		SELECT N'Data_CompanyName', N'Company Name' UNION ALL
		SELECT N'Data_CompanyNumber', N'Company Number' UNION ALL
		SELECT N'Data_Component', N'Component' UNION ALL
		SELECT N'Data_Consumed', N'Consumed' UNION ALL
		SELECT N'Data_CostOfMaterials', N'Cost of Materials' UNION ALL
		SELECT N'Data_Contractor', N'Contractor' UNION ALL
		SELECT N'Data_Contracts', N'Contracts' UNION ALL
		SELECT N'Data_ContractAmount', N'Contract Amount' UNION ALL
		SELECT N'Data_Contract_Number', N'Contract Number' UNION ALL
		SELECT N'Data_ContractPreference', N'Contract Preference' UNION ALL
		SELECT N'Data_Currency', N'Currency' UNION ALL
		SELECT N'Data_Customer', N'Customer' UNION ALL
		SELECT N'Data_CustomerDetails', N'Details' UNION ALL
		SELECT N'Data_CustomerInfo', N'Customer info' UNION ALL
		SELECT N'Data_CustomerOrderPN', N'Customer Order PN' UNION ALL
		SELECT N'Data_Customers', N'Customers' UNION ALL
		SELECT N'Data_DailyRate', N'Daily Rate' UNION ALL
		SELECT N'Data_DateFrom', N'Date From' UNION ALL
		SELECT N'Data_DatePlaceProduction', N'Date, Place Production info' UNION ALL
		SELECT N'Data_DateofExpiry', N'Date of Expiry' UNION ALL
		SELECT N'Data_DatePeriod', N'Date Period' UNION ALL
		SELECT N'Data_DatePlaceProduction', N'Date, Place Production info' UNION ALL
		SELECT N'Data_DateRange', N'Date Range' UNION ALL
		SELECT N'Data_DateUntil', N'Date Until' UNION ALL
		SELECT N'Data_Deadline', N'Deadline' UNION ALL
		SELECT N'Data_Deal_Number', N'Deal Number' UNION ALL
		SELECT N'Data_Default', N'Default {0}' UNION ALL
		SELECT N'Data_Degree', N'Degree' UNION ALL
		SELECT N'Data_Delete', N'Delete' UNION ALL
		SELECT N'Data_Deliverables', N'Deliverables' UNION ALL
		SELECT N'Data_DesiredStartDate', N'Desired Start Date' UNION ALL
		SELECT N'Data_Device', N'Device' UNION ALL
		SELECT N'Data_Discount', N'Discount' UNION ALL
		SELECT N'Data_Distributor', N'Distributor' UNION ALL
		SELECT N'Data_Document', N'Document' UNION ALL
		SELECT N'Data_DocumentHeader', N'Document Header' UNION ALL
		SELECT N'Data_Documents', N'Documents' UNION ALL
		SELECT N'Data_Document_Log_Enabled', N'Is Is Document Log Enabled' UNION ALL
		SELECT N'Data_DueDate', N'Due Date' UNION ALL
		SELECT N'Data_Edit', N'Edit' UNION ALL
		SELECT N'Data_EditAll', N'Edit All' UNION ALL
		SELECT N'Data_Email', N'Email' UNION ALL
		SELECT N'Data_EmailTemplate', N'Email Template' UNION ALL
		SELECT N'Data_EndDate', N'End Date' UNION ALL
		SELECT N'Data_Excess', N'Excess' UNION ALL
		SELECT N'Data_Experiences', N'Experiences' UNION ALL
		SELECT N'Data_ExternalDocumentUrl', N'External Document Url' UNION ALL
		SELECT N'Data_FieldOfStudy', N'Field Of Study' UNION ALL
		SELECT N'Data_File_Manager_Enabled', N'Is File Manager Enabled' UNION ALL
		SELECT N'Data_FixedCost', N'Fixed Cost' UNION ALL
		SELECT N'Data_FixedTime', N'Fixed Time' UNION ALL
		SELECT N'Data_FollowingPeriod', N'To be carried out in the following period' UNION ALL
		SELECT N'Data_Generate', N'Generate' UNION ALL
		SELECT N'Data_Grade', N'Grade' UNION ALL
		SELECT N'Data_HoldsStock', N'Holds Stock' UNION ALL
		SELECT N'Data_IncludeRemoteOnlyWorkers', N'Include Remote Only Workers' UNION ALL
		SELECT N'Data_Incoming', N'Incoming' UNION ALL
		SELECT N'Data_Industry', N'Industry' UNION ALL
		SELECT N'Data_IdentityID', N'IdentityID' UNION ALL
		SELECT N'Data_Initial', N'Initial' UNION ALL
		SELECT N'Data_InitialCostPrice', N'Initial Cost Price' UNION ALL
		SELECT N'Data_InitialStockLevel', N'Initial Stock Level' UNION ALL
		SELECT N'Data_InviteOnly', N'Invite Only' UNION ALL
		SELECT N'Data_InvoiceDate', N'Invoice Date' UNION ALL
		SELECT N'Data_InvoiceDetails', N'Invoice Details' UNION ALL
		SELECT N'Data_InvoiceLink', N'Invoice Link' UNION ALL
		SELECT N'Data_InvoiceNumber', N'Invoice #' UNION ALL
		SELECT N'Data_InvoiceUntil', N'Invoice Until' UNION ALL
		SELECT N'Data_IR35Payroll', N'IR35 & Payroll' UNION ALL
		SELECT N'Data_IsHeadquarter', N'Is Headquarter' UNION ALL
		SELECT N'Data_IsProcured', N'Is Procured' UNION ALL
		SELECT N'Data_IsProductPackage', N'Is Product Package' UNION ALL
		SELECT N'Data_IssueDate', N'Issue Date' UNION ALL
		SELECT N'Data_ItemCost', N'Item Cost' UNION ALL
		SELECT N'Data_ItemName', N'Item Name' UNION ALL
		SELECT N'Data_JobDuration', N'Job Duration' UNION ALL
		SELECT N'Data_JobTitle', N'Job Title' UNION ALL
		SELECT N'Data_LabourCost', N'Labour Cost' UNION ALL
		SELECT N'Data_Lead', N'Lead' UNION ALL
		SELECT N'Data_ManufacturingCost', N'Manufacturing Cost' UNION ALL
		SELECT N'Data_ManufacturingNumber', N'Manufacturing Order#' UNION ALL
		SELECT N'Data_MaterialCost', N'Material Cost' UNION ALL
		SELECT N'Data_Materials', N'Materials' UNION ALL
		SELECT N'Data_MediaInfo', N'Media Info' UNION ALL
		SELECT N'Data_Member', N'Member' UNION ALL
		SELECT N'Data_MonthMember', N'month per team member' UNION ALL
		SELECT N'Data_NextInvoice', N'Next Invoice' UNION ALL
		SELECT N'Data_NextInvoiceDate', N'Next Invoice Date' UNION ALL
		SELECT N'Data_Notice', N'Notice' UNION ALL
		SELECT N'Data_NumberOfContractors', N'Number Of Contractors' UNION ALL
		SELECT N'Data_NumberOfUsers', N'Number of users' UNION ALL
		SELECT N'Data_NotProcured', N'Not Procured' UNION ALL
		SELECT N'Data_OffPayrollOnly', N'Off Payroll Only' UNION ALL
		SELECT N'Data_OnOffPayroll', N'On or Off Payroll' UNION ALL
		SELECT N'Data_OnHand', N'On Hand' UNION ALL
		SELECT N'Data_OnPayrollOnly', N'On Payroll Only' UNION ALL
		SELECT N'Data_Operation', N'Operation' UNION ALL
		SELECT N'Data_Operations', N'Operations' UNION ALL
		SELECT N'Data_Operator', N'Operator' UNION ALL
		SELECT N'Data_OrderNumber', N'Order #' UNION ALL
		SELECT N'Data_PacketSize', N'Packet Size' UNION ALL
		SELECT N'Data_PacketSizeLabel', N'Packet Size Label' UNION ALL
		SELECT N'Data_Patient', N'Patient' UNION ALL
		SELECT N'Data_Physican', N'Physican' UNION ALL
		SELECT N'Data_PaidDate', N'Invoice date' UNION ALL
		SELECT N'Data_PaidOn', N'Paid On' UNION ALL
		SELECT N'Data_PaymentInfo', N'Payment info' UNION ALL
		SELECT N'Data_PaymentMethod', N'Payment Method' UNION ALL
		SELECT N'Data_Period', N'Period' UNION ALL
		SELECT N'Data_PeriodEnd', N'Peroid End' UNION ALL
		SELECT N'Data_PeriodStart', N'Period Start' UNION ALL
		SELECT N'Data_PeriodYear', N'every year {0}' UNION ALL
		SELECT N'Data_PeriodMonth', N'every month {0}' UNION ALL
		SELECT N'Data_PreferentialPrice', N'Preferential Price' UNION ALL
		SELECT N'Data_PIN', N'PIN' UNION ALL
		SELECT N'Data_PlannedFinish', N'Planned Finish' UNION ALL
		SELECT N'Data_PlannedStart', N'Planned Start' UNION ALL
		SELECT N'Data_Price', N'Price' UNION ALL
		SELECT N'Data_Product', N'Product' UNION ALL
		SELECT N'Data_ProductCost', N'Product Cost' UNION ALL
		SELECT N'Data_ProductDimensions', N'Product Dimensions' UNION ALL
		SELECT N'Data_ProductInfo', N'Product info' UNION ALL
		SELECT N'Data_ProductionCost', N'Operation Cost' UNION ALL
		SELECT N'Data_ProductionOrderNumber', N'Production Order #' UNION ALL
		SELECT N'Data_Products_Placeholder', N'Start typing SKU or name' UNION ALL
		SELECT N'Data_ProductType', N'Product Type' UNION ALL
		SELECT N'Data_Project', N'Project' UNION ALL
		SELECT N'Data_ProjectActivity', N'Project Activity' UNION ALL
		SELECT N'Data_ProjectBudget', N'Project Budget' UNION ALL
		SELECT N'Data_ProjectCoworkers', N'Project Coworkers' UNION ALL
		SELECT N'Data_ProjectDetails', N'Project Details' UNION ALL
		SELECT N'Data_ProjectDeliverable', N'Project Deliverable' UNION ALL
		SELECT N'Data_ProjectDuration', N'Project Duration' UNION ALL
		SELECT N'Data_ProjectProposals', N'Project Proposals' UNION ALL
		SELECT N'Data_ProjectRate', N'Project Rate' UNION ALL
		SELECT N'Data_ProjectRequirements', N'Project Requirements' UNION ALL
		SELECT N'Data_Projectspend', N'Project Spend' UNION ALL
		SELECT N'Data_PurchaseOrderNumber', N'Purchase Order #' UNION ALL
		SELECT N'Data_Released', N'Released' UNION ALL
		SELECT N'Data_RepeatEvery', N'Repeat every' UNION ALL
		SELECT N'Data_RepeaThisTransactionEvery', N'Repeat this transaction every' UNION ALL
		SELECT N'Data_Unavailable', N'Data Unavailable' UNION ALL
		SELECT N'Data_Qualification', N'Qualification' UNION ALL
		SELECT N'Data_Qualifications', N'Qualifications' UNION ALL
		SELECT N'Data_Quantity', N'Quantity' UNION ALL
		SELECT N'Data_QuoteDetails', N'Quote Details' UNION ALL
		SELECT N'Data_QuoteNumber', N'Quote #' UNION ALL
		SELECT N'Data_Read', N'Read' UNION ALL
		SELECT N'Data_RegistrationNumber', N'RegistrationNumber' UNION ALL
		SELECT N'Data_Reference', N'Reference' UNION ALL
		SELECT N'Data_RemoteOnly', N'Remote Only' UNION ALL
		SELECT N'Data_RenewalPeriod', N'Renewal Period' UNION ALL
		SELECT N'Data_RetailPrice', N'Retail Price' UNION ALL
		SELECT N'Data_Report', N'Report' UNION ALL
		SELECT N'Data_Reset_DocNo_NewYear', N'Resetting Document Numbers at a new Fiscal Year' UNION ALL
		SELECT N'Data_Routing', N'Routing' UNION ALL
		SELECT N'Data_RoutingNumber', N'Routing #' UNION ALL
		SELECT N'Data_RoutingNumbers', N'Routing #' UNION ALL
		SELECT N'Data_RowNumber', N'#ID' UNION ALL
		SELECT N'Data_SalesOrderDetails', N'Sales Order Details' UNION ALL
		SELECT N'Data_School', N'School' UNION ALL
		SELECT N'Data_SearchFilter', N'Search Filter' UNION ALL
		SELECT N'Data_ShipFrom', N'Ship From' UNION ALL
		SELECT N'Data_ShipmentDate', N'Shipment Date' UNION ALL
		SELECT N'Data_ShipmentNumber', N'Shipment #' UNION ALL
		SELECT N'Data_ShipTo', N'Ship To' UNION ALL
		SELECT N'Data_Shortlisted', N'Shortlisted' UNION ALL
		SELECT N'Data_ShowExternalDocumentUrl', N'Show External Document Url' UNION ALL
		SELECT N'Data_ShowOnStore', N'Show On Store' UNION ALL
		SELECT N'Data_ShowPaymentSlip', N'Show Payment Slip' UNION ALL
		SELECT N'Data_ShowShipping', N'Show Shippment Costs' UNION ALL
		SELECT N'Data_ShowSummary', N'Show Summary' UNION ALL
		SELECT N'Data_ShowTotals', N'Show Summary' UNION ALL
		SELECT N'Data_SIC', N'SIC' UNION ALL
		SELECT N'Data_Skill', N'Skill' UNION ALL
		SELECT N'Data_SkillType', N'Skill Type' UNION ALL
		SELECT N'Data_Sku', N'Sku' UNION ALL
		SELECT N'Data_StarRating', N'Star Rating' UNION ALL
		SELECT N'Data_StartDate', N'Start Date' UNION ALL
		SELECT N'Data_Status', N'Status' UNION ALL
		SELECT N'Data_StatusIssued', N'Issued' UNION ALL
		SELECT N'Data_StatusReceived', N'Received' UNION ALL
		SELECT N'Data_StockDue', N'Stock Due' UNION ALL
		SELECT N'Data_StockItem', N'Stock Item' UNION ALL
		SELECT N'Data_StoreName', N'Store Name' UNION ALL
		SELECT N'Data_StreetAddress', N'Street Address' UNION ALL
		SELECT N'Data_SubscriptionEndDate', N'Subscription End Date' UNION ALL
		SELECT N'Data_SubscriptionNumber', N'Subscription #' UNION ALL
		SELECT N'Data_SubscriptionNumberTitle', N'Number of subscriptions' UNION ALL
		SELECT N'Data_SubscriptionStartDate', N'Subscription Start Date' UNION ALL
		SELECT N'Data_Subtotal', N'Subtotal' UNION ALL
		SELECT N'Data_Supplier', N'Supplier' UNION ALL
		SELECT N'Data_SupplierInfo', N'Supplier info' UNION ALL
		SELECT N'Data_TargetLot', N'Target Lot' UNION ALL
		SELECT N'Data_Task', N'Task' UNION ALL
		SELECT N'Data_Tax', N'Tax' UNION ALL
		SELECT N'Data_TaxAmount', N'Tax amount' UNION ALL
		SELECT N'Data_TaxBase', N'Data_TaxBase' UNION ALL
		SELECT N'Data_TaxIncluded', N'Tax Included' UNION ALL
		SELECT N'Data_TaxNumber', N'Tax Number' UNION ALL
		SELECT N'Data_TaxRate', N'Tax Rate' UNION ALL
		SELECT N'Data_TaxType', N'Tax Type' UNION ALL
		SELECT N'Data_Time', N'Time' UNION ALL
		SELECT N'Data_TimeRequirement', N'Time Requirement' UNION ALL
		SELECT N'Data_TimeZone', N'Time Zone' UNION ALL
		SELECT N'Data_Total', N'Total' UNION ALL
		SELECT N'Data_TotalCost', N'Total Cost' UNION ALL
		SELECT N'Data_TotalDiscount', N'Total Discount' UNION ALL
		SELECT N'Data_TotalPrice', N'Total Price' UNION ALL
		SELECT N'Data_TotalsAre', N'Totals Are' UNION ALL
		SELECT N'Data_TotalTaxAmount', N'Totals Tax Amount' UNION ALL
		SELECT N'Data_TotalTime', N'Total Time' UNION ALL
		SELECT N'Data_TotalUnits', N'Total Units' UNION ALL
		SELECT N'Data_TotalWithoutTax', N'Totals Without Tax' UNION ALL
		SELECT N'Data_TransferOrderDetails', N'Transfer Order Details' UNION ALL
		SELECT N'Data_UnitOfMeasurement', N'Unit of Measurement' UNION ALL
		SELECT N'Data_Unread', N'Unread' UNION ALL
		SELECT N'Data_Value', N'Value' UNION ALL
		SELECT N'Data_VariableCost', N'Variable Cost' UNION ALL
		SELECT N'Data_VariableTime', N'Variable Time' UNION ALL
		SELECT N'Data_VATRegNo', N'VAT Reg No' UNION ALL
		SELECT N'Data_View', N'View' UNION ALL
		SELECT N'Data_ViewAll', N'View All' UNION ALL
		SELECT N'Data_Warehouse', N'Warehouse' UNION ALL
		SELECT N'Data_WarehouseEntrance', N'Warehouse Entrance' UNION ALL
		SELECT N'Data_WeeklyTimeRequirement', N'Weekly Time Requirement' UNION ALL
		SELECT N'Data_WholesalePrice', N'Wholesale Price' UNION ALL
		SELECT N'Data_WorkCenterType', N'Work Center Type' UNION ALL
		SELECT N'Date_StoreUrl', N'Store Url' UNION ALL
		SELECT N'Datra_History', N'History' UNION ALL
		SELECT N'DateFilter_LastMonth', N'Last Month' UNION ALL
		SELECT N'DateFilter_LastWeek', N'Last Week' UNION ALL
		SELECT N'DateFilter_LastYear', N'Last Year' UNION ALL
		SELECT N'DateFilter_ThisMonth', N'This Month' UNION ALL
		SELECT N'DateFilter_ThisWeek', N'This Week' UNION ALL
		SELECT N'DateFilter_ThisYear', N'This Year' UNION ALL
		SELECT N'DateFilter_NextYear', N'Next Years' UNION ALL
		SELECT N'DateFilter_Today', N'Today' UNION ALL
		SELECT N'DateFilter_Yesterday', N'Yesterday' UNION ALL
		SELECT N'Deal_Button_LOST', N'Lost' UNION ALL
		SELECT N'Deal_Button_WIN', N'Win' UNION ALL
		SELECT N'Description_CurrentSubscription', N'Your account is up and running. Your credit card will be charged {0} until you cancel your subscription. You can switch your current plan to any other plan at any time by making a few simple steps.' UNION ALL
		SELECT N'Document_CashSalesOrder', N'Cash Sales Order' UNION ALL
		SELECT N'Document_ExpenseOrder', N'Expense Order' UNION ALL
		SELECT N'Document_Message_NotEnoughStock', N'There is not enough stock on the warehouse!' UNION ALL
		SELECT N'Document_Message_SelectWarehouse', N'Please select your warehouse!' UNION ALL
		SELECT N'Document_Message_UnlinkedDocuments',N'Documents successfully unlinked' UNION ALL
		SELECT N'Document_Message_DocumentPlanLimit',N'Your document plan limit has been reached!' UNION ALL
		SELECT N'Document_Message_CustomerPlanLimit',N'Your customer plan limit has been reached!' UNION ALL
		SELECT N'Document_Message_ProductPlanLimit',N'Your product plan limit has been reached!' UNION ALL
		SELECT N'Document_ProductionEntryOrder', N'Production Entry Order' UNION ALL
		SELECT N'Document_RepresentationExpense',  N'Representation Expense' UNION ALL
		SELECT N'Documents_CashSalesOrders',  N'Cash Sales Orders' UNION ALL
		SELECT N'Documents_ExpenseOrders', N'Expense Orders' UNION ALL
		SELECT N'DocumentType_ForDelivery', N'ForDelivery' UNION ALL
		SELECT N'Documents_Invoices', N'Invoices' UNION ALL
		SELECT N'Documents_Orders', N'Sales Orders' UNION ALL
		SELECT N'Documents_Procurement', N'Procurements' UNION ALL
		SELECT N'Documents_ProductionOrders', N'Production Orders' UNION ALL
		SELECT N'Documents_ProductionEntryOrders', N'Production Entry Orders' UNION ALL
		SELECT N'Documents_PurchaseOrders', N'Purchase Orders' UNION ALL
		SELECT N'Documents_Quotes', N'Quotes' UNION ALL
		SELECT N'Documents_RepresentationExpenses', N'Representation Expenses' UNION ALL
		SELECT N'Documents_Shipments', N'Shipments' UNION ALL
		SELECT N'Documents_Subscriptions', N'Subscriptions' UNION ALL
		SELECT N'DocumentType_TimeSheets',N'TimeSheets' UNION ALL
		SELECT N'Documents_TransferOrders',  N'Transfer Orders' UNION ALL
		SELECT N'DocumentType_BOM', N'Bill of Material' UNION ALL
		SELECT N'DocumentType_CashSalesOrder', N'Cash Sales Order' UNION ALL
		SELECT N'DocumentType_Contract', N'Contract' UNION ALL
		SELECT N'DocumentType_Contracts', N'Contracts' UNION ALL
		SELECT N'DocumentType_Deal', N'Deal' UNION ALL
		SELECT N'DocumentType_Deals', N'Deals' UNION ALL
		SELECT N'DocumentType_ExpenseOrder', N'Expense Order' UNION ALL
		SELECT N'DocumentType_Invoice', N'Invoice' UNION ALL
		SELECT N'DocumentType_ManufacturingOrder', N'Manufacturing Order' UNION ALL
		SELECT N'DocumentType_Order', N'Order' UNION ALL
		SELECT N'DocumentType_Payment', N'Payment' UNION ALL
		SELECT N'DocumentType_ProductionEntryOrder', N'Production Entry Order' UNION ALL
		SELECT N'DocumentType_ProductionOrder', N'Production Order' UNION ALL
		SELECT N'DocumentType_PurchaseOrder', N'Purchase Order' UNION ALL
		SELECT N'DocumentType_RepeatingInvoice', N'Repeating Invoice' UNION ALL
		SELECT N'DocumentType_RecurringInvoices', N'Repeating Invoices' UNION ALL
		SELECT N'DocumentType_Quote', N'Quote' UNION ALL
		SELECT N'DocumentType_RepresentationExpense',  N'Representation Expense' UNION ALL
		SELECT N'Document_Route', N'Route' UNION ALL
		SELECT N'DocumentType_SalesOrder', N'Sales Order' UNION ALL
		SELECT N'DocumentType_Shipment', N'Shipment' UNION ALL
		SELECT N'DocumentType_Subscription', N'Subscription' UNION ALL
		SELECT N'DocumentType_TimeSheets', N'TimeSheets' UNION ALL
		SELECT N'DocumentType_TransferOrder', N'Transfer Order' UNION ALL
		SELECT N'DocumentReport_LatestDocuments', N'Latest Documents' UNION ALL
		SELECT N'DocumentReport_LatestCustomers', N'Latest Customers' UNION ALL
		SELECT N'DocumentReport_LatestProducts', N'Latest Products' UNION ALL
		SELECT N'DocumentReport_NewOrders', N'New Orders' UNION ALL
		SELECT N'DocumentReport_NewPurchaseOrders', N'New PurchaseOrders' UNION ALL
		SELECT N'DocumentReport_PendingShipments', N'Pending Shipments' UNION ALL
		SELECT N'DocumentReport_Revenue', N'Revenue' UNION ALL
		SELECT N'DocumentReport_TotalUnpaid', N'Total Unpaid' UNION ALL
		SELECT N'DocumentReport_TotalPaid', N'Total Paid' UNION ALL
		SELECT N'DropDown_Default_CustomerAddress', N'Default Customer Address' UNION ALL
		SELECT N'DropDown_TaxExclusive', N'Tax Exclusive' UNION ALL
		SELECT N'DropDown_TaxInclusive', N'Tax Inclusive' UNION ALL
		SELECT N'EmailTemplateRecurringInvoicesPopup_Title', N'Message Settings' UNION ALL
		SELECT N'EmailTemplateRecurringInvoicesPopup_PlacehorderInfo', N'You can include certain core info in your emails with easy placeholders. The placeholders available for this email are: [Amount Due], [Current Month], [Due Date], [Invoice Number], [Invoice Total], [Online Invoice Link], [Reference], [Week], [Interval], [Invoice Total Without Currency], [Amount Due Without Currency], [Auto Pay Information], [Month], [Year], [Month Year], [Week Year], [Contact Name], [Contact First Name], [Contact Last Name], [Currency Symbol], [Currency Code], [Trading Name].
<a href={0}>Learn more on placeholders and email templates<a>' UNION ALL
		SELECT N'EmailTemplateRecurringInvoicesPopup_PlacehorderInfoLink_Show', N'Show placeholder info' UNION ALL
		SELECT N'EmailTemplateRecurringInvoicesPopup_PlacehorderInfoLink_Hide', N'Hide placeholder info' UNION ALL
		SELECT N'EmailTemplateRecurringInvoices_Title', N'Repeating Invoice: Basic' UNION ALL
		SELECT N'EmailTemplateRecurringInvoices_Subject', N'Invoice [Invoice Number] from [Trading Name]' UNION ALL
		SELECT N'EmailTemplateRecurringInvoices_Body', N'Dear [Contact First Name],

Please find attached our invoice ref. [Invoice Number] for [Currency Code] [Invoice Total Without Currency].

The amount outstanding of [Currency Code] [Amount Due Without Currency] is due on [Due Date].

If you have any questions, please let us know.

Thanks,
Accounts Dept.
[Trading Name].' UNION ALL
		SELECT N'EnablePayPalCheckout', N'Enable PayPal Checkout' UNION ALL
		SELECT N'Error_ErrorDescription', N'A problem has occurred during the payment process. Please try again.<br />If this error continues, please contact support.' UNION ALL
		SELECT N'Error_ImportProcess', N'An error has occurred during the data import process' UNION ALL		
		SELECT N'Error_ExistingStore', N'Store with Name: \"{0}\" already exists.' UNION ALL
		SELECT N'Error_ErrorTitle', N'Ouch!' UNION ALL
		SELECT N'Error_GeneratingStore', N'There was an error while creating Store: \"{0}\".' UNION ALL
		SELECT N'Global_Link_Generated', N'Public link for {0} has been generated.' UNION ALL
		SELECT N'Global_Link_Invoice', N'Copy and share the invoice link through email, text, or chat. (Be sure not to post the link in a public forum.)' UNION ALL
		SELECT N'Global_Link_Message', N'Please select document to generate public link.' UNION ALL
		SELECT N'Global_Link_Removed', N'Public link for {0} has been removed.' UNION ALL
		SELECT N'HelpBlock_HoldsStock', N'Only locations that hold stock will be available for selection in Sales Orders & Stock Control.' UNION ALL
		SELECT N'HelpBlock_InitialCostPrice', N'Enter the initial cost price per unit for this item.' UNION ALL
		SELECT N'HelpBlock_InitialStockLevel', N'Enter the initial stock level for this item.' UNION ALL
		SELECT N'Inventory_Status_Fulfilled', N'Fulfilled {0:0.#####} in <a href=''{1}''>{2}</a> for {3} from {4}' UNION ALL
		SELECT N'Inventory_Status_FulfilledPlain', N'Fulfilled {0:0.#####} in {1} for {2} from {3}' UNION ALL
		SELECT N'Inventory_Status_Received', N'Received {0:0.#####} in <a href=''{1}''>{2}</a> from {3} to {4}' UNION ALL
		SELECT N'Inventory_Status_ReceivedPlain', N'Received {0:0.#####} in {1} from {2} to {3}' UNION ALL
		SELECT N'LabelCompanyInVatSystem', N'Company In Vat System' UNION ALL
		SELECT N'LabelCompanyIsConsumer',N'Company Is Consumer' UNION ALL
		SELECT N'Label_Discount', N'Discount' UNION ALL
		SELECT N'License_Changed', N'Member license info has been changed' UNION ALL
		SELECT N'Link_Activate', N'Activate' UNION ALL
		SELECT N'Link_ApproveAsOrder', N'Approve As Order' UNION ALL
		SELECT N'Link_ApproveAsQuote', N'Approve As Quote' UNION ALL
		SELECT N'Link_AddNewItem', N'+ Add new item' UNION ALL
		SELECT N'Link_ApproveAsOrder', N'Approve as Order' UNION ALL
		SELECT N'Link_CancelOrder', N'Cancel Order' UNION ALL
		SELECT N'Link_Create', N'Create {0}' UNION ALL
		SELECT N'Link_CreateNewBOM', N'Create a new BOM' UNION ALL
		SELECT N'Link_CreateNewClient', N'Create a new Client' UNION ALL
		SELECT N'Link_CreateNewContractor', N'Create a new Contractor' UNION ALL
		SELECT N'Link_CreateNewCompany', N'Create a new company' UNION ALL
		SELECT N'Link_CreateNewCustomer', N'Create a new customer' UNION ALL
		SELECT N'Link_CreateNewLead', N'Create a new lead' UNION ALL
		SELECT N'Link_CreateNewProject', N'Create a new Project' UNION ALL
		SELECT N'Link_CreateNewSupplier', N'Create a new supplier' UNION ALL
		SELECT N'Link_CreateShipment', N'Create Shipment' UNION ALL
		SELECT N'Link_Deactivate', N'Deactivate' UNION ALL
		SELECT N'Link_Document', N'Link Document' UNION ALL
		SELECT N'Link_Edit', N'Edit {0}' UNION ALL
		SELECT N'Link_EditBomNumber', N'Edit BOM number' UNION ALL
		SELECT N'Link_EditDocNumber', N'Edit document number' UNION ALL
		SELECT N'Link_EditOrderNumber', N'Edit order number' UNION ALL
		SELECT N'Link_EditRoutingNumber', N'Edit Routing number' UNION ALL
		SELECT N'Link_FinishProduction', N'Finish Production' UNION ALL
		SELECT N'Link_GenerateTransferOrder',N'Generate Transfer Order' UNION ALL
		SELECT N'Link_GenerateMprOrder', N'Generate MPR Order' UNION ALL
		SELECT N'Link_MakeInvoice', N'Make Invoice' UNION ALL
		SELECT N'Link_MarkAsReceived', N'Mark as Received' UNION ALL
		SELECT N'Link_MarkAsShipped', N'Mark as Shipped' UNION ALL
		SELECT N'Link_MakeCashSalesOrder', N'Make Cash Sales Order' UNION ALL
		SELECT N'Link_MakeShipment', N'Make Shipment' UNION ALL
		SELECT N'Link_NewSalesDoc', N'Sales Doc' UNION ALL
		SELECT N'Link_PakInvoice', N'Pak Invoice' UNION ALL
		SELECT N'Link_Pay', N'Pay' UNION ALL
		SELECT N'Link_PayWithStripe', N'Pay With Stripe' UNION ALL
		SELECT N'Link_Renewal', N'Renewal' UNION ALL
		SELECT N'Link_Share', N'Share Link' UNION ALL
		SELECT N'Linked_Documents_Invalid_Data_Message', N'Invalid Order Data.' UNION ALL
		SELECT N'Linked_Documents', N'Linked Documents' UNION ALL
		SELECT N'Linked_Documents_Linking_Error', N'There was an error while linking documents.' UNION ALL
		SELECT N'Linked_Documents_No_DocSelected_Message', N'There are no documents selected. Please select documents.' UNION ALL
		SELECT N'Message_Changed_to_Customer_Succes', N'Lead has been successfully changed to a customer' UNION ALL
		SELECT N'Message_CreditCardCharge', N'Your credit card will be charged {0}{1} every year starting from {2}' UNION ALL
		SELECT N'Message_SubscribingPlan', N'You are subscribing to the {0} for {1} agent' UNION ALL
		SELECT N'Message_Vendor_UnauthorizedAccess', N'An account with this email or username already exists. Please select another e-mail/username and try again.' UNION ALL
		SELECT N'MPR_Title', N'Generate Manufacturing Order' UNION ALL
		SELECT N'Order_EmailCreditCard', N'Send Order Confirmation Email CreditCard' UNION ALL
		SELECT N'Order_EmailWireTransfer', N'Send Order Confirmation Email WireTransfer' UNION ALL
		SELECT N'PaymentCancelled_Description', N'You have cancelled your payment.' UNION ALL
		SELECT N'PaymentCancelled_Title', N'Payment Cancelled' UNION ALL
		SELECT N'PaymentSlip_DescriptionField', N'Payment for {0} number: {1}' UNION ALL
		SELECT N'PaymentSuccess_Title', N'Payment Successful' UNION ALL
		SELECT N'Product_IsSubscriptions', N'Is Subscription' UNION ALL
		SELECT N'Product_Subscriptions', N'Product Subscriptions' UNION ALL
		SELECT N'Products_Refferalprogram', N'Refferal Program Enabled' UNION ALL
		SELECT N'Products_Measurementunit', N'Show Measurement Unit' UNION ALL
		SELECT N'Purchase_ConfirmationEmail', N'Send Purchase Confirmation Email' UNION ALL
		SELECT N'Resetting_document_numbers', N'Resetting Document Numbers at a new Fiscal Year' UNION ALL
		SELECT N'SiteMenu_BillOfMaterials', N'Bill of Materials' UNION ALL
		SELECT N'SiteMenu_CashSalesOrders',  N'Cash Sales Orders' UNION ALL
		SELECT N'SiteMenu_Clients', N'Clients' UNION ALL
		SELECT N'SiteMenu_ClientMenu', N'Client Menu' UNION ALL
		SELECT N'SiteMenu_CompanyLocations', N'Company Locations' UNION ALL
		SELECT N'SiteMenu_CompanyProductsDiscount', N'Company/Products Discount' UNION ALL
		SELECT N'SiteMenu_Contacts', N'Contacts' UNION ALL
		SELECT N'SiteMenu_Contractors', N'Contractors' UNION ALL
		SELECT N'SiteMenu_Customers', N'Customers' UNION ALL
		SELECT N'SiteMenu_Employees', N'Employees' UNION ALL
		SELECT N'SiteMenu_ExpenseOrders', N'Expense Orders' UNION ALL
		SELECT N'SiteMenu_Inventory', N'Inventory' UNION ALL
		SELECT N'SiteMenu_Invoices', N'Invoices' UNION ALL
		SELECT N'SiteMenu_InvoiceLineTypes', N'Invoice Line Types' UNION ALL
		SELECT N'SiteMenu_Labels', N'Labels' UNION ALL
		SELECT N'SiteMenu_ManufacturingOrders', N'Manufacturing Orders' UNION ALL
		SELECT N'SiteMenu_Payments', N'Payments' UNION ALL
		SELECT N'SiteMenu_Production', N'Production' UNION ALL
		SELECT N'SiteMenu_Products', N'Products' UNION ALL
		SELECT N'SiteMenu_ProductionEntryOrders', N'Production Entry Orders' UNION ALL
		SELECT N'SiteMenu_Projects', N'Projects' UNION ALL
		SELECT N'SiteMenu_ProjectContracts', N'Project Contracts' UNION ALL
		SELECT N'SiteMenu_PurchaseOrders', N'Purchase Orders' UNION ALL
		SELECT N'SiteMenu_RepresentationExpenses', N'Representation Expenses' UNION ALL
		SELECT N'SiteMenu_Quotes', N'Quotes' UNION ALL
		SELECT N'SiteMenu_RepeatingInvoices', N'Repeating Invoices' UNION ALL
		SELECT N'SiteMenu_Routings', N'Routings' UNION ALL
		SELECT N'SiteMenu_SalesOrders', N'Sales Orders' UNION ALL
		SELECT N'SiteMenu_Shipments', N'Shipments' UNION ALL
		SELECT N'SiteMenu_Stock', N'Stock' UNION ALL
		SELECT N'SiteMenu_StoreSettings', N'Store Settings' UNION ALL
		SELECT N'SiteMenu_Subscriptions', N'Subscriptions' UNION ALL
		SELECT N'SiteMenu_Suppliers', N'Suppliers' UNION ALL
		SELECT N'SiteMenu_TaxTypes', N'Tax Types' UNION ALL
		SELECT N'SiteMenu_TimeEntries', N'Time Entries' UNION ALL
		SELECT N'SiteMenu_TransferOrders', N'Transfer Orders' UNION ALL
		SELECT N'Status_MarkAs', N'Mark As {0}' UNION ALL
		SELECT N'Store_BOMNumberFormat', N'BOM-{DocNo}' UNION ALL
		SELECT N'Store_InvoiceNumberFormat', N'IN-{DocNo}' UNION ALL
		SELECT N'Store_QuoteNumberFormat', N'QT-{DocNo}' UNION ALL
		SELECT N'Store_OrderNumberFormat', N'SO-{DocNo}' UNION ALL
		SELECT N'Store_ProductionOrderNumberFormat', N'PRO-{DocNo}' UNION ALL
		SELECT N'Store_PurchaseOrderNumberFormat', N'PO-{DocNo}' UNION ALL
		SELECT N'Store_RoutingNumberFormat', N'ROU-{DocNo}' UNION ALL
		SELECT N'Store_ShipmentNumberFormat', N'SH-{DocNo}' UNION ALL
		SELECT N'Store_Slug', N'{0}-store' UNION ALL
		SELECT N'Store_Title', N'{0} Store' UNION ALL
		SELECT N'StoreSettings_Tabs_BankInformation', N'Bank Information' UNION ALL
		SELECT N'StoreSettings_Tabs_Company', N'Company Settings' UNION ALL
		SELECT N'StoreSettings_Tabs_CompanyAddress', N'Company Address' UNION ALL
		SELECT N'StoreSettings_Tabs_DocumentSettings', N'Document Settings' UNION ALL
		SELECT N'StoreSettings_Tabs_StoreSettings', N'Store Settings' UNION ALL
		SELECT N'Success_ImportFinished', N'Data import has been finished successfully.' UNION ALL	
		SELECT N'Success_StoreGenerated', N'Store: \"{0}\" successfully created.' UNION ALL
		SELECT N'Success_SuccessDescription', N'Your payment was successful! You can now continue using Store4' UNION ALL
		SELECT N'Success_SuccessTitle', N'Great!' UNION ALL
		SELECT N'SystemNotification_Message_Add', N'{0} added a new <strong>{1}</strong>.' UNION ALL
		SELECT N'SystemNotification_Message_AddContent', N'{0} added a new {1} <strong>{2}</strong>.' UNION ALL
		SELECT N'SystemNotification_Message_Comment', N'{0} commented on <strong>{1}</strong>.' UNION ALL
		SELECT N'SystemNotification_Message_Invitation', N'{0} received an invitation.' UNION ALL
		SELECT N'SystemNotification_Message_Like', N'{0} likes your post <strong>{1}</strong>.' UNION ALL
		SELECT N'SystemNotification_Message_Post', N'{0} posted a new {1} <strong>{2}</strong>.' UNION ALL
		SELECT N'SystemNotification_Message_RemoveContent', N'{0} removed following {1} <strong>{2} </strong>.' UNION ALL
		SELECT N'SystemNotification_Message_Shared', N'{0} shared a <strong>{1}</strong>''s post.' UNION ALL
		SELECT N'SystemNotification_Message_UpdateContent', N'{0} made changes on the following {1} <strong>{2}</strong>.' UNION ALL
		SELECT N'SystemNotification_Message_Upload', N'{0} uploded a new {1} <strong>{2}</strong>.' UNION ALL
		SELECT N'SystemNotification_Message_Views', N'{0} has <strong>{1}</strong> views.' UNION ALL
		SELECT N'SystemNotification_Message_ChangeStatus', N'{0} changed status to "{1}" on {2} <strong>{3}</strong>.' UNION ALL
		SELECT N'SystemNotification_Message_SendEmail', N'{0} sent Email <strong>{1}</strong>.' UNION ALL
		SELECT N'SystemNotification_Message_MakePayment', N'{0} created payment <strong>{1}</strong> for {2} <strong>{3}</strong>.' UNION ALL
		SELECT N'Title_BillingInformation', N'Contact Info' UNION ALL
		SELECT N'Title_Contact_Info', N'Contact Info' UNION ALL
		SELECT N'Title_CurrentSubscription', N'Current Subscription' UNION ALL
		SELECT N'Transfer_Order_Number', N'Transfer Order Number'
END

DECLARE currsor CURSOR FOR
	SELECT Name, Value, Description FROM @ResourcesTable

OPEN currsor
FETCH NEXT FROM currsor INTO @Name, @Value, @Description

WHILE @@FETCH_STATUS = 0 BEGIN

	BEGIN TRY

		SET @ResourceID = NULL
		SELECT TOP 1 @ResourceID = ResourceID FROM Resources WHERE LanguageID = @LanguageID AND ResourceTypeID = @ResourceTypeID AND Name = @Name
		SET @ResourceID = ISNULL(@ResourceID, 0)

		IF (@ResourceID = 0) BEGIN

			INSERT INTO Resources (ResourceTypeID, LanguageID, Name, Value, Created)
				VALUES (@ResourceTypeID, @LanguageID, @Name, @Value, GETDATE())

		END ELSE BEGIN

			UPDATE Resources SET
				Value = @Value,
				Modified = GETDATE()
			WHERE ResourceID = @ResourceID

		END

	END TRY
	BEGIN CATCH

		PRINT 'Resource item ' + @Name + ' insert failed!' + CHAR(13) + CHAR(10) + ERROR_MESSAGE()

	END CATCH

	FETCH NEXT FROM currsor INTO @Name, @Value, @Description
END

CLOSE currsor
DEALLOCATE currsor

SELECT * FROM Resources WHERE ResourceTypeID = @ResourceTypeID AND LanguageID = @LanguageID
