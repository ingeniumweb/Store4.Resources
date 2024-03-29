/*=CONCATENATE("SELECT N'";A1;"', N'";B1;"' UNION ALL")*/
DECLARE @ResourcesTable TABLE (Name VARCHAR (128), Value NVARCHAR (MAX), [Description] NVARCHAR (MAX))

DECLARE @ResourceID INT, @ResourceTypeID INT, @LanguageID INT
DECLARE @Name VARCHAR (128), @Value NVARCHAR (MAX), @Description NVARCHAR (MAX)

SET @ResourceTypeID = NULL
SELECT TOP 1 @ResourceTypeID = ResourceTypeID FROM ResourceTypes WHERE Name = 'MenuResources'
SET @ResourceTypeID = ISNULL (@ResourceTypeID, 0)

SET @LanguageID = NULL
SELECT TOP 1 @LanguageID = LanguageID FROM Languages WHERE CultureName = 'hr-HR' --AND IsEnabled = 1
SET @LanguageID = ISNULL(@LanguageID, 0)

IF (@ResourceTypeID > 0 AND @LanguageID > 0) BEGIN
	INSERT INTO @ResourcesTable (Name, Value, [Description])
		SELECT N'SiteMenu_AccountSettings', N'Korisničke postavke', N'Account Settings' UNION ALL
		SELECT N'SiteMenu_Ads', N'Oglasi/Baneri', N'Ads/Banners' UNION ALL
		SELECT N'SiteMenu_Applications', N'Aplikacije', N'Applications' UNION ALL
		SELECT N'SiteMenu_Apps', N'Apps', N'Apps' UNION ALL
		SELECT N'SiteMenu_Articles', N'Članci', N'Articles' UNION ALL
		SELECT N'SiteMenu_Audit', N'Logovi', N'Audit' UNION ALL
		SELECT N'SiteMenu_BillOfMaterials', N'Popis potrebnih materijala', N'Bill of Materials' UNION ALL
		SELECT N'SiteMenu_Billings', N'Pretplate', N'Billings' UNION ALL
		SELECT N'SiteMenu_Blog', N'Blog', N'Blog' UNION ALL
		SELECT N'SiteMenu_BlogPost', N'Blog post', N'Blog Post' UNION ALL
		SELECT N'SiteMenu_BlogPosts', N'Blog postovi', N'Blog Posts' UNION ALL
		SELECT N'SiteMenu_Campaigns', N'Kampanje', N'Campaigns' UNION ALL
		SELECT N'SiteMenu_CashSalesOrders', N'Prodaja za gotovinu', N'CashSalesOrders' UNION ALL
		SELECT N'SiteMenu_Categories', N'Kategorije', N'Categories' UNION ALL
		SELECT N'SiteMenu_Cities', N'Gradovi', N'Cities' UNION ALL
		SELECT N'SiteMenu_ClientMenu', N'Korisnik', N'Client Menu' UNION ALL
		SELECT N'SiteMenu_Comments', N'Komentari', N'Comments' UNION ALL
		SELECT N'SiteMenu_Companies', N'Tvrtke', N'Companies' UNION ALL
		SELECT N'SiteMenu_CompanyLocations', N'Sjedišta/lokacije tvrtke', N'Company Locations' UNION ALL
		SELECT N'SiteMenu_Connections', N'Konekcije', N'Connections' UNION ALL
		SELECT N'SiteMenu_Contact', N'Kontakt', N'Contact' UNION ALL
		SELECT N'SiteMenu_Contacts', N'Kontakti', N'Contacts' UNION ALL
		SELECT N'SiteMenu_Content', N'Sadržaj', N'Content' UNION ALL
		SELECT N'SiteMenu_Contents', N'Sadržaji', N'Contents' UNION ALL
		SELECT N'SiteMenu_Contracts', N'Ugovori', N'Contracts' UNION ALL
		SELECT N'SiteMenu_Contractors', N'Izvođači radova', N'Contractors' UNION ALL
		SELECT N'SiteMenu_Countries', N'Države', N'Countries' UNION ALL
		SELECT N'SiteMenu_Contracts_Title', N'Ugovori', N'Contracts' UNION ALL
		SELECT N'SiteMenu_CountyStateProvinces', N'Županije', N'County/State/Provinces' UNION ALL
		SELECT N'SiteMenu_CRM', N'CRM', N'CRM' UNION ALL
		SELECT N'SiteMenu_Clients', N'Klijenti', N'Clients' UNION ALL
		SELECT N'SiteMenu_Customers', N'Klijenti', N'Customers' UNION ALL
		SELECT N'SiteMenu_Dashboard', N'Upravljačka ploča', N'Dashboard' UNION ALL
		SELECT N'SiteMenu_Deliverables', N'Isporuke', N'Deliverables' UNION ALL
		SELECT N'SiteMenu_DepositInvoices', N'Računi za Predujam', N'Deposit Invoices' UNION ALL
		SELECT N'SiteMenu_Description_Lists', N'Uređivanje listi (FAQs)', N'Lists Editor (FAQs)' UNION ALL
		SELECT N'SiteMenu_Description_Settings', N'Generalne Postavke', N'Global Settings' UNION ALL
		SELECT N'SiteMenu_Description_Support', N'Pomoć & korisnička podrška', N'Help & Support' UNION ALL
		SELECT N'SiteMenu_Devices', N'Uređaji', N'Devices' UNION ALL
		SELECT N'SiteMenu_Distributors', N'Distributeri', N'Distributors' UNION ALL
		SELECT N'SiteMenu_Deals_Title', N'Potencijalne Ponude', N'Deals' UNION ALL
		SELECT N'SiteMenu_Domains', N'Domene', N'Domains' UNION ALL
		SELECT N'SiteMenu_Durations', N'Vremenski period', N'Durations' UNION ALL
		SELECT N'SiteMenu_EmailCampaigns', N'Email kampanje', N'Email Campaigns' UNION ALL
		SELECT N'SiteMenu_Employees', N'Zaposlenici', N'Employees' UNION ALL
		SELECT N'SiteMenu_Events', N'Događaji', N'Events' UNION ALL
		SELECT N'SiteMenu_Expenses', N'Troškovi', N'Expenses' UNION ALL
		SELECT N'SiteMenu_ExpenseOrders', N'Rashodi', N'Expense Orders' UNION ALL
		SELECT N'SiteMenu_Fields', N'Polja', N'Fields' UNION ALL
		SELECT N'SiteMenu_FilesManager', N'Upravljanje datotekama', N'Files Manager' UNION ALL
		SELECT N'SiteMenu_FormBuilder', N'Graditelj forme', N'Form Builder' UNION ALL
		SELECT N'SiteMenu_FormFieldSettings', N'Postavke polja', N'Field Settings' UNION ALL
		SELECT N'SiteMenu_FormLookups', N'Šifrarnici', N'Lookups' UNION ALL
		SELECT N'SiteMenu_FormSettings', N'Postavke formi', N'Form Settings' UNION ALL
		SELECT N'SiteMenu_Forms', N'Forme', N'Forms' UNION ALL
		SELECT N'SiteMenu_Galleries', N'Galerije', N'Galleries' UNION ALL
		SELECT N'SiteMenu_Home', N'Naslovna', N'Home' UNION ALL
		SELECT N'SiteMenu_HtmlTemplates', N'Html predlošci', N'Html Templates' UNION ALL
		SELECT N'SiteMenu_Inbox', N'Inbox', N'Inbox' UNION ALL
		SELECT N'SiteMenu_Industries', N'Industije', N'Industries' UNION ALL
		SELECT N'SiteMenu_Inventory', N'Inventar', N'Inventory' UNION ALL
		SELECT N'SiteMenu_Invoices', N'Računi', N'Invoices' UNION ALL
		SELECT N'SiteMenu_InvoiceLineTypes', N'Vrste računa', N'Invoice Line Types' UNION ALL
		SELECT N'SiteMenu_IPBlockList', N'Lista blokiranih IP adresa', N'IP Block List' UNION ALL
		SELECT N'SiteMenu_IPRestrictions', N'IP ograničenja', N'IPRestrictions' UNION ALL
		SELECT N'SiteMenu_Jobs', N'Poslovi', N'Jobs' UNION ALL
		SELECT N'SiteMenu_Labels', N'Labele', N'Labels' UNION ALL
		SELECT N'SiteMenu_Leads_Title', N'Potencijalni klijenti', N'Leads' UNION ALL
		SELECT N'SiteMenu_Lists', N'Liste', N'Lists' UNION ALL
		SELECT N'SiteMenu_Locations', N'Lokacije', N'Locations' UNION ALL
		SELECT N'SiteMenu_Lookups', N'Šifrarnici', N'Lookups' UNION ALL
		SELECT N'SiteMenu_Manufacturers', N'Proizvođači', N'Manufacturers' UNION ALL
		SELECT N'SiteMenu_ManufacturingOrders', N'Nalozi prodaje', N'Manufacturing Orders' UNION ALL
		SELECT N'SiteMenu_Marketing', N'Marketing', N'Marketing' UNION ALL
		SELECT N'SiteMenu_Members', N'Korisnici', N'Members' UNION ALL
		SELECT N'SiteMenu_MemberApps', N'Pretplate korisnika', N'Member Apps' UNION ALL
		SELECT N'SiteMenu_Membership', N'Korisnici', N'Membership' UNION ALL
		SELECT N'SiteMenu_Menus', N'Izbornici', N'Menus' UNION ALL
		SELECT N'SiteMenu_News', N'Vijesti', N'News' UNION ALL
		SELECT N'SiteMenu_Newsletter', N'Newsletter', N'Newsletter' UNION ALL
		SELECT N'SiteMenu_Orders', N'Narudžbenice', N'Orders' UNION ALL
		SELECT N'SiteMenu_Organizations', N'Organizacije', N'Organizations' UNION ALL
		SELECT N'SiteMenu_Pages', N'Stranice', N'Pages' UNION ALL
		SELECT N'SiteMenu_Patients', N'Pacijenti', N'Patients' UNION ALL
		SELECT N'SiteMenu_Payment', N'Plaćanje', N'Payment' UNION ALL
		SELECT N'SiteMenu_Payments', N'Plaćanja', N'Payments' UNION ALL
		SELECT N'SiteMenu_PaymentSettings', N'Postavke plaćanja', N'Payment Settings' UNION ALL
		SELECT N'SiteMenu_Physicans', N'Liječnici', N'Physicans' UNION ALL
		SELECT N'SiteMenu_Plugins', N'Moduli', N'Plugins' UNION ALL
		SELECT N'SiteMenu_Portfolio', N'Portfolio', N'Portfolio' UNION ALL
		SELECT N'SiteMenu_Portfolios', N'Portfolio', N'Portfolios' UNION ALL
		SELECT N'SiteMenu_Posts', N'Postovi', N'Postovi' UNION ALL
		SELECT N'SiteMenu_PreslapOrders', N'Za isporuku', N'For delivery' UNION ALL
		SELECT N'SiteMenu_Production', N'Proizvodnja', N'Production' UNION ALL
		SELECT N'SiteMenu_ProductionEntryOrders', N'Ulazi iz Proizvodnje', N'Production Entry Orders' UNION ALL
		SELECT N'SiteMenu_Products', N'Proizvodi', N'Products' UNION ALL
		SELECT N'SiteMenu_Profile', N'Moj profil', N'Profile' UNION ALL
		SELECT N'SiteMenu_Projects', N'Projekti', N'Projects' UNION ALL
		SELECT N'SiteMenu_PurchaseOrders', N'Primke', N'Purchase Orders' UNION ALL
		SELECT N'SiteMenu_Qualifications', N'Kvalifikacije', N'Qualifications' UNION ALL
		SELECT N'SiteMenu_Quotes', N'Ponude', N'Quotes' UNION ALL
		SELECT N'SiteMenu_Rates', N'Obračunsko razdoblje', N'Rates' UNION ALL
		SELECT N'SiteMenu_RecurringInvoices', N'Ponavljajući računi', N'Recurring Invoices' UNION ALL
		SELECT N'SiteMenu_RepeatingInvoices', N'Ponavljajući računi', N'Repeating Invoices' UNION ALL
		SELECT N'SiteMenu_Roles', N'Korisničke uloge', N'Roles' UNION ALL
		SELECT N'SiteMenu_RepresentationExpenses', N'Reprezentacija', N'RepresentationExpenses' UNION ALL
		SELECT N'SiteMenu_Routings', N'Putanje', N'Routings' UNION ALL
		SELECT N'SiteMenu_SalesOrders', N'Maloprodaja', N'Sales Orders' UNION ALL
		SELECT N'SiteMenu_SalesPipeline_Title', N'Prodajni kanal', N'Sales Pipeline' UNION ALL
		SELECT N'SiteMenu_ScheduledTasks', N'Zadaci', N'Scheduled Tasks' UNION ALL
		SELECT N'SiteMenu_Security', N'Sigurnost', N'Security' UNION ALL
		SELECT N'SiteMenu_Settings', N'Postavke', N'Settings' UNION ALL
		SELECT N'SiteMenu_Shipments', N'Otpremnice', N'Shipments' UNION ALL
		SELECT N'SiteMenu_SignOut', N'Odjavi se', N'Sign Out' UNION ALL
		SELECT N'SiteMenu_SiteContent', N'Sadržaj', N'Site Content' UNION ALL
		SELECT N'SiteMenu_SiteLocalization', N'Resursi', N'Site Localization' UNION ALL
		SELECT N'SiteMenu_SiteNavigation', N'Navigacija', N'Site Navigation' UNION ALL
		SELECT N'SiteMenu_Skills', N'Vještine', N'Skills' UNION ALL
		SELECT N'SiteMenu_Statuses', N'Statusi', N'Statuses' UNION ALL
		SELECT N'SiteMenu_Stock', N'Skladište', N'Stock' UNION ALL
		SELECT N'SiteMenu_StoreSettings', N'Postavke trgovine', N'Store Settings' UNION ALL
		SELECT N'SiteMenu_SubscriberLists', N'Lista pretplatnika', N'Subscriber Lists' UNION ALL
		SELECT N'SiteMenu_Subscribers', N'Pretplatnici', N'Subscribers' UNION ALL
		SELECT N'SiteMenu_Subscriptions', N'Pretplatnici', N'Subscriptions' UNION ALL
		SELECT N'SiteMenu_Subscriptions_Title', N'Pretplate', N'Subscriptions' UNION ALL
		SELECT N'SiteMenu_Suppliers', N'Dobavljači', N'Suppliers' UNION ALL
		SELECT N'SiteMenu_Support', N'Podrška', N'Support' UNION ALL
		SELECT N'SiteMenu_Tasks', N'Zadaci', N'Tasks' UNION ALL
		SELECT N'SiteMenu_TaskStatuses', N'Statusi ugovora', N'Contract Statuses' UNION ALL
		SELECT N'SiteMenu_Testimonials', N'Testimonijali', N'Testimonials' UNION ALL
		SELECT N'SiteMenu_TimeEntries', N'Vremenski unosi', N'Time Entries' UNION ALL
		SELECT N'SiteMenu_TimeRequirements', N'Vremenski zahtjevi', N'Time Requirements' UNION ALL
		SELECT N'SiteMenu_TimeSheets', N'Obrazci rada', N'Time Sheets' UNION ALL
		SELECT N'SiteMenu_TransferOrders', N'Međuskladišnica', N'Transfer Orders' UNION ALL
		SELECT N'SiteMenu_WorkCenterTypes', N'Tipovi radnog centra', N'Work Center Types' 
		
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
