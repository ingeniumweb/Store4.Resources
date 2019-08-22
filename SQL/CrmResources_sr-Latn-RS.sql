/*=CONCATENATE("SELECT N'";A1;"', N'";B1;"' UNION ALL")*/
DECLARE @ResourcesTable TABLE (Name VARCHAR (128), Value NVARCHAR (MAX), [Description] NVARCHAR (MAX))

DECLARE @ResourceID INT, @ResourceTypeID INT, @LanguageID INT
DECLARE @Name VARCHAR (128), @Value NVARCHAR (MAX), @Description NVARCHAR (MAX)

SET @ResourceTypeID = NULL
SELECT TOP 1 @ResourceTypeID = ResourceTypeID FROM ResourceTypes WHERE Name = 'CrmResources'
SET @ResourceTypeID = ISNULL (@ResourceTypeID, 0)

SET @LanguageID = NULL
SELECT TOP 1 @LanguageID = LanguageID FROM Languages WHERE CultureName = 'sr-Latn-RS' --AND IsEnabled = 1
SET @LanguageID = ISNULL(@LanguageID, 0)

IF (@ResourceTypeID > 0 AND @LanguageID > 0) BEGIN
	INSERT INTO @ResourcesTable (Name, Value, [Description])
		SELECT N'Aprove_as_Customer', N'Potvrdi kao klijenta', N'Lead to Customer' UNION ALL
		SELECT N'AvatarPanel_Button_Reset', N'Poništi', N'Reset' UNION ALL
		SELECT N'AvatarPanel_Button_UploadLogo', N'Upload logotipa', N'Upload Logo' UNION ALL
		SELECT N'Button_AddToInventory', N'Dodaj u inventar', N'Add to Inventory' UNION ALL
		SELECT N'Button_SaveOrder', N'Snimi narudžbu', N'Save Order' UNION ALL
		SELECT N'Button_SaveQuote', N'Snimi ponudu', N'Save Quote' UNION ALL
		SELECT N'Category_Message_LevelForbidden', N'Zabranjeno dodavanje podkategorija na ovom nivou!', N'Can not add child category at this level!' UNION ALL
		SELECT N'Company_Message_AlredySelectedDiscunt', N'Za odabrani proizvod već postoji popust!', N'There is already a discount for the selected product!' UNION ALL
		SELECT N'ContentType_BOM', N'BOM', N'BOM' UNION ALL
		SELECT N'ContentType_Company', N'Kompanija', N'Company' UNION ALL
		SELECT N'ContentType_Customer', N'Kupac', N'Customer' UNION ALL
		SELECT N'ContentType_Document', N'Dokument', N'Document' UNION ALL
		SELECT N'ContentType_Employee', N'Zaposleni', N'Employee' UNION ALL
		SELECT N'ContentType_Location', N'Lokacija', N'Location' UNION ALL 
		SELECT N'ContentType_Product', N'Proizvod', N'Product' UNION ALL
		SELECT N'ContentType_Store', N'Prodavnica', N'Store' UNION ALL
		SELECT N'ContentType_Subscription', N'Pretplata', N'Subscription' UNION ALL
		SELECT N'ContentType_Supplier', N'Dobavljač', N'Supplier' UNION ALL
		SELECT N'ContentType_TimeEntry', N'Unos vremena', N'Time Entry' UNION ALL
		SELECT N'Data_Active', N'Aktivan', N'Active' UNION ALL
		SELECT N'Data_ActualFinish', N'Stvarni završetak', N'Actual Finish' UNION ALL
		SELECT N'Data_ActualStart', N'Stvarni početak', N'Actual Start' UNION ALL
		SELECT N'Data_Add', N'Dodati', N'Add' UNION ALL
		SELECT N'Data_Admin', N'Admin', N'Admin' UNION ALL
		SELECT N'Data_After', N'Posle', N'After' UNION ALL
		SELECT N'Data_Available', N'Dostupno', N'Available' UNION ALL
		SELECT N'Data_AssignedTo', N'Dodeljeno', N'Assigned To' UNION ALL
		SELECT N'Data_Barcode', N'Barkod', N'Barcode' UNION ALL
		SELECT N'Data_BillingShippingInfo', N'Podaci o naplati/isporuci', N'Billing/Shipping info' UNION ALL
		SELECT N'Data_BillOfMaterial', N'Popis potrebnih materijala', N'Bill of Material' UNION ALL
		SELECT N'Data_BillTo', N'Račun prema', N'Bill To' UNION ALL
		SELECT N'Data_BOM', N'Popis potrebnih materijala', N'Bill of Material' UNION ALL
		SELECT N'Data_BOMNumber', N'BOM #', N'BOM #' UNION ALL
		SELECT N'Data_Booked', N'Rezervisano', N'Booked' UNION ALL
		SELECT N'Data_BuyPrice', N'Nabavna vrednost proizvoda', N'Buy Price' UNION ALL
		SELECT N'Data_CloneDocument', N'Napravi kopiju', N'Clone Document' UNION ALL
		SELECT N'Data_Code', N'Kod', N'Code' UNION ALL
		SELECT N'Data_Committed', N'Zaduženo', N'Committed' UNION ALL
		SELECT N'Data_CompanyCode', N'Šifra', N'Company Code' UNION ALL
		SELECT N'Data_CompanyLogo', N'Logo kompanije', N'Company Logo' UNION ALL
		SELECT N'Data_CompanyName', N'Naziv kompanije', N'Company Name' UNION ALL
		SELECT N'Data_Component', N'Komponenta', N'Component' UNION ALL
		SELECT N'Data_Consumed', N'Konzumirano', N'Consumed' UNION ALL
		SELECT N'Data_CostOfMaterials', N'Troškovi materijala', N'Cost of Materials' UNION ALL
		SELECT N'Data_Currency', N'Valuta', N'Currency' UNION ALL
		SELECT N'Data_Customer', N'Kupac', N'Customer' UNION ALL
		SELECT N'Data_CustomerDetails', N'Detalji', N'Details' UNION ALL
		SELECT N'Data_CustomerInfo', N'Podaci o klijentu', N'Customer info' UNION ALL
		SELECT N'Data_Customers', N'Kupci', N'Customers' UNION ALL
		SELECT N'Data_DatePlaceProduction', N'Podaci o mestu i datumu proizvodnje', N'Date, Place Production info' UNION ALL
		SELECT N'Data_DateRange', N'Raspon datuma', N'Date Range' UNION ALL
		SELECT N'Data_Default', N'Standardna {0}', N'Default {0}' UNION ALL
		SELECT N'Data_Delete', N'Obriši', N'Delete' UNION ALL
		SELECT N'Data_Discount', N'Rabat', N'Discount' UNION ALL
		SELECT N'Data_Document', N'Dokument', N'Document' UNION ALL
		SELECT N'Data_DocumentHeader', N'Zaglavlje dokumenta', N'Document Header' UNION ALL
		SELECT N'Data_Documents', N'Dokumenti', N'Documents' UNION ALL
		SELECT N'Data_DueDate', N'Datum dolaska', N'Due Date' UNION ALL  
		SELECT N'Data_Edit', N'Izmeni', N'Edit' UNION ALL
		SELECT N'Data_EditAll', N'Izmeni sve', N'Edit All' UNION ALL
		SELECT N'Data_Email', N'Email', N'Email' UNION ALL
		SELECT N'Data_EndDate', N'Datum završetka', N'End Date' UNION ALL
		SELECT N'Data_FixedCost', N'Fiksni trošak', N'Fixed Cost' UNION ALL
		SELECT N'Data_FixedTime', N'Fiksno vreme', N'Fixed Time' UNION ALL
		SELECT N'Data_Generate', N'Generiraj', N'Generate' UNION ALL
		SELECT N'Data_HoldsStock', N'Skladište', N'Holds Stock' UNION ALL
		SELECT N'Data_Incoming', N'Dolazno', N'Incoming' UNION ALL
		SELECT N'Data_IdentityID', N'ID', N'IdentityID' UNION ALL
		SELECT N'Data_Initial', N'Početno', N'Initial' UNION ALL
		SELECT N'Data_InitialCostPrice', N'Početna cena proizvoda', N'Initial Cost Price' UNION ALL
		SELECT N'Data_InitialStockLevel', N'Početno stanje na skladištu', N'Initial Stock Level' UNION ALL
		SELECT N'Data_InvoiceDetails', N'Detalji računa', N'Invoice Details' UNION ALL
		SELECT N'Data_InvoiceNumber', N'Račun #', N'Invoice #' UNION ALL
		SELECT N'Data_IsHeadquarter', N'Označi kao sedište', N'Is Headquarter' UNION ALL
		SELECT N'Data_IsProcured', N'Nabavljeno', N'Is Procured' UNION ALL
		SELECT N'Data_IsProductPackage', N'Pakovanje proizvoda', N'Is Product Package' UNION ALL
		SELECT N'Data_IssueDate', N'Datum izdavanja', N'Issue Date' UNION ALL
		SELECT N'Data_ItemCost', N'Trošak stavke', N'Item Cost' UNION ALL
		SELECT N'Data_ItemName', N'Stavka', N'Item Name' UNION ALL
		SELECT N'Data_LabourCost', N'Trošak radne snage', N'Labour Cost' UNION ALL
		SELECT N'Data_Lead', N'Potencijalni klijent', N'Lead' UNION ALL
		SELECT N'Data_ManufacturingCost', N'Troškovi proizvodnje', N'Manufacturing Cost' UNION ALL
		SELECT N'Data_ManufacturingNumber', N'Broj Narudžbe #', N'Manufacturing Order#' UNION ALL
		SELECT N'Data_MaterialCost', N'Cena materijala', N'Material Cost' UNION ALL
		SELECT N'Data_Materials', N'Materijali', N'Materials' UNION ALL
		SELECT N'Data_Member', N'Korisnik', N'Member' UNION ALL
		SELECT N'Data_Notice', N'Napomena', N'Notice' UNION ALL
		SELECT N'Data_NotProcured', N'Nije nabavljeno', N'Not Procured' UNION ALL
		SELECT N'Data_OnHand', N'Na skladištu', N'On Hand' UNION ALL
		SELECT N'Data_Operation', N'Operacija', N'Operation' UNION ALL
		SELECT N'Data_Operations', N'Operacije', N'Operations' UNION ALL
		SELECT N'Data_OrderNumber', N'Broj narudžbe #', N'Order #' UNION ALL
		SELECT N'Data_PacketSize', N'Veličina paketa', N'Packet Size' UNION ALL
		SELECT N'Data_PacketSizeLabel', N'Naziv paketa', N'Packet Size Label' UNION ALL
		SELECT N'Data_PaidDate', N'Datum računa', N'Invoice date' UNION ALL
		SELECT N'Data_PaidOn', N'Plaćeno na', N'Paid On' UNION ALL
		SELECT N'Data_PaymentInfo', N'Podaci o plaćanju', N'Payment info' UNION ALL
		SELECT N'Data_PaymentMethod', N'Plaćeno metodom', N'Payment Method' UNION ALL
		SELECT N'Data_PeriodEnd', N'Razdoblje trajanja do', N'Peroid End' UNION ALL
		SELECT N'Data_PeriodStart', N'Razdoblje trajanja od', N'Period Start' UNION ALL
		SELECT N'Data_PreferentialPrice', N'Povlaštena cena', N'Preferential Price' UNION ALL
		SELECT N'Data_PIN', N'PIB', N'PIN' UNION ALL
		SELECT N'Data_PlannedFinish', N'Planirani završetak', N'Planned Finish' UNION ALL
		SELECT N'Data_PlannedStart', N'Planirani početak', N'Planned Start' UNION ALL
		SELECT N'Data_Price', N'Cena', N'Price' UNION ALL
		SELECT N'Data_Product', N'Proizvod', N'Product' UNION ALL
		SELECT N'Data_ProductCost', N'Cena proizvoda', N'Product Cost' UNION ALL
		SELECT N'Data_ProductDimensions', N'Dimenzije proizvoda', N'Product Dimensions' UNION ALL
		SELECT N'Data_ProductInfo', N'Podaci o proizvodu', N'Product info' UNION ALL
		SELECT N'Data_ProductionCost', N'Cena rada', N'Operation Cost' UNION ALL
		SELECT N'Data_ProductionOrderNumber', N'Broj Narudžbe #', N'Production Order #' UNION ALL
		SELECT N'Data_Products_Placeholder', N'Unesite SKU ili ime proizvoda', N'Start typing SKU or name' UNION ALL
		SELECT N'Data_ProductType', N'Vrsta proizvoda', N'Product Type' UNION ALL
		SELECT N'Data_PurchaseOrderNumber', N'Broj kupovine #', N'Purchase Order #' UNION ALL
		SELECT N'Data_Unavailable', N'Nedostupno', N'Data Unavailable' UNION ALL
		SELECT N'Data_Quantity', N'Količina', N'Quantity' UNION ALL
		SELECT N'Data_QuoteDetails', N'Detalji ponude', N'Quote Details' UNION ALL
		SELECT N'Data_QuoteNumber', N'Broj ponude #', N'Quote #' UNION ALL
		SELECT N'Data_RegistrationNumber', N'Matični broj', N'RegistrationNumber' UNION ALL
		SELECT N'Data_Reference', N'Referenca', N'Reference' UNION ALL
		SELECT N'Data_RenewalPeriod', N'Trajanje ugovora', N'Renewal Period' UNION ALL
		SELECT N'Data_RetailPrice', N'Maloprodajna cena', N'Retail Price' UNION ALL
		SELECT N'Data_Report', N'Izveštaj', N'Report' UNION ALL
		SELECT N'Data_Routing', N'Rute', N'Routing' UNION ALL
		SELECT N'Data_RoutingNumber', N'Broj rute #', N'Routing #' UNION ALL
		SELECT N'Data_RoutingNumbers', N'Broj rute #', N'Routing #' UNION ALL
		SELECT N'Data_RowNumber', N'#ID', N'#ID' UNION ALL
		SELECT N'Data_SalesOrderDetails', N'Detalji narudžbe', N'Sales Order Details' UNION ALL
		SELECT N'Data_ShipFrom', N'Dostavljeno od', N'Ship From' UNION ALL
		SELECT N'Data_ShipmentDate', N'Datum pošiljke', N'Shipment Date' UNION ALL
		SELECT N'Data_ShipmentNumber', N'Pošiljka #', N'Shipment #' UNION ALL
		SELECT N'Data_ShipTo', N'Poslati prema', N'Ship To' UNION ALL		
		SELECT N'Data_ShowOnStore', N'Prikaži u trgovini', N'Show On Store' UNION ALL
		SELECT N'Data_ShowShipping', N'Prikaži trošak dostave', N'Show Shippment Costs' UNION ALL
		SELECT N'Data_SIC', N'SIC', N'SIC' UNION ALL
		SELECT N'Data_Sku', N'Sku', N'Sku' UNION ALL
		SELECT N'Data_StartDate', N'Početni datum', N'Start Date' UNION ALL
		SELECT N'Data_Status', N'Status', N'Status' UNION ALL
		SELECT N'Data_StockDue', N'Dostaviti u skladištu do', N'Stock Due' UNION ALL
		SELECT N'Data_StockItem', N'Proizvod u skladištu', N'Stock Item' UNION ALL
		SELECT N'Data_StoreName', N'Ime prodavnice', N'Store Name' UNION ALL
		SELECT N'Data_StreetAddress', N'Adresa ulice', N'Street Address' UNION ALL
		SELECT N'Data_SubscriptionEndDate', N'Datum isteka pretplate', N'Subscription End Date' UNION ALL
		SELECT N'Data_SubscriptionNumber', N'Pretplata #', N'Subscription #' UNION ALL
		SELECT N'Data_SubscriptionStartDate', N'Početak pretplate', N'Subscription Start Date' UNION ALL
		SELECT N'Data_Subtotal', N'Suma stavki', N'Subtotal' UNION ALL
		SELECT N'Data_Supplier', N'Dobavljač', N'Supplier' UNION ALL
		SELECT N'Data_SupplierInfo', N'Podaci o dobavljaču', N'Supplier info' UNION ALL
		SELECT N'Data_TargetLot', N'Ciljana količina', N'Target Lot' UNION ALL
		SELECT N'Data_Task', N'Zadatak', N'Task' UNION ALL
		SELECT N'Data_Tax', N'Porez', N'Tax' UNION ALL
		SELECT N'Data_Tax', N'Porez', N'Tax' UNION ALL
		SELECT N'Data_TaxBase', N'Osnovica za porez', N'Data_TaxBase' UNION ALL
		SELECT N'Data_TaxIncluded', N'Uključen porez', N'Tax Included' UNION ALL
		SELECT N'Data_TaxNumber', N'Poreski/VAT Broj', N'Tax Number' UNION ALL
		SELECT N'Data_TaxRate', N'Poreska stopa', N'Tax Rate' UNION ALL
		SELECT N'Data_TaxType', N'Poreska grupa', N'Tax Type' UNION ALL
		SELECT N'Data_TimeZone', N'Vremenska zona', N'Time Zone' UNION ALL
		SELECT N'Data_Total', N'Ukupno', N'Total' UNION ALL
		SELECT N'Data_TotalCost', N'Ukupna cena', N'Total Cost' UNION ALL
		SELECT N'Data_TotalDiscount', N'Iznos Rabata', N'Total Discount' UNION ALL
		SELECT N'Data_TotalsAre', N'Oporezivost stavki', N'TotalsAre' UNION ALL
		SELECT N'Data_TotalTime', N'Ukupno vreme', N'Total Time' UNION ALL
		SELECT N'Data_TotalUnits', N'Ukupno stavki', N'Total Units' UNION ALL
		SELECT N'Data_TransferOrderDetails', N'Detalji prenosne dostavnice', N'Transfer Order Details' UNION ALL
		SELECT N'Data_UnitOfMeasurement', N'Jedinica mere', N'Unit of Measurement' UNION ALL
		SELECT N'Data_VariableCost', N'Promenjiva cena', N'Variable Cost' UNION ALL
		SELECT N'Data_VariableTime', N'Promenjivi datum', N'Variable Time' UNION ALL
		SELECT N'Data_VATRegNo', N'PDV broj', N'VAT Reg No' UNION ALL
		SELECT N'Data_View', N'Pogledaj', N'View' UNION ALL
		SELECT N'Data_ViewAll', N'Pogledaj sve', N'View All' UNION ALL
		SELECT N'Data_Warehouse', N'Skladište', N'Warehouse' UNION ALL
		SELECT N'Data_WarehouseEntrance', N'Ulaz u skladište', N'Warehouse Entrance' UNION ALL
		SELECT N'Data_WholesalePrice', N'Veleprodajna cena', N'Wholesale Price' UNION ALL
		SELECT N'Data_WorkCenterType', N'Tip radnog centra', N'Work Center Type' UNION ALL
		SELECT N'Date_StoreUrl', N'URL prodavnice', N'Store Url' UNION ALL
		SELECT N'Datra_History', N'Istorija', N'History' UNION ALL
		SELECT N'DateFilter_LastMonth', N'Prošli mesec', N'Last Month' UNION ALL
		SELECT N'DateFilter_LastWeek', N'Prošle nedelje', N'Last Week' UNION ALL
		SELECT N'DateFilter_LastYear', N'Prošla godina', N'Last Year' UNION ALL
		SELECT N'DateFilter_ThisMonth', N'Ovaj mesec', N'This Month' UNION ALL
		SELECT N'DateFilter_ThisWeek', N'Ove nedelje', N'This Week' UNION ALL
		SELECT N'DateFilter_ThisYear', N'Ova godina', N'This Year' UNION ALL
		SELECT N'DateFilter_NextYear', N'Od danas > ∞', N'Next Years' UNION ALL
		SELECT N'DateFilter_Today', N'Danas', N'Today' UNION ALL
		SELECT N'DateFilter_Yesterday', N'Juče', N'Yesterday' UNION ALL
		SELECT N'Document_CashSalesOrder', N'Prodaja za gotovinu', N'Cash Sales Order' UNION ALL
		SELECT N'DocumentType_Contract', N'Ugovor', N'Contracts' UNION ALL
		SELECT N'Document_ExpenseOrder', N'Rashod', N'Expense Order' UNION ALL
		SELECT N'Document_Message_NotEnoughStock', N'Nema dovoljno zaliha u magacinu!', N'There is not enough stock on the warehouse!' UNION ALL
		SELECT N'Document_Message_SelectWarehouse', N'Molim vas da odaberete svoj magacin!', N'Please select your warehouse!' UNION ALL
		SELECT N'Document_Message_UnlinkedDocuments', N'Dokumenti više nisu vezani', N'Documents successfully unlinked' UNION ALL
		SELECT N'Document_ProductionEntryOrder', N'Ulaz iz Proizvodnje', N'Production Entry Order' UNION ALL
		SELECT N'Document_RepresentationExpense', N'Reprezentacija', N'Representation Expense' UNION ALL
		SELECT N'Document_Route', N'Ruta', N'Route' UNION ALL
		SELECT N'Documents_CashSalesOrders', N'Prodaja za gotovinu', N'Cash Sales Orders' UNION ALL
		SELECT N'Documents_ExpenseOrders', N'Rashodi', N'Expense Orders' UNION ALL
		SELECT N'DocumentType_ForDelivery', N'Za Isporuku', N'ForDelivery' UNION ALL
		SELECT N'Documents_Invoices', N'Računi', N'Invoices' UNION ALL
		SELECT N'Documents_Orders', N'Narudžbe', N'Sales Orders' UNION ALL
		SELECT N'Documents_Procurement', N'Nabavke', N'Procurements' UNION ALL
		SELECT N'Documents_ProductionOrders', N'Radni nalozi', N'Production Orders' UNION ALL
		SELECT N'Documents_ProductionEntryOrders', N'Ulazi iz Proizvodnje', N'Production Entry Orders' UNION ALL
		SELECT N'Documents_PurchaseOrders', N'Kupovine', N'Purchase Orders' UNION ALL
		SELECT N'Documents_Quotes', N'Ponude', N'Quotes' UNION ALL
		SELECT N'Documents_RepresentationExpenses', N'Reprezentacije', N'Representation Expenses' UNION ALL
		SELECT N'Documents_Shipments', N'Pošiljke', N'Shipments' UNION ALL
		SELECT N'Documents_Subscriptions', N'Pretplate', N'Subscriptions' UNION ALL
		SELECT N'Documents_TransferOrders', N'Prenosna dostavnica', N'Transfer Orders' UNION ALL
		SELECT N'DocumentType_BOM', N'Potrošni materijal', N'Bill of Material' UNION ALL
		SELECT N'DocumentType_CashSalesOrder', N'Prodaja za gotovinu', N'Cash Sales Order' UNION ALL
		SELECT N'DocumentType_Deal', N'Deal', N'Deal' UNION ALL
		SELECT N'DocumentType_Deals', N'Deals', N'Deals' UNION ALL
		SELECT N'DocumentType_ExpenseOrder', N'Rashodi', N'Expense Order' UNION ALL
		SELECT N'DocumentType_Invoice', N'Račun', N'Invoice' UNION ALL
		SELECT N'DocumentType_ManufacturingOrder', N'Proizvodna narudžba', N'Manufacturing Order' UNION ALL
		SELECT N'DocumentType_Order', N'Narudžba', N'Order' UNION ALL
		SELECT N'DocumentType_Payment', N'Plaćanje', N'Payment' UNION ALL
		SELECT N'DocumentType_ProductionEntryOrder', N'Ulazi iz Proizvodnje', N'Production Entry Order' UNION ALL
		SELECT N'DocumentType_ProductionOrder', N'Proizvodna narudžba', N'Production Order' UNION ALL
		SELECT N'DocumentType_PurchaseOrder', N'Kupovina', N'Purchase Order' UNION ALL
		SELECT N'DocumentType_Quote', N'Ponuda', N'Quote' UNION ALL
		SELECT N'DocumentType_RepresentationExpense', N'Reprezentacije', N'Representation Expense' UNION ALL
		SELECT N'DocumentType_SalesOrder', N'Narudžba', N'Sales Order' UNION ALL
		SELECT N'DocumentType_Shipment', N'Pošiljka', N'Shipment' UNION ALL
		SELECT N'DocumentType_Subscription', N'Pretplata', N'Subscription' UNION ALL
		SELECT N'DocumentType_TransferOrder', N'Prenosne Dostavnice', N'Transfer Order' UNION ALL
		SELECT N'DocumentReport_LatestDocuments', N'Najnoviji dokumenti', N'Latest Documents' UNION ALL
		SELECT N'DocumentReport_LatestCustomers', N'Najnoviji klijenti', N'Latest Customers' UNION ALL
		SELECT N'DocumentReport_LatestProducts', N'Najnoviji proizvodi', N'Latest Products' UNION ALL
		SELECT N'DocumentReport_NewOrders', N'Ponude', N'Orders and Quotes' UNION ALL
		SELECT N'DocumentReport_PendingShipments', N'Nove pošiljke', N'Pending Shipments' UNION ALL
		SELECT N'DocumentReport_Revenue', N'Prihod', N'Revenue' UNION ALL
		SELECT N'DocumentReport_TotalUnpaid', N'Ukupno neplaćeno', N'Total Unpaid' UNION ALL
		SELECT N'DocumentReport_TotalPaid', N'Ukupno plaćeno', N'Total Paid' UNION ALL
		SELECT N'DropDown_Default_CustomerAddress', N'Standardna adresa klijenta', N'Default Customer Address' UNION ALL
		SELECT N'DropDown_TaxExclusive', N'Porez isključen', N'Tax Exclusive' UNION ALL
		SELECT N'DropDown_TaxInclusive', N'Porez uključen', N'Tax Inclusive' UNION ALL
		SELECT N'Error_ImportProcess', N'Došlo je do greške tokom procesa uvoza podataka', N'An error has occurred during the data import process' UNION ALL
		SELECT N'Error_ExistingStore', N'Prodavnica s imenom: \"{0}\" već postoji.', N'Store with Name: \"{0}\" already exists.' UNION ALL
		SELECT N'Error_GeneratingStore', N'Došlo je do greške prilikom kreiranja prodavnice : \"{0}".', N'There was an error while creating Store: \"{0}\".' UNION ALL
		SELECT N'HelpBlock_HoldsStock', N'Samo lokacije koje drže zalihe će biti na raspolaganju za izbor u prodaji narudžbe i nadzor zaliha.', N'Only locations that hold stock will be available for selection in Sales Orders & Stock Control.' UNION ALL
		SELECT N'HelpBlock_InitialCostPrice', N'Unesite početnu cijenu po jedinici za ovu stavku.', N'Enter the initial cost price per unit for this item.' UNION ALL
		SELECT N'HelpBlock_InitialStockLevel', N'Unesite početnu količinu zalihe za ovu stavku.', N'Enter the initial stock level for this item.' UNION ALL
		SELECT N'Inventory_Status_Fulfilled', N'Poslano {0:0.#####} komada robe sa magacina <strong>{4}</strong> na magacin <strong>{3}</strong> <a href=''{1}''>{2}</a>', N'Fulfilled {0} in <a href=''{1}''>{2}</a> for {3} from {4}' UNION ALL
		SELECT N'Inventory_Status_FulfilledPlain', N'Poslano {0:0.#####} komada robe sa magacina {3} na magacin {2} - {1}', N'Fulfilled {0} in {1} for {2} from {3}' UNION ALL
		SELECT N'Inventory_Status_Received', N'Primljeno {0:0.#####} komada robe na skladište <strong>{4}</strong> sa skladišta <strong>{3}</strong> - <a href=''{1}''>{2}</a>', N'Received {0} in <a href=''{1}''>{2}</a> from {3} to {4}' UNION ALL
		SELECT N'Inventory_Status_ReceivedPlain', N'Primljeno {0:0.#####} komada robe na skladište {3} sa skladišta {2} - {1}', N'Received {0} in {1} from {2} to {3}' UNION ALL
		SELECT N'LabelCompanyInVatSystem', N'Klijent u sistemu PDV-a', N'Company In Vat System' UNION ALL
		SELECT N'LabelCompanyIsConsumer', N'Fizičko lice', N'Company Is Consumer' UNION ALL
		SELECT N'Label_Discount', N'Rabat', N'Discount' UNION ALL
		SELECT N'License_Changed', N'Korisnikova licenca je promijenjena', N'Member license info has been changed' UNION ALL
		SELECT N'Link_Activate', N'Aktiviraj', N'Activate' UNION ALL
		SELECT N'Link_ApproveAsOrder', N'Odobri kao narudžbenicu', N'Approve As Order' UNION ALL
		SELECT N'Link_ApproveAsQuote', N'Odobri kao ponudu', N'Approve As Quote' UNION ALL
		SELECT N'Link_AddNewItem', N'+ Dodaj novu stavku', N'+ Add new item' UNION ALL
		SELECT N'Link_ApproveAsOrder', N'Odobri kao narudžbu', N'Approve as Order' UNION ALL
		SELECT N'Link_CancelOrder', N'Otkaži narudžbu', N'Cancel Order' UNION ALL
		SELECT N'Link_Create', N'Kreiraj {0}', N'Create {0}' UNION ALL
		SELECT N'Link_CreateNewBOM', N'Stvori novi BOM', N'Create a new BOM' UNION ALL
		SELECT N'Link_CreateNewCustomer', N'Kreiraj novog kupca', N'Create a new customer' UNION ALL
		SELECT N'Link_CreateNewLead', N'Kreiraj novog Potencijalnog klijenta', N'Create a new lead' UNION ALL
		SELECT N'Link_CreateNewSupplier', N'Kreiraj novog dobavljača', N'Create a new supplier' UNION ALL
		SELECT N'Link_CreateShipment', N'Kreiraj pošiljku', N'Create Shipment' UNION ALL
		SELECT N'Link_Deactivate', N'Deaktiviraj', N'Deactivate' UNION ALL
		SELECT N'Link_Edit', N'Uredi {0}', N'Edit {0}' UNION ALL
		SELECT N'Link_EditBomNumber', N'Uredi BOM broj', N'Edit BOM number' UNION ALL
		SELECT N'Link_EditDocNumber', N'Uredi broj dokumenta', N'Edit document number' UNION ALL
		SELECT N'Link_EditOrderNumber', N'Uredi broj narudžbe', N'Edit order number' UNION ALL
		SELECT N'Link_EditRoutingNumber', N'Uredi broj dostave', N'Edit Routing number' UNION ALL
		SELECT N'Link_FinishProduction', N'Završi proizvodnju', N'Finish Production' UNION ALL
		SELECT N'Link_GenerateTransferOrder', N'Nova prenosna dostavnica', N'Generate Transfer Order' UNION ALL
		SELECT N'Link_GenerateMprOrder', N'Kreiraj proizvodni nalog', N'Generate MPR Order' UNION ALL
		SELECT N'Link_MakeInvoice', N'Napravi račun', N'Make Invoice' UNION ALL
		SELECT N'Link_MarkAsReceived', N'Označi kao primljeno', N'Mark as Received' UNION ALL
		SELECT N'Link_MarkAsShipped', N'Označi kao poslato', N'Mark as Shipped' UNION ALL
		SELECT N'Link_MakeCashSalesOrder',N'Napravi prodaja za gotovinu', N'MakeCashSalesOrder' UNION ALL
		SELECT N'Link_MakeShipment',N'Napravi otpremnicu', N'MakeShipment' UNION ALL
		SELECT N'Link_NewSalesDoc', N'prodajni dokument', N'Sales Doc' UNION ALL
		SELECT N'Link_PakInvoice', N'Napravi račun', N'Pak Invoice' UNION ALL
		SELECT N'Link_Pay', N'Plati', N'Pay' UNION ALL
		SELECT N'Link_PayWithStripe', N'Plati Stripe-om', N'Pay With Stripe' UNION ALL
		SELECT N'Link_Renewal', N'Obnovi', N'Renewal' UNION ALL
		SELECT N'Message_Changed_to_Customer_Succes', N'Lead has been successfully changed to a customer', N'Lead has been successfully changed to a customer' UNION ALL
		SELECT N'Message_Vendor_UnauthorizedAccess', N'Račun sa ovim e-mailom ili korisničkim imenom već postoji. Molimo vas odaberite drugi e-mail/korisničko ime i pokušajte ponovno.', N'An account with this email or username already exists. Please select another e-mail/username and try again.' UNION ALL
		SELECT N'MPR_Title', N'Kreiraj proizvodni nalog', N'Generate Manufacturing Order' UNION ALL
		SELECT N'Order_EmailCreditCard', N'Email-info narudžbenica - plaćeno karticom', N'Send Order Confirmation Email CreditCard' UNION ALL
		SELECT N'Order_EmailWireTransfer', N'Email-info narudžbenica - plaćeno virmanski', N'Send Order Confirmation Email WireTransfer' UNION ALL
		SELECT N'Products_Refferalprogram', N'Referal program', N'Refferal Program Enabled' UNION ALL
		SELECT N'Products_Measurementunit', N'Prikaži mjernu jedinica', N'Show Measurement Unit' UNION ALL
		SELECT N'Purchase_ConfirmationEmail', N'Email-info potvrda kupovine', N'Send Purchase Confirmation Email' UNION ALL
		SELECT N'Resetting_document_numbers', N'Resetiraj brojeve dokumenata za novu fiskalnu godinu', N'Resetting Document Numbers at a new Fiscal Year' UNION ALL
		SELECT N'SiteMenu_BillOfMaterials', N'Popis potrebnih materijala', N'Bill of Materials' UNION ALL
		SELECT N'SiteMenu_CashSalesOrders', N'Prodaja za gotovinu', N'Cash Sales Orders' UNION ALL
		SELECT N'SiteMenu_CompanyLocations', N'Sedišta/lokacije kompanije', N'Company Locations' UNION ALL
		SELECT N'SiteMenu_CompanyProductsDiscount', N'Rabat za proizvode', N'Company/Products Discount' UNION ALL
		SELECT N'SiteMenu_Contacts', N'Kontakti', N'Contacts' UNION ALL
		SELECT N'SiteMenu_Customers', N'Klijenti', N'Customers' UNION ALL
		SELECT N'SiteMenu_Employees', N'Zaposleni', N'Employees' UNION ALL
		SELECT N'SiteMenu_ExpenseOrders', N'Rashodi', N'Expense Orders' UNION ALL
		SELECT N'SiteMenu_Inventory', N'Inventar', N'Inventory' UNION ALL
		SELECT N'SiteMenu_Invoices', N'Računi', N'Invoices' UNION ALL
		SELECT N'SiteMenu_Labels', N'Oznake', N'Labels' UNION ALL
		SELECT N'SiteMenu_ManufacturingOrders', N'Proizvodni nalozi', N'Manufacturing Orders' UNION ALL
		SELECT N'SiteMenu_Payments', N'Plaćanja', N'Payments' UNION ALL
		SELECT N'SiteMenu_Production', N'Proizvodnja', N'Production' UNION ALL
		SELECT N'SiteMenu_Products', N'Proizvodi', N'Products' UNION ALL
		SELECT N'SiteMenu_ProductionEntryOrders', N'Ulazi iz Proizvodnje', N'Production Entry Orders' UNION ALL
		SELECT N'SiteMenu_PurchaseOrders', N'Kupovine', N'Purchase Orders' UNION ALL
		SELECT N'SiteMenu_RepresentationExpenses', N'Reprezentacije', N'Representation Expenses' UNION ALL
		SELECT N'SiteMenu_Quotes', N'Ponude', N'Quotes' UNION ALL
		SELECT N'SiteMenu_Routings', N'Rute', N'Routings' UNION ALL
		SELECT N'SiteMenu_SalesOrders', N'Prodajni nalozi', N'Sales Orders' UNION ALL
		SELECT N'SiteMenu_Shipments', N'Pošiljke', N'Shipments' UNION ALL
		SELECT N'SiteMenu_Stock', N'Zaliha', N'Stock' UNION ALL
		SELECT N'SiteMenu_StoreSettings', N'Postavke prodavnice', N'Store Settings' UNION ALL
		SELECT N'SiteMenu_Subscriptions', N'Pretplate', N'Subscriptions' UNION ALL
		SELECT N'SiteMenu_Suppliers', N'Dobavljači', N'Suppliers' UNION ALL
		SELECT N'SiteMenu_TaxTypes', N'Poreske grupe', N'Tax Types' UNION ALL
		SELECT N'SiteMenu_TimeEntries', N'Vremenski unosi', N'Time Entries' UNION ALL
		SELECT N'SiteMenu_TransferOrders', N'Prenosne dostavnice', N'Transfer Orders' UNION ALL
		SELECT N'Status_MarkAs', N'Označi kao {0}', N'Mark As {0}' UNION ALL
		SELECT N'Store_BOMNumberFormat', N'BOM-{DocNo}', N'BOM-{DocNo}' UNION ALL
		SELECT N'Store_InvoiceNumberFormat', N'IN-{DocNo}', N'IN-{DocNo}' UNION ALL
		SELECT N'Store_QuoteNumberFormat', N'QT-{DocNo}', N'QT-{DocNo}' UNION ALL
		SELECT N'Store_OrderNumberFormat', N'SO-{DocNo}', N'SO-{DocNo}' UNION ALL
		SELECT N'Store_ProductionOrderNumberFormat', N'PRO-{DocNo}', N'PRO-{DocNo}' UNION ALL
		SELECT N'Store_PurchaseOrderNumberFormat', N'PO-{DocNo}', N'PO-{DocNo}' UNION ALL
		SELECT N'Store_RoutingNumberFormat', N'ROU-{DocNo}', N'ROU-{DocNo}' UNION ALL
		SELECT N'Store_ShipmentNumberFormat', N'SH-{DocNo}', N'SH-{DocNo}' UNION ALL
		SELECT N'Store_Slug', N'{0}-store', N'{0}-store' UNION ALL
		SELECT N'Store_Title', N'{0} prodavnica', N'{0} Store' UNION ALL
		SELECT N'StoreSettings_Tabs_Company', N'Postavke kompanije', N'Company Settings' UNION ALL
		SELECT N'StoreSettings_Tabs_CompanyAddress', N'Adresa kompanije', N'Company Address' UNION ALL
		SELECT N'StoreSettings_Tabs_DocumentSettings', N'Postavke dokumenta', N'Document Settings' UNION ALL
		SELECT N'StoreSettings_Tabs_StoreSettings', N'Postavke prodavnice', N'Store Settings' UNION ALL
		SELECT N'Success_ImportFinished', N'Uvoz podataka je uspešno završen.', N'Data import has been finished successfully.' UNION ALL
		SELECT N'Success_StoreGenerated', N'Prodavnica: \"{0}\" je uspešno kreirana.', N'Store: \"{0}\" successfully created.' UNION ALL
		SELECT N'SystemNotification_Message_Add', N'{0} dodao novi <strong>{1}</strong>.', N'{0} added a new <strong>{1}</strong>.' UNION ALL
		SELECT N'SystemNotification_Message_AddContent', N'{0} dodao novi {1} <strong>{2}</strong>.', N'{0} added a new {1} <strong>{2}</strong>.' UNION ALL
		SELECT N'SystemNotification_Message_Comment', N'{0} komentarisao na <strong>{1}</strong>.', N'{0} commented on <strong>{1}</strong>.' UNION ALL
		SELECT N'SystemNotification_Message_Invitation', N'{0} primio pozivnicu.', N'{0} received an invitation.' UNION ALL
		SELECT N'SystemNotification_Message_Like', N'{0} se sviđa vaša objava <strong>{1}</strong>.', N'{0} likes your post <strong>{1}</strong>.' UNION ALL
		SELECT N'SystemNotification_Message_Post', N'{0} je objavio novu {1} <strong>{2}</strong>.', N'{0} posted a new {1} <strong>{2}</strong>.' UNION ALL
		SELECT N'SystemNotification_Message_RemoveContent', N'{0} uklonio sledeće {1} <strong>{2} </strong>.', N'{0} removed following {1} <strong>{2} </strong>.' UNION ALL
		SELECT N'SystemNotification_Message_Shared', N'{0} podelio <strong>{1}</strong>''s post.', N'{0} shared a <strong>{1}</strong>''s post.' UNION ALL
		SELECT N'SystemNotification_Message_UpdateContent', N'{0} učinio sledeće promene {1} <strong>{2}</strong>.', N'{0} made changes on the following {1} <strong>{2}</strong>.' UNION ALL
		SELECT N'SystemNotification_Message_Upload', N'{0} upload-ovao novi {1} <strong>{2}</strong>.', N'{0} uploded a new {1} <strong>{2}</strong>.' UNION ALL
		SELECT N'SystemNotification_Message_Views', N'{0} ima <strong>{1}</strong> pogleda.', N'{0} has <strong>{1}</strong> views.' UNION ALL
		SELECT N'SystemNotification_Message_ChangeStatus', N'{0} je promenio status "{1}" na {2} <strong>{3}</strong>.', N'{0} changed status to "{1}" on {2} <strong>{3}</strong>.' UNION ALL
		SELECT N'SystemNotification_Message_SendEmail', N'{0} poslao E-mail <strong>{1}</strong>.', N'{0} sent Email <strong>{1}</strong>.' UNION ALL
		SELECT N'SystemNotification_Message_MakePayment', N'{0} je dodao uplatu <strong>{1}</strong> za {2} <strong>{3}</strong>.' , N'{0} created payment <strong>{1}</strong> for {2} <strong>{3}</strong>.' UNION ALL
		SELECT N'Transfer_Order_Number', N'Broj Međuskladišnice', N'Transfer Order Number'
END

DECLARE currsor CURSOR FOR
	SELECT Name, Value, [Description] FROM @ResourcesTable

OPEN currsor
FETCH NEXT FROM currsor INTO @Name, @Value, @Description

WHILE @@FETCH_STATUS = 0 BEGIN

	BEGIN TRY

		SET @ResourceID = NULL
		SELECT TOP 1 @ResourceID = ResourceID FROM Resources WHERE LanguageID = @LanguageID AND ResourceTypeID = @ResourceTypeID AND Name = @Name
		SET @ResourceID = ISNULL(@ResourceID, 0)

		IF (@ResourceID = 0) BEGIN

			INSERT INTO Resources (ResourceTypeID, LanguageID, Name, Value, [Description], Created)
				VALUES (@ResourceTypeID, @LanguageID, @Name, @Value, @Description, GETDATE())

		END ELSE BEGIN

			UPDATE Resources SET
				Value = @Value,
				[Description] = @Description,
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