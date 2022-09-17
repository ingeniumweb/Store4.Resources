/*=CONCATENATE("SELECT N'";A1;"', N'";B1;"' UNION ALL")*/
DECLARE @ResourcesTable TABLE (Name VARCHAR (128), Value NVARCHAR (MAX), Description NVARCHAR (MAX))

DECLARE @ResourceID INT, @ResourceTypeID INT, @LanguageID INT
DECLARE @Name VARCHAR (128), @Value NVARCHAR (MAX), @Description NVARCHAR (MAX)

SET @ResourceTypeID = NULL
SELECT TOP 1 @ResourceTypeID = ResourceTypeID FROM ResourceTypes WHERE Name = 'MenuResources'
SET @ResourceTypeID = ISNULL (@ResourceTypeID, 0)

SET @LanguageID = NULL
SELECT TOP 1 @LanguageID = LanguageID FROM Languages WHERE CultureName = 'en-GB' --AND IsEnabled = 1
SET @LanguageID = ISNULL (@LanguageID, 0)

IF (@ResourceTypeID > 0 AND @LanguageID > 0) BEGIN
	INSERT INTO @ResourcesTable (Name, Value)
		SELECT N'SiteMenu_AccountSettings', N'Account Settings' UNION ALL
		SELECT N'SiteMenu_Ads', N'Ads/Banners' UNION ALL
		SELECT N'SiteMenu_Applications', N'Applications' UNION ALL
		SELECT N'SiteMenu_Apps', N'Apps' UNION ALL
		SELECT N'SiteMenu_Articles', N'Articles' UNION ALL
		SELECT N'SiteMenu_Audit', N'Audit' UNION ALL
		SELECT N'SiteMenu_BillOfMaterials', N'Bill of Materials' UNION ALL
		SELECT N'SiteMenu_Billings', N'Billings' UNION ALL
		SELECT N'SiteMenu_Blog', N'Blog' UNION ALL
		SELECT N'SiteMenu_BlogPost', N'Blog Post' UNION ALL
		SELECT N'SiteMenu_BlogPosts', N'Blog Posts' UNION ALL
		SELECT N'SiteMenu_Campaigns', N'Campaigns' UNION ALL
		SELECT N'SiteMenu_CashSalesOrders', N'Cash Sales Orders' UNION ALL
		SELECT N'SiteMenu_Categories', N'Categories' UNION ALL
		SELECT N'SiteMenu_Cities', N'Cities' UNION ALL
		SELECT N'SiteMenu_Comments', N'Comments' UNION ALL
		SELECT N'SiteMenu_Companies', N'Companies' UNION ALL
		SELECT N'SiteMenu_CompanyLocations', N'Company Locations' UNION ALL
		SELECT N'SiteMenu_Connections', N'Connections' UNION ALL
		SELECT N'SiteMenu_Contact', N'Contact' UNION ALL
		SELECT N'SiteMenu_Contacts', N'Contacts' UNION ALL
		SELECT N'SiteMenu_Content', N'Content' UNION ALL
		SELECT N'SiteMenu_Contents', N'Contents' UNION ALL
		SELECT N'SiteMenu_Contracts', N'Contracts' UNION ALL
		SELECT N'SiteMenu_Contractors', N'Contractors' UNION ALL
		SELECT N'SiteMenu_Countries', N'Countries' UNION ALL
		SELECT N'SiteMenu_Contracts_Title', N'Contracts' UNION ALL
		SELECT N'SiteMenu_CountyStateProvinces', N'County/State/Provinces' UNION ALL
		SELECT N'SiteMenu_CRM', N'CRM' UNION ALL
		SELECT N'SiteMenu_Customers', N'Customers' UNION ALL
		SELECT N'SiteMenu_Dashboard', N'Dashboard' UNION ALL
		SELECT N'SiteMenu_Deliverables', N'Deliverables' UNION ALL
		SELECT N'SiteMenu_Description_Lists', N'Lists Editor (FAQs)' UNION ALL
		SELECT N'SiteMenu_Description_Settings', N'Global Settings' UNION ALL
		SELECT N'SiteMenu_Description_Support', N'Help & Support' UNION ALL
		SELECT N'SiteMenu_Devices', N'Devices' UNION ALL
		SELECT N'SiteMenu_Distributors', N'Distributors' UNION ALL
		SELECT N'SiteMenu_Deals_Title', N'Deals' UNION ALL
		SELECT N'SiteMenu_Domains', N'Domains' UNION ALL
		SELECT N'SiteMenu_Durations', N'Durations' UNION ALL
		SELECT N'SiteMenu_EmailCampaigns', N'Email Campaigns' UNION ALL
		SELECT N'SiteMenu_Employees', N'Employees' UNION ALL
		SELECT N'SiteMenu_Events', N'Events' UNION ALL
		SELECT N'SiteMenu_ExpenseOrders', N'Expense Orders' UNION ALL
		SELECT N'SiteMenu_Fields', N'Fields' UNION ALL
		SELECT N'SiteMenu_FilesManager', N'Files Manager' UNION ALL
		SELECT N'SiteMenu_FormBuilder', N'Form Builder' UNION ALL
		SELECT N'SiteMenu_FormFieldSettings', N'Field Settings' UNION ALL
		SELECT N'SiteMenu_FormLookups', N'Lookups' UNION ALL
		SELECT N'SiteMenu_FormSettings', N'Form Settings'  UNION ALL
		SELECT N'SiteMenu_Forms', N'Forms' UNION ALL
		SELECT N'SiteMenu_Galleries', N'Galleries' UNION ALL
		SELECT N'SiteMenu_Home', N'Home' UNION ALL
		SELECT N'SiteMenu_HtmlTemplates', N'Html Templates' UNION ALL
		SELECT N'SiteMenu_Inbox', N'Inbox' UNION ALL
		SELECT N'SiteMenu_Industries', N'Industries' UNION ALL
		SELECT N'SiteMenu_Inventory', N'Inventory' UNION ALL
		SELECT N'SiteMenu_Invoices', N'Invoices' UNION ALL
		SELECT N'SiteMenu_IPBlockList', N'IP Block List' UNION ALL
		SELECT N'SiteMenu_IPRestrictions', N'IPRestrictions' UNION ALL
		SELECT N'SiteMenu_Jobs', N'Jobs' UNION ALL
		SELECT N'SiteMenu_Labels', N'Labels' UNION ALL
		SELECT N'SiteMenu_Leads_Title', N'Leads' UNION ALL
		SELECT N'SiteMenu_Lists', N'Lists' UNION ALL
		SELECT N'SiteMenu_Locations', N'Locations' UNION ALL
		SELECT N'SiteMenu_Lookups', N'Lookups' UNION ALL
		SELECT N'SiteMenu_Manufacturers', N'Manufacturers' UNION ALL
		SELECT N'SiteMenu_ManufacturingOrders', N'Manufacturing Orders' UNION ALL
		SELECT N'SiteMenu_Marketing', N'Marketing' UNION ALL
		SELECT N'SiteMenu_Members', N'Members' UNION ALL
		SELECT N'SiteMenu_MemberApps', N'Member Apps' UNION ALL
		SELECT N'SiteMenu_Membership', N'Membership' UNION ALL
		SELECT N'SiteMenu_Menus', N'Menus' UNION ALL
		SELECT N'SiteMenu_News', N'News' UNION ALL
		SELECT N'SiteMenu_Newsletter', N'Newsletter' UNION ALL
		SELECT N'SiteMenu_Orders', N'Orders' UNION ALL
		SELECT N'SiteMenu_Organizations', N'Organizations' UNION ALL
		SELECT N'SiteMenu_Pages', N'Pages' UNION ALL
		SELECT N'SiteMenu_Patients', N'Patients' UNION ALL
		SELECT N'SiteMenu_Payment', N'Payment' UNION ALL
		SELECT N'SiteMenu_Payments', N'Payments' UNION ALL
		SELECT N'SiteMenu_PaymentSettings', N'Payment Settings' UNION ALL
		SELECT N'SiteMenu_Physicans', N'Physicans' UNION ALL
		SELECT N'SiteMenu_Plugins', N'Plugins' UNION ALL
		SELECT N'SiteMenu_Portfolio', N'Portfolio' UNION ALL
		SELECT N'SiteMenu_Portfolios', N'Portfolios' UNION ALL
		SELECT N'SiteMenu_Posts', N'Posts' UNION ALL
		SELECT N'SiteMenu_PreslapOrders', N'For delivery' UNION ALL
		SELECT N'SiteMenu_Production', N'Production' UNION ALL
		SELECT N'SiteMenu_ProductionEntryOrders', N'Production Entry Orders' UNION ALL
		SELECT N'SiteMenu_Products', N'Products' UNION ALL
		SELECT N'SiteMenu_Profile', N'Profile' UNION ALL
		SELECT N'SiteMenu_PurchaseOrders', N'Purchase Orders' UNION ALL
		SELECT N'SiteMenu_Qualifications', N'Qualifications' UNION ALL
		SELECT N'SiteMenu_Quotes', N'Quotes' UNION ALL
		SELECT N'SiteMenu_Rates', N'Rates' UNION ALL
		SELECT N'SiteMenu_Roles', N'Roles' UNION ALL
		SELECT N'SiteMenu_RepresentationExpenses', N'RepresentationExpenses' UNION ALL
		SELECT N'SiteMenu_Routings', N'Routings' UNION ALL
		SELECT N'SiteMenu_SalesOrders', N'Sales Orders' UNION ALL
		SELECT N'SiteMenu_SalesPipeline_Title', N'Sales Pipeline' UNION ALL
		SELECT N'SiteMenu_ScheduledTasks', N'Scheduled Tasks' UNION ALL
		SELECT N'SiteMenu_Security', N'Security' UNION ALL
		SELECT N'SiteMenu_Settings', N'Settings' UNION ALL
		SELECT N'SiteMenu_Shipments', N'Shipments' UNION ALL
		SELECT N'SiteMenu_SignOut', N'Sign Out' UNION ALL
		SELECT N'SiteMenu_SiteContent', N'Site Content' UNION ALL
		SELECT N'SiteMenu_SiteLocalization', N'Site Localization' UNION ALL
		SELECT N'SiteMenu_SiteNavigation', N'Site Navigation' UNION ALL
		SELECT N'SiteMenu_Skills', N'Skills' UNION ALL
		SELECT N'SiteMenu_Statuses', N'Statuses' UNION ALL
		SELECT N'SiteMenu_Stock', N'Stock' UNION ALL
		SELECT N'SiteMenu_StoreSettings', N'Store Settings' UNION ALL
		SELECT N'SiteMenu_SubscriberLists', N'Subscriber Lists' UNION ALL
		SELECT N'SiteMenu_Subscribers', N'Subscribers' UNION ALL
		SELECT N'SiteMenu_Subscriptions', N'Subscriptions' UNION ALL
		SELECT N'SiteMenu_Subscriptions_Title', N'Subscriptions' UNION ALL
		SELECT N'SiteMenu_Suppliers', N'Suppliers' UNION ALL
		SELECT N'SiteMenu_Support', N'Support' UNION ALL
		SELECT N'SiteMenu_Tasks', N'Tasks' UNION ALL
		SELECT N'SiteMenu_TaskStatuses', N'Contract Statuses' UNION ALL
		SELECT N'SiteMenu_Testimonials', N'Testimonials' UNION ALL
		SELECT N'SiteMenu_TimeEntries', N'Time Entries' UNION ALL
		SELECT N'SiteMenu_TimeRequirements', N'Time Requirements' UNION ALL
		SELECT N'SiteMenu_TimeSheets', N'Time Sheets' UNION ALL
		SELECT N'SiteMenu_TransferOrders', N'Transfer Orders' UNION ALL
		SELECT N'SiteMenu_WorkCenterTypes', N'Work Center Types' 
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
