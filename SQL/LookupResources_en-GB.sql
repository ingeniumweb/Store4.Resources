/*=CONCATENATE("SELECT N'";A1;"', N'";B1;"' UNION ALL")*/
DECLARE @ResourcesTable TABLE (Name VARCHAR (128), Value NVARCHAR (MAX), Description NVARCHAR (MAX))

DECLARE @ResourceID INT, @ResourceTypeID INT, @LanguageID INT
DECLARE @Name VARCHAR (128), @Value NVARCHAR (MAX), @Description NVARCHAR (MAX)

SET @ResourceTypeID = NULL
SELECT TOP 1 @ResourceTypeID = ResourceTypeID FROM ResourceTypes WHERE Name = 'LookupResources'
SET @ResourceTypeID = ISNULL (@ResourceTypeID, 0)

SET @LanguageID = NULL
SELECT TOP 1 @LanguageID = LanguageID FROM Languages WHERE CultureName = 'en-GB' --AND IsEnabled = 1
SET @LanguageID = ISNULL (@LanguageID, 0)

IF (@ResourceTypeID > 0 AND @LanguageID > 0) BEGIN
	INSERT INTO @ResourcesTable (Name, Value)
		SELECT N'Email_Drafts', N'Drafts' UNION ALL
		SELECT N'Email_Important', N'Important' UNION ALL
		SELECT N'Email_Inbox', N'Inbox' UNION ALL
		SELECT N'Email_Sent', N'Sent' UNION ALL
		SELECT N'Email_Spam', N'Spam' UNION ALL
		SELECT N'Email_Trash', N'Trash' UNION ALL
		SELECT N'EmailSendType_Bcc', N'Bcc' UNION ALL
		SELECT N'EmailSendType_Cc', N'Cc' UNION ALL
		SELECT N'EmailSendType_From', N'From' UNION ALL
		SELECT N'EmailSendType_To', N'To' UNION ALL
		SELECT N'FriendStatus_Facebook', N'Facebook' UNION ALL
		SELECT N'FriendStatus_Friend', N'Friend' UNION ALL
		SELECT N'FriendStatus_Google', N'Google' UNION ALL
		SELECT N'FriendStatus_Invite', N'Invite' UNION ALL
		SELECT N'FriendStatus_LinkedIn', N'LinkedIn' UNION ALL
		SELECT N'FriendStatus_Subscriber', N'Subscriber' UNION ALL
		SELECT N'FriendStatus_Twitter', N'Twitter' UNION ALL
		SELECT N'CompanyIndustry_Accounting', N'Accounting' UNION ALL
		SELECT N'CompanyIndustry_AirlinesAviation', N'Airlines/Aviation' UNION ALL
		SELECT N'CompanyIndustry_AlternativeDisputeResolution', N'Alternative Dispute Resolution' UNION ALL
		SELECT N'CompanyIndustry_AlternativeMedicine', N'Alternative Medicine' UNION ALL
		SELECT N'CompanyIndustry_Animation', N'Animation' UNION ALL
		SELECT N'CompanyIndustry_ApparelFashion', N'Apparel & Fashion' UNION ALL
		SELECT N'CompanyIndustry_ArchitecturePlanning', N'Architecture & Planning' UNION ALL
		SELECT N'CompanyIndustry_ArtsCrafts', N'Arts & Crafts' UNION ALL
		SELECT N'CompanyIndustry_Automotive', N'Automotive' UNION ALL
		SELECT N'CompanyIndustry_AviationAerospace', N'Aviation & Aerospace' UNION ALL
		SELECT N'CompanyIndustry_Banking', N'Banking' UNION ALL
		SELECT N'CompanyIndustry_Biotechnology', N'Biotechnology' UNION ALL
		SELECT N'CompanyIndustry_BroadcastMedia', N'Broadcast Media' UNION ALL
		SELECT N'CompanyIndustry_BuildingMaterials', N'Building Materials' UNION ALL
		SELECT N'CompanyIndustry_BusinessSuppliesEquipment', N'Business Supplies & Equipment' UNION ALL
		SELECT N'CompanyIndustry_CapitalMarkets', N'Capital Markets' UNION ALL
		SELECT N'CompanyIndustry_Chemicals', N'Chemicals' UNION ALL
		SELECT N'CompanyIndustry_CivicSocialOrganization', N'Civic & Social Organization' UNION ALL
		SELECT N'CompanyIndustry_CivilEngineering', N'Civil Engineering' UNION ALL
		SELECT N'CompanyIndustry_CommercialRealEstate', N'Commercial Real Estate' UNION ALL
		SELECT N'CompanyIndustry_ComputerNetworkSecurity', N'Computer & Network Security' UNION ALL
		SELECT N'CompanyIndustry_ComputerGames', N'Computer Games' UNION ALL
		SELECT N'CompanyIndustry_ComputerHardware', N'Computer Hardware' UNION ALL
		SELECT N'CompanyIndustry_ComputerNetworking', N'Computer Networking' UNION ALL
		SELECT N'CompanyIndustry_ComputerSoftware', N'Computer Software' UNION ALL
		SELECT N'CompanyIndustry_Construction', N'Construction' UNION ALL
		SELECT N'CompanyIndustry_ConsumerElectronics', N'Consumer Electronics' UNION ALL
		SELECT N'CompanyIndustry_ConsumerGoods', N'Consumer Goods' UNION ALL
		SELECT N'CompanyIndustry_ConsumerServices', N'Consumer Services' UNION ALL
		SELECT N'CompanyIndustry_Cosmetics', N'Cosmetics' UNION ALL
		SELECT N'CompanyIndustry_Dairy', N'Dairy' UNION ALL
		SELECT N'CompanyIndustry_DefenseSpace', N'Defense & Space' UNION ALL
		SELECT N'CompanyIndustry_Design', N'Design' UNION ALL
		SELECT N'CompanyIndustry_EducationManagement', N'Education Management' UNION ALL
		SELECT N'CompanyIndustry_E_learning', N'E-learning' UNION ALL
		SELECT N'CompanyIndustry_ElectricalElectronicManufacturing', N'Electrical & Electronic Manufacturing' UNION ALL
		SELECT N'CompanyIndustry_Entertainment', N'Entertainment' UNION ALL
		SELECT N'CompanyIndustry_EnvironmentalServices', N'Environmental Services' UNION ALL
		SELECT N'CompanyIndustry_EventsServices', N'Events Services' UNION ALL
		SELECT N'CompanyIndustry_ExecutiveOffice', N'Executive Office' UNION ALL
		SELECT N'CompanyIndustry_FacilitiesServices', N'Facilities Services' UNION ALL
		SELECT N'CompanyIndustry_Farming', N'Farming' UNION ALL
		SELECT N'CompanyIndustry_FinancialServices', N'Financial Services' UNION ALL
		SELECT N'CompanyIndustry_FineArt', N'Fine Art' UNION ALL
		SELECT N'CompanyIndustry_Fishery', N'Fishery' UNION ALL
		SELECT N'CompanyIndustry_FoodBeverages', N'Food & Beverages' UNION ALL
		SELECT N'CompanyIndustry_FoodProduction', N'Food Production' UNION ALL
		SELECT N'CompanyIndustry_Fundraising', N'Fundraising' UNION ALL
		SELECT N'CompanyIndustry_Furniture', N'Furniture' UNION ALL
		SELECT N'CompanyIndustry_GamblingCasinos', N'Gambling & Casinos' UNION ALL
		SELECT N'CompanyIndustry_GlassCeramicsConcrete', N'Glass, Ceramics & Concrete' UNION ALL
		SELECT N'CompanyIndustry_GovernmentAdministration', N'Government Administration' UNION ALL
		SELECT N'CompanyIndustry_GovernmentRelations', N'Government Relations' UNION ALL
		SELECT N'CompanyIndustry_GraphicDesign', N'Graphic Design' UNION ALL
		SELECT N'CompanyIndustry_HealthWellnessFitness', N'Health, Wellness & Fitness' UNION ALL
		SELECT N'CompanyIndustry_HigherEducation', N'Higher Education' UNION ALL
		SELECT N'CompanyIndustry_HospitalHealthCare', N'Hospital & Health Care' UNION ALL
		SELECT N'CompanyIndustry_Hospitality', N'Hospitality' UNION ALL
		SELECT N'CompanyIndustry_HumanResources', N'Human Resources' UNION ALL
		SELECT N'CompanyIndustry_ImportExport', N'Import & Export' UNION ALL
		SELECT N'CompanyIndustry_IndividualFamilyServices', N'Individual & Family Services' UNION ALL
		SELECT N'CompanyIndustry_IndustrialAutomation', N'Industrial Automation' UNION ALL
		SELECT N'CompanyIndustry_InformationServices', N'Information Services' UNION ALL
		SELECT N'CompanyIndustry_InformationTechnologyServices', N'Information Technology & Services' UNION ALL
		SELECT N'CompanyIndustry_Insurance', N'Insurance' UNION ALL
		SELECT N'CompanyIndustry_InternationalAffairs', N'International Affairs' UNION ALL
		SELECT N'CompanyIndustry_InternationalTradeDevelopment', N'International Trade & Development' UNION ALL
		SELECT N'CompanyIndustry_Internet', N'Internet' UNION ALL
		SELECT N'CompanyIndustry_InvestmentBankingVenture', N'Investment Banking/Venture' UNION ALL
		SELECT N'CompanyIndustry_InvestmentManagement', N'Investment Management' UNION ALL
		SELECT N'CompanyIndustry_Judiciary', N'Judiciary' UNION ALL
		SELECT N'CompanyIndustry_LawEnforcement', N'Law Enforcement' UNION ALL
		SELECT N'CompanyIndustry_LawPractice', N'Law Practice' UNION ALL
		SELECT N'CompanyIndustry_LegalServices', N'Legal Services' UNION ALL
		SELECT N'CompanyIndustry_LegislativeOffice', N'Legislative Office' UNION ALL
		SELECT N'CompanyIndustry_LeisureTravel', N'Leisure & Travel' UNION ALL
		SELECT N'CompanyIndustry_Libraries', N'Libraries' UNION ALL
		SELECT N'CompanyIndustry_LogisticsSupplyChain', N'Logistics & Supply Chain' UNION ALL
		SELECT N'CompanyIndustry_LuxuryGoodsJewelry', N'Luxury Goods & Jewelry' UNION ALL
		SELECT N'CompanyIndustry_Machinery', N'Machinery' UNION ALL
		SELECT N'CompanyIndustry_ManagementConsulting', N'Management Consulting' UNION ALL
		SELECT N'CompanyIndustry_Maritime', N'Maritime' UNION ALL
		SELECT N'CompanyIndustry_MarketResearch', N'Market Research' UNION ALL
		SELECT N'CompanyIndustry_MarketingAdvertising', N'Marketing & Advertising' UNION ALL
		SELECT N'CompanyIndustry_MechanicalorIndustrialEngineering', N'Mechanical or Industrial Engineering' UNION ALL
		SELECT N'CompanyIndustry_MediaProduction', N'Media Production' UNION ALL
		SELECT N'CompanyIndustry_MedicalDevice', N'Medical Device' UNION ALL
		SELECT N'CompanyIndustry_MedicalPractice', N'Medical Practice' UNION ALL
		SELECT N'CompanyIndustry_MentalHealthCare', N'Mental Health Care' UNION ALL
		SELECT N'CompanyIndustry_Military', N'Military' UNION ALL
		SELECT N'CompanyIndustry_MiningMetals', N'Mining & Metals' UNION ALL
		SELECT N'CompanyIndustry_MotionPicturesFilm', N'Motion Pictures & Film' UNION ALL
		SELECT N'CompanyIndustry_MuseumsInstitutions', N'Museums & Institutions' UNION ALL
		SELECT N'CompanyIndustry_Music', N'Music' UNION ALL
		SELECT N'CompanyIndustry_Nanotechnology', N'Nanotechnology' UNION ALL
		SELECT N'CompanyIndustry_Newspapers', N'Newspapers' UNION ALL
		SELECT N'CompanyIndustry_NonprofitOrganizationManagement', N'Nonprofit Organization Management' UNION ALL
		SELECT N'CompanyIndustry_OilEnergy', N'Oil & Energy' UNION ALL
		SELECT N'CompanyIndustry_OnlinePublishing', N'Online Publishing' UNION ALL
		SELECT N'CompanyIndustry_OutsourcingOffshoring', N'Outsourcing/Offshoring' UNION ALL
		SELECT N'CompanyIndustry_PackageFreightDelivery', N'Package/Freight Delivery' UNION ALL
		SELECT N'CompanyIndustry_PackagingContainers', N'Packaging & Containers' UNION ALL
		SELECT N'CompanyIndustry_PaperForestProducts', N'Paper & Forest Products' UNION ALL
		SELECT N'CompanyIndustry_PerformingArts', N'Performing Arts' UNION ALL
		SELECT N'CompanyIndustry_Pharmaceuticals', N'Pharmaceuticals' UNION ALL
		SELECT N'CompanyIndustry_Philanthropy', N'Philanthropy' UNION ALL
		SELECT N'CompanyIndustry_Photography', N'Photography' UNION ALL
		SELECT N'CompanyIndustry_Plastics', N'Plastics' UNION ALL
		SELECT N'CompanyIndustry_PoliticalOrganization', N'Political Organization' UNION ALL
		SELECT N'CompanyIndustry_PrimarySecondary', N'Primary/Secondary' UNION ALL
		SELECT N'CompanyIndustry_Printing', N'Printing' UNION ALL
		SELECT N'CompanyIndustry_ProfessionalTraining', N'Professional Training' UNION ALL
		SELECT N'CompanyIndustry_ProgramDevelopment', N'Program Development' UNION ALL
		SELECT N'CompanyIndustry_PublicPolicy', N'Public Policy' UNION ALL
		SELECT N'CompanyIndustry_PublicRelations', N'Public Relations' UNION ALL
		SELECT N'CompanyIndustry_PublicSafety', N'Public Safety' UNION ALL
		SELECT N'CompanyIndustry_Publishing', N'Publishing' UNION ALL
		SELECT N'CompanyIndustry_RailroadManufacture', N'Railroad Manufacture' UNION ALL
		SELECT N'CompanyIndustry_Ranching', N'Ranching' UNION ALL
		SELECT N'CompanyIndustry_RealEstate', N'Real Estate' UNION ALL
		SELECT N'CompanyIndustry_RecreationalFacilitiesServices', N'Recreational Facilities & Services' UNION ALL
		SELECT N'CompanyIndustry_ReligiousInstitutions', N'Religious Institutions' UNION ALL
		SELECT N'CompanyIndustry_RenewablesEnvironment', N'Renewables & Environment' UNION ALL
		SELECT N'CompanyIndustry_Research', N'Research' UNION ALL
		SELECT N'CompanyIndustry_Restaurants', N'Restaurants' UNION ALL
		SELECT N'CompanyIndustry_Retail', N'Retail' UNION ALL
		SELECT N'CompanyIndustry_SecurityInvestigations', N'Security & Investigations' UNION ALL
		SELECT N'CompanyIndustry_Semiconductors', N'Semiconductors' UNION ALL
		SELECT N'CompanyIndustry_Shipbuilding', N'Shipbuilding' UNION ALL
		SELECT N'CompanyIndustry_SportingGoods', N'Sporting Goods' UNION ALL
		SELECT N'CompanyIndustry_Sports', N'Sports' UNION ALL
		SELECT N'CompanyIndustry_StaffingRecruiting', N'Staffing & Recruiting' UNION ALL
		SELECT N'CompanyIndustry_Supermarkets', N'Supermarkets' UNION ALL
		SELECT N'CompanyIndustry_Telecommunications', N'Telecommunications' UNION ALL
		SELECT N'CompanyIndustry_Textiles', N'Textiles' UNION ALL
		SELECT N'CompanyIndustry_ThinkTanks', N'Think Tanks' UNION ALL
		SELECT N'CompanyIndustry_Tobacco', N'Tobacco' UNION ALL
		SELECT N'CompanyIndustry_TranslationLocalization', N'Translation & Localization' UNION ALL
		SELECT N'CompanyIndustry_TransportationTruckingRailroad', N'Transportation/Trucking/Railroad' UNION ALL
		SELECT N'CompanyIndustry_Utilities', N'Utilities' UNION ALL
		SELECT N'CompanyIndustry_VentureCapital', N'Venture Capital' UNION ALL
		SELECT N'CompanyIndustry_Veterinary', N'Veterinary' UNION ALL
		SELECT N'CompanyIndustry_Warehousing', N'Warehousing' UNION ALL
		SELECT N'CompanyIndustry_Wholesale', N'Wholesale' UNION ALL
		SELECT N'CompanyIndustry_WineSpirits', N'Wine & Spirits' UNION ALL
		SELECT N'CompanyIndustry_Wireless', N'Wireless' UNION ALL
		SELECT N'CompanyIndustry_WritingEditing', N'Writing & Editing' UNION ALL
		SELECT N'CompanyType_Customer', N'Customer' UNION ALL
		SELECT N'CompanyType_Other', N'Other' UNION ALL
		SELECT N'CompanyType_Partner', N'Partner' UNION ALL
		SELECT N'CompanyType_Prospect', N'Prospect' UNION ALL
		SELECT N'CompanyType_Reseller', N'Reseller' UNION ALL
		SELECT N'CompanyType_Supplier', N'Supplier' UNION ALL
		SELECT N'CompanyType_Vendor', N'Vendor' UNION ALL
		SELECT N'CompanyAccountType_Basic', N'Basic' UNION ALL
		SELECT N'CompanyAccountType_Elite', N'Elite' UNION ALL
		SELECT N'CompanyAccountType_Premium', N'Premium' UNION ALL
		SELECT N'CompanySize_10000', N'10000+' UNION ALL
		SELECT N'CompanySize_1001_5000', N'1001-5000' UNION ALL
		SELECT N'CompanySize_101_200', N'101-200' UNION ALL
		SELECT N'CompanySize_11_50', N'11-50' UNION ALL
		SELECT N'CompanySize_201_500', N'201-500' UNION ALL
		SELECT N'CompanySize_2_10', N'2-10' UNION ALL
		SELECT N'CompanySize_5001_10000', N'5001-10000' UNION ALL
		SELECT N'CompanySize_501_1000', N'501-1000' UNION ALL
		SELECT N'CompanySize_51_100', N'51-100' UNION ALL
		SELECT N'CompanySize_OnlyMyself', N'Only Myself' UNION ALL
		SELECT N'CompanyOperatingStatus_Acquired', N'Acquired' UNION ALL
		SELECT N'CompanyOperatingStatus_Operating', N'Operating' UNION ALL
		SELECT N'CompanyOperatingStatus_OperatingSubsidiary', N'Operating Subsidiary' UNION ALL
		SELECT N'CompanyOperatingStatus_OutofBusiness', N'Out of Business' UNION ALL
		SELECT N'CompanyOperatingStatus_Reorganizing', N'Reorganizing' UNION ALL
		SELECT N'EmailAccountType_IMAP', N'IMAP' UNION ALL
		SELECT N'EmailAccountType_POP3', N'POP3' UNION ALL
		SELECT N'EmailEncryptionType_None', N'None' UNION ALL
		SELECT N'EmailEncryptionType_SSL', N'SSL' UNION ALL
		SELECT N'EmailEncryptionType_TLS', N'TLS' UNION ALL
		SELECT N'CommentAction_Approved', N'Approved' UNION ALL
		SELECT N'CommentAction_Spam', N'Spam' UNION ALL
		SELECT N'CommentAction_Trash', N'Trash' UNION ALL
		SELECT N'CommentAction_Unnaproved', N'Unnaproved' UNION ALL
		SELECT N'CouponType_PercentageDiscount', N'Percentage Discount' UNION ALL
		SELECT N'CouponType_FixedCartDiscount', N'Fixed Cart Discount' UNION ALL
		SELECT N'CouponType_FixedProductDiscount', N'Fixed Product Discount' UNION ALL
		SELECT N'DueDayType_DaysAfterTheInvoice', N'day(s) after the invoice' UNION ALL
		SELECT N'DueDayType_OfTheFollowingMonth', N'of the following month' UNION ALL
		SELECT N'DueDayType_DaysAfterTheEndOfTheInvoiceMonth', N'day(s) after the end of the invoice month' UNION ALL
		SELECT N'DueDayType_OfTheCurrentMonth', N'of the current month' UNION ALL
		SELECT N'Tasks_Daily', N'Daily' UNION ALL
		SELECT N'Tasks_Interval', N'Interval' UNION ALL
		SELECT N'Tasks_Monthly', N'Monthly' UNION ALL
		SELECT N'Tasks_Once', N'Once' UNION ALL
		SELECT N'Tasks_Weekly', N'Weekly' UNION ALL
		SELECT N'Tasks_Yearly', N'Yearly' UNION ALL
		SELECT N'PaymentType_BankTransfer', N'Bank Transfer' UNION ALL
		SELECT N'PaymentType_Cheque', N'Cheque' UNION ALL
		SELECT N'PaymentType_CreditCard', N'Credit Card' UNION ALL
		SELECT N'PaymentType_PayPal', N'PayPal' UNION ALL
		SELECT N'PaymentType_StandingOrder', N'Standing Order' UNION ALL
		SELECT N'ProjectType_Bug', N'Bug' UNION ALL
		SELECT N'ProjectType_Idea', N'Idea' UNION ALL
		SELECT N'ProjectType_Task', N'Task' UNION ALL
		SELECT N'ProjectPriority_High', N'High' UNION ALL
		SELECT N'ProjectPriority_Low', N'Low' UNION ALL
		SELECT N'ProjectPriority_Medium', N'Medium' UNION ALL
		SELECT N'ProjectPriority_None', N'None' UNION ALL
		SELECT N'ProjectPriority_VeryHigh', N'Very High' UNION ALL
		SELECT N'ProjectPriority_VeryLow', N'Very Low' UNION ALL
		SELECT N'ProjectStatus_Active', N'Active' UNION ALL
		SELECT N'ProjectStatus_Completed', N'Completed' UNION ALL
		SELECT N'ProjectStatus_InProgress', N'In Progress' UNION ALL
		SELECT N'ProjectStatus_InReview', N'In Review' UNION ALL
		SELECT N'ProjectStatus_Paused', N'Paused' UNION ALL
		SELECT N'ProjectStatus_Planned', N'Planned' UNION ALL
		SELECT N'Database_MSSQL', N'MSSQL' UNION ALL
		SELECT N'Database_MySQL', N'MySQL' UNION ALL
		SELECT N'Database_PostgreSQL', N'PostgreSQL' UNION ALL
		SELECT N'Server_Linux', N'Linux' UNION ALL
		SELECT N'Server_Windows', N'Windows' UNION ALL
		SELECT N'PaymentGateway_Braintree', N'Braintree' UNION ALL
		SELECT N'PaymentGateway_PayPal', N'PayPal' UNION ALL
		SELECT N'PaymentGateway_Stripe', N'Stripe' UNION ALL
		SELECT N'PaymentGateway_WSpayForm', N'WSpayForm' UNION ALL
		SELECT N'ContactType_Client', N'Client' UNION ALL
		SELECT N'ContactType_Friend', N'Friend' UNION ALL
		SELECT N'ContactType_Lead', N'Lead' UNION ALL
		SELECT N'ContactType_Prospect', N'Prospect' UNION ALL
		SELECT N'ProductSubscriptionType_Basic', N'Basic' UNION ALL
		SELECT N'ProductSubscriptionType_Enterprise', N'Enterprise' UNION ALL
		SELECT N'ProductSubscriptionType_Premium', N'Premium' UNION ALL
		SELECT N'RenewalPeriod_Days', N'Day(s)' UNION ALL
		SELECT N'RenewalPeriod_Weeks', N'Week(s)' UNION ALL
		SELECT N'RenewalPeriod_Months', N'Month(s)' UNION ALL
		SELECT N'RenewalPeriod_Years', N'Year(s)' UNION ALL
		SELECT N'SubscriptionTypePeriod_Monthly', N'Monthly' UNION ALL
		SELECT N'SubscriptionTypePeriod_Yearly', N'Yearly' UNION ALL
		SELECT N'ContentType_Product', N'Product' UNION ALL
		SELECT N'ContentType_Company', N'Company' UNION ALL
		SELECT N'DocumentStatus_Contract_Expired', N'Expired' UNION ALL
		SELECT N'DocumentStatus_Contract_OnHold', N'OnHold' UNION ALL
		SELECT N'DocumentStatus_Contract_Fulfilled', N'Fulfilled' UNION ALL
		SELECT N'DocumentStatus_Contract_Finalized', N'Finalized' UNION ALL
		SELECT N'DocumentStatus_Contract_Cancelled', N'Cancelled' UNION ALL
		SELECT N'DocumentStatus_Contract_Void', N'Void' UNION ALL
		SELECT N'DocumentStatus_Deals_Contact_Made', N'Contact Made' UNION ALL
		SELECT N'DocumentStatus_Deals_Lead_In', N'Lead In' UNION ALL
		SELECT N'DocumentStatus_Deals_Negotiation', N'Negotiation' UNION ALL
		SELECT N'DocumentStatus_Deals_Prospect', N'Prospect' UNION ALL
		SELECT N'DocumentStatus_Deals_Proposal', N'Proposal' UNION ALL
		SELECT N'DocumentStatus_Contract_Sue', N'Sue' UNION ALL
		SELECT N'DocumentStatus_Contract_Active', N'Active' UNION ALL
		SELECT N'DocumentStatus_SalesOrder_Draft', N'Draft' UNION ALL
		SELECT N'DocumentStatus_SalesOrder_Void', N'Void' UNION ALL
		SELECT N'DocumentStatus_SalesOrder_Active', N'Active' UNION ALL
		SELECT N'DocumentStatus_SalesOrder_Finalized', N'Finalized' UNION ALL
		SELECT N'DocumentStatus_SalesOrder_Fulfilled', N'Fulfilled' UNION ALL
		SELECT N'DocumentStatus_SalesOrder_Deleted', N'Deleted' UNION ALL
		SELECT N'DocumentStatus_TransferOrders_Pending', N'Pending' UNION ALL
		SELECT N'DocumentStatus_TransferOrders_Approved', N'Approved' UNION ALL
		SELECT N'DocumentStatus_TransferOrders_Confirmed', N'Confirmed' UNION ALL
		SELECT N'DocumentStatus_TransferOrders_Finalized', N'Finalized' UNION ALL
		SELECT N'DocumentStatus_TransferOrders_Void', N'Void' UNION ALL
		SELECT N'DocumentStatus_Invoice_Paid', N'Paid' UNION ALL
		SELECT N'DocumentStatus_Invoice_Unpaid', N'Unpaid' UNION ALL
		SELECT N'DocumentStatus_Invoice_Partial', N'Partial' UNION ALL
		SELECT N'DocumentStatus_PurchaseOrder_Active', N'Active' UNION ALL
		SELECT N'DocumentStatus_PurchaseOrder_Received', N'Received' UNION ALL
		SELECT N'DocumentStatus_Shipment_Shipped', N'Shipped' UNION ALL
		SELECT N'DocumentStatus_Shipment_Unshipped', N'Unshipped' UNION ALL
		SELECT N'DocumentStatus_Shipment_Partial', N'Partial' UNION ALL
		SELECT N'DocumentStatus_Invoice_Sent', N'Sent' UNION ALL
		SELECT N'DocumentStatus_SalesOrder_Cancelled', N'Cancelled' UNION ALL
		SELECT N'DocumentStatus_SalesOrder_OnHold', N'On Hold' UNION ALL
		SELECT N'DocumentStatus_Quote_Draft', N'Draft' UNION ALL
		SELECT N'DocumentStatus_Quote_Void', N'Void' UNION ALL
		SELECT N'DocumentStatus_Quote_Pending', N'Pending' UNION ALL
		SELECT N'DocumentStatus_Quote_Approved', N'Approved' UNION ALL
		SELECT N'DocumentStatus_Quote_Sent', N'Sent' UNION ALL
		SELECT N'DocumentStatus_Quote_Unsucessful', N'Unsucessful' UNION ALL
		SELECT N'DocumentStatus_ProductionOrder_Draft', N'Draft' UNION ALL
		SELECT N'DocumentStatus_ProductionOrder_Scheduled', N'Scheduled' UNION ALL
		SELECT N'DocumentStatus_ProductionOrder_InProgress', N'In progress' UNION ALL
		SELECT N'DocumentStatus_ProductionOrder_Paused', N'Paused' UNION ALL
		SELECT N'DocumentStatus_ProductionOrder_Fulfilled', N'Fulfilled' UNION ALL
		SELECT N'DocumentStatus_ProductionOrder_Shipped', N'Shipped' UNION ALL
		SELECT N'DocumentStatus_ProductionOrder_Closed', N'Closed' UNION ALL
		SELECT N'DocumentStatus_ProductionOrder_Cancelled', N'Cancelled'
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
