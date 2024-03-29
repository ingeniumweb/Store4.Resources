/*=CONCATENATE("SELECT N'";A1;"', N'";B1;"', N'";B1;"' UNION ALL")*/
DECLARE @ResourcesTable TABLE (Name VARCHAR (128), Value NVARCHAR (MAX), [Description] NVARCHAR (MAX))

DECLARE @ResourceID INT, @ResourceTypeID INT, @LanguageID INT
DECLARE @Name VARCHAR (128), @Value NVARCHAR (MAX), @Description NVARCHAR (MAX)

SET @ResourceTypeID = NULL
SELECT TOP 1 @ResourceTypeID = ResourceTypeID FROM ResourceTypes WHERE Name = 'LookupResources'
SET @ResourceTypeID = ISNULL (@ResourceTypeID, 0)

SET @LanguageID = NULL
SELECT TOP 1 @LanguageID = LanguageID FROM Languages WHERE CultureName = 'hr-HR' --AND IsEnabled = 1
SET @LanguageID = ISNULL(@LanguageID, 0)

IF (@ResourceTypeID > 0 AND @LanguageID > 0) BEGIN
	INSERT INTO @ResourcesTable (Name, Value, [Description])
		SELECT N'Email_Drafts', N'Nacrti', N'Drafts' UNION ALL
		SELECT N'Email_Important', N'Važno', N'Important' UNION ALL
		SELECT N'Email_Inbox', N'Dolazna pošta', N'Inbox' UNION ALL
		SELECT N'Email_Sent', N'Poslano', N'Sent' UNION ALL
		SELECT N'Email_Spam', N'Spam', N'Spam' UNION ALL
		SELECT N'Email_Trash', N'Smeće', N'Trash' UNION ALL
		SELECT N'EmailSendType_Bcc', N'Bcc', N'Bcc' UNION ALL
		SELECT N'EmailSendType_Cc', N'Cc', N'Cc' UNION ALL
		SELECT N'EmailSendType_From', N'Od', N'From' UNION ALL
		SELECT N'EmailSendType_To', N'Prema', N'To' UNION ALL
		SELECT N'FriendStatus_Facebook', N'Facebook', N'Facebook' UNION ALL
		SELECT N'FriendStatus_Friend', N'Prijatelj', N'Friend' UNION ALL
		SELECT N'FriendStatus_Google', N'Google', N'Google' UNION ALL
		SELECT N'FriendStatus_Invite', N'Pozivnica', N'Invite' UNION ALL
		SELECT N'FriendStatus_LinkedIn', N'LinkedIn', N'LinkedIn' UNION ALL
		SELECT N'FriendStatus_Subscriber', N'Pretplatnik', N'Subscriber' UNION ALL
		SELECT N'FriendStatus_Twitter', N'Twitter', N'Twitter' UNION ALL
		SELECT N'CompanyIndustry_Accounting', N'Računovodstvo', N'Accounting' UNION ALL
		SELECT N'CompanyIndustry_AirlinesAviation', N'Avioni/Zrakoplovstvo', N'Airlines/Aviation' UNION ALL
		SELECT N'CompanyIndustry_AlternativeDisputeResolution', N'Alternativno rješavanje sporova', N'Alternative Dispute Resolution' UNION ALL
		SELECT N'CompanyIndustry_AlternativeMedicine', N'Alternativna Medicina', N'Alternative Medicine' UNION ALL
		SELECT N'CompanyIndustry_Animation', N'Animacija', N'Animation' UNION ALL
		SELECT N'CompanyIndustry_ApparelFashion', N'Odjeća i moda', N'Apparel & Fashion' UNION ALL
		SELECT N'CompanyIndustry_ArchitecturePlanning', N'Arhitektura i planiranje', N'Architecture & Planning' UNION ALL
		SELECT N'CompanyIndustry_ArtsCrafts', N'Umjetnost i obrt', N'Arts & Crafts' UNION ALL
		SELECT N'CompanyIndustry_Automotive', N'Automobilska industrija', N'Automotive' UNION ALL
		SELECT N'CompanyIndustry_AviationAerospace', N'Zrakoplovstvo i zračni prostor', N'Aviation & Aerospace' UNION ALL
		SELECT N'CompanyIndustry_Banking', N'Bankarstvo', N'Banking' UNION ALL
		SELECT N'CompanyIndustry_Biotechnology', N'Biotehnologija', N'Biotechnology' UNION ALL
		SELECT N'CompanyIndustry_BroadcastMedia', N'Medija za emitiranje', N'Broadcast Media' UNION ALL
		SELECT N'CompanyIndustry_BuildingMaterials', N'Građevinski materijal', N'Building Materials' UNION ALL
		SELECT N'CompanyIndustry_BusinessSuppliesEquipment', N'Poslovni dobavljači i oprema', N'Business Supplies & Equipment' UNION ALL
		SELECT N'CompanyIndustry_CapitalMarkets', N'Tržište kapitala', N'Capital Markets' UNION ALL
		SELECT N'CompanyIndustry_Chemicals', N'Kemijska industrija', N'Chemicals' UNION ALL
		SELECT N'CompanyIndustry_CivicSocialOrganization', N'Građanska i društvena organizacija', N'Civic & Social Organization' UNION ALL
		SELECT N'CompanyIndustry_CivilEngineering', N'Niskogradnja', N'Civil Engineering' UNION ALL
		SELECT N'CompanyIndustry_CommercialRealEstate', N'Komercijalne nekretnine', N'Commercial Real Estate' UNION ALL
		SELECT N'CompanyIndustry_ComputerNetworkSecurity', N'Računalna i mrežna sigurnost', N'Computer & Network Security' UNION ALL
		SELECT N'CompanyIndustry_ComputerGames', N'Računalne igre', N'Computer Games' UNION ALL
		SELECT N'CompanyIndustry_ComputerHardware', N'Računalna oprema', N'Computer Hardware' UNION ALL
		SELECT N'CompanyIndustry_ComputerNetworking', N'Umrežavanje računala', N'Computer Networking' UNION ALL
		SELECT N'CompanyIndustry_ComputerSoftware', N'Računalni programi', N'Computer Software' UNION ALL
		SELECT N'CompanyIndustry_Construction', N'Građevina', N'Construction' UNION ALL
		SELECT N'CompanyIndustry_ConsumerElectronics', N'Potrošačka elektronika', N'Consumer Electronics' UNION ALL
		SELECT N'CompanyIndustry_ConsumerGoods', N'Potrošačka dobra', N'Consumer Goods' UNION ALL
		SELECT N'CompanyIndustry_ConsumerServices', N'Potrošačke usluge', N'Consumer Services' UNION ALL
		SELECT N'CompanyIndustry_Cosmetics', N'Kozmetika', N'Cosmetics' UNION ALL
		SELECT N'CompanyIndustry_Dairy', N'Mlječna industrija', N'Dairy' UNION ALL
		SELECT N'CompanyIndustry_DefenseSpace', N'Obrana i svemir', N'Defense & Space' UNION ALL
		SELECT N'CompanyIndustry_Design', N'Dizajn', N'Design' UNION ALL
		SELECT N'CompanyIndustry_EducationManagement', N'Obrazovanje za upravljanje', N'Education Management' UNION ALL
		SELECT N'CompanyIndustry_E_learning', N'E-učenje', N'E-learning' UNION ALL
		SELECT N'CompanyIndustry_ElectricalElectronicManufacturing', N'Električna i elektronska proizvodnja', N'Electrical & Electronic Manufacturing' UNION ALL
		SELECT N'CompanyIndustry_Entertainment', N'Zabava', N'Entertainment' UNION ALL
		SELECT N'CompanyIndustry_EnvironmentalServices', N'Usluge zaštite okoliša', N'Environmental Services' UNION ALL
		SELECT N'CompanyIndustry_EventsServices', N'Organiziranje evenata', N'Events Services' UNION ALL
		SELECT N'CompanyIndustry_ExecutiveOffice', N'Izvršni ured', N'Executive Office' UNION ALL
		SELECT N'CompanyIndustry_FacilitiesServices', N'Uslužni objekti', N'Facilities Services' UNION ALL
		SELECT N'CompanyIndustry_Farming', N'Poljoprivreda', N'Farming' UNION ALL
		SELECT N'CompanyIndustry_FinancialServices', N'Financijske usluge', N'Financial Services' UNION ALL
		SELECT N'CompanyIndustry_FineArt', N'Lijepa umjetnost', N'Fine Art' UNION ALL
		SELECT N'CompanyIndustry_Fishery', N'Ribolovstvo', N'Fishery' UNION ALL
		SELECT N'CompanyIndustry_FoodBeverages', N'Hrana i piće', N'Food & Beverages' UNION ALL
		SELECT N'CompanyIndustry_FoodProduction', N'Proizvodnja hrane', N'Food Production' UNION ALL
		SELECT N'CompanyIndustry_Fundraising', N'Prikupljanje sredstava', N'Fundraising' UNION ALL
		SELECT N'CompanyIndustry_Furniture', N'Namještaj', N'Furniture' UNION ALL
		SELECT N'CompanyIndustry_GamblingCasinos', N'Kockanje i kasina', N'Gambling & Casinos' UNION ALL
		SELECT N'CompanyIndustry_GlassCeramicsConcrete', N'Staklo, keramika i beton', N'Glass, Ceramics & Concrete' UNION ALL
		SELECT N'CompanyIndustry_GovernmentAdministration', N'Uprava', N'Government Administration' UNION ALL
		SELECT N'CompanyIndustry_GovernmentRelations', N'Odnosi s javnošću kod uprava/vladinih institucija', N'Government Relations' UNION ALL
		SELECT N'CompanyIndustry_GraphicDesign', N'Grafički dizajn', N'Graphic Design' UNION ALL
		SELECT N'CompanyIndustry_HealthWellnessFitness', N'Zdravlje, wellness i fitness', N'Health, Wellness & Fitness' UNION ALL
		SELECT N'CompanyIndustry_HigherEducation', N'Visoko obrazovanje', N'Higher Education' UNION ALL
		SELECT N'CompanyIndustry_HospitalHealthCare', N'Bolničke i zdrastvene usluge', N'Hospital & Health Care' UNION ALL
		SELECT N'CompanyIndustry_Hospitality', N'Hoteljerstvo', N'Hospitality' UNION ALL
		SELECT N'CompanyIndustry_HumanResources', N'Ljudski resursi', N'Human Resources' UNION ALL
		SELECT N'CompanyIndustry_ImportExport', N'Uvoz i izvoz', N'Import & Export' UNION ALL
		SELECT N'CompanyIndustry_IndividualFamilyServices', N'Individualne i obiteljske usluge', N'Individual & Family Services' UNION ALL
		SELECT N'CompanyIndustry_IndustrialAutomation', N'Industrijska automatizacija', N'Industrial Automation' UNION ALL
		SELECT N'CompanyIndustry_InformationServices', N'Informacijske usluge', N'Information Services' UNION ALL
		SELECT N'CompanyIndustry_InformationTechnologyServices', N'Informacijska tehnologija i usluge', N'Information Technology & Services' UNION ALL
		SELECT N'CompanyIndustry_Insurance', N'Osiguravajuća kuća', N'Insurance' UNION ALL
		SELECT N'CompanyIndustry_InternationalAffairs', N'Međunarodni poslovi', N'International Affairs' UNION ALL
		SELECT N'CompanyIndustry_InternationalTradeDevelopment', N'Međunarodna trgovina i razvoj', N'International Trade & Development' UNION ALL
		SELECT N'CompanyIndustry_Internet', N'Internet', N'Internet' UNION ALL
		SELECT N'CompanyIndustry_InvestmentBankingVenture', N'Investicijsko bankarstvo', N'Investment Banking/Venture' UNION ALL
		SELECT N'CompanyIndustry_InvestmentManagement', N'Upravljanje investicijama', N'Investment Management' UNION ALL
		SELECT N'CompanyIndustry_Judiciary', N'Pravosuđe', N'Judiciary' UNION ALL
		SELECT N'CompanyIndustry_LawEnforcement', N'Policija', N'Law Enforcement' UNION ALL
		SELECT N'CompanyIndustry_LawPractice', N'Odvjetništvo', N'Law Practice' UNION ALL
		SELECT N'CompanyIndustry_LegalServices', N'Pravne usluge', N'Legal Services' UNION ALL
		SELECT N'CompanyIndustry_LegislativeOffice', N'Ured za zakonodavstvo', N'Legislative Office' UNION ALL
		SELECT N'CompanyIndustry_LeisureTravel', N'Slobodno vrijeme i putovanje', N'Leisure & Travel' UNION ALL
		SELECT N'CompanyIndustry_Libraries', N'Knjižnice', N'Libraries' UNION ALL
		SELECT N'CompanyIndustry_LogisticsSupplyChain', N'Logistika i dobavljanje', N'Logistics & Supply Chain' UNION ALL
		SELECT N'CompanyIndustry_LuxuryGoodsJewelry', N'Skupocjena dobra i nakit', N'Luxury Goods & Jewelry' UNION ALL
		SELECT N'CompanyIndustry_Machinery', N'Strojevi', N'Machinery' UNION ALL
		SELECT N'CompanyIndustry_ManagementConsulting', N'Poslovno savjetovanje', N'Management Consulting' UNION ALL
		SELECT N'CompanyIndustry_Maritime', N'Pomorstvo', N'Maritime' UNION ALL
		SELECT N'CompanyIndustry_MarketResearch', N'Istraživanje tržišta', N'Market Research' UNION ALL
		SELECT N'CompanyIndustry_MarketingAdvertising', N'Oglašavanje', N'Marketing & Advertising' UNION ALL
		SELECT N'CompanyIndustry_MechanicalorIndustrialEngineering', N'Mehaničko ili industrijsko inženjerstvo', N'Mechanical or Industrial Engineering' UNION ALL
		SELECT N'CompanyIndustry_MediaProduction', N'Produkcija', N'Media Production' UNION ALL
		SELECT N'CompanyIndustry_MedicalDevice', N'Medicinski uređaji', N'Medical Device' UNION ALL
		SELECT N'CompanyIndustry_MedicalPractice', N'Medicinska praksa', N'Medical Practice' UNION ALL
		SELECT N'CompanyIndustry_MentalHealthCare', N'Mentalno zdravlje', N'Mental Health Care' UNION ALL
		SELECT N'CompanyIndustry_Military', N'Vojska', N'Military' UNION ALL
		SELECT N'CompanyIndustry_MiningMetals', N'Rudarstvo i metalurgija', N'Mining & Metals' UNION ALL
		SELECT N'CompanyIndustry_MotionPicturesFilm', N'Pokretne slike i film', N'Motion Pictures & Film' UNION ALL
		SELECT N'CompanyIndustry_MuseumsInstitutions', N'Muzeji i institucije', N'Museums & Institutions' UNION ALL
		SELECT N'CompanyIndustry_Music', N'Glazba', N'Music' UNION ALL
		SELECT N'CompanyIndustry_Nanotechnology', N'Nanotehnologija', N'Nanotechnology' UNION ALL
		SELECT N'CompanyIndustry_Newspapers', N'Izdavaštvo', N'Newspapers' UNION ALL
		SELECT N'CompanyIndustry_NonprofitOrganizationManagement', N'Upravljanje neprofitabilnim organizacijama', N'Nonprofit Organization Management' UNION ALL
		SELECT N'CompanyIndustry_OilEnergy', N'Nafta i energija', N'Oil & Energy' UNION ALL
		SELECT N'CompanyIndustry_OnlinePublishing', N'Online izdavaštvo', N'Online Publishing' UNION ALL
		SELECT N'CompanyIndustry_OutsourcingOffshoring', N'Outsourcing/Offshoring', N'Outsourcing/Offshoring' UNION ALL
		SELECT N'CompanyIndustry_PackageFreightDelivery', N'Dostava paketa/tereta', N'Package/Freight Delivery' UNION ALL
		SELECT N'CompanyIndustry_PackagingContainers', N'Pakiranje i spremnici', N'Packaging & Containers' UNION ALL
		SELECT N'CompanyIndustry_PaperForestProducts', N'Papir i šumski proizvodi', N'Paper & Forest Products' UNION ALL
		SELECT N'CompanyIndustry_PerformingArts', N'Izvedbena umjetnost', N'Performing Arts' UNION ALL
		SELECT N'CompanyIndustry_Pharmaceuticals', N'Lijekovi', N'Pharmaceuticals' UNION ALL
		SELECT N'CompanyIndustry_Philanthropy', N'Filantropija', N'Philanthropy' UNION ALL
		SELECT N'CompanyIndustry_Photography', N'Fotografija', N'Photography' UNION ALL
		SELECT N'CompanyIndustry_Plastics', N'Plastika', N'Plastics' UNION ALL
		SELECT N'CompanyIndustry_PoliticalOrganization', N'Politička organizacija', N'Political Organization' UNION ALL
		SELECT N'CompanyIndustry_PrimarySecondary', N'Primarni/Sekundarni', N'Primary/Secondary' UNION ALL
		SELECT N'CompanyIndustry_Printing', N'Tiskanje', N'Printing' UNION ALL
		SELECT N'CompanyIndustry_ProfessionalTraining', N'Profesionalni trening', N'Professional Training' UNION ALL
		SELECT N'CompanyIndustry_ProgramDevelopment', N'Razvojni program', N'Program Development' UNION ALL
		SELECT N'CompanyIndustry_PublicPolicy', N'Javna politika', N'Public Policy' UNION ALL
		SELECT N'CompanyIndustry_PublicRelations', N'Odnosi s javnošću', N'Public Relations' UNION ALL
		SELECT N'CompanyIndustry_PublicSafety', N'Javna sigurnost', N'Public Safety' UNION ALL
		SELECT N'CompanyIndustry_Publishing', N'Objavljivanje', N'Publishing' UNION ALL
		SELECT N'CompanyIndustry_RailroadManufacture', N'Željeznice', N'Railroad Manufacture' UNION ALL
		SELECT N'CompanyIndustry_Ranching', N'Uzgoj stoke', N'Ranching' UNION ALL
		SELECT N'CompanyIndustry_RealEstate', N'Nekretnina', N'Real Estate' UNION ALL
		SELECT N'CompanyIndustry_RecreationalFacilitiesServices', N'Rekreacijski sadržaji i usluge', N'Recreational Facilities & Services' UNION ALL
		SELECT N'CompanyIndustry_ReligiousInstitutions', N'Vjerske institucije', N'Religious Institutions' UNION ALL
		SELECT N'CompanyIndustry_RenewablesEnvironment', N'Obnovljivi izvori i okoliš', N'Renewables & Environment' UNION ALL
		SELECT N'CompanyIndustry_Research', N'Istraživanje', N'Research' UNION ALL
		SELECT N'CompanyIndustry_Restaurants', N'Restorani', N'Restaurants' UNION ALL
		SELECT N'CompanyIndustry_Retail', N'Maloprodaja', N'Retail' UNION ALL
		SELECT N'CompanyIndustry_SecurityInvestigations', N'Sigurnost i istraživanja', N'Security & Investigations' UNION ALL
		SELECT N'CompanyIndustry_Semiconductors', N'Poluvodiči', N'Semiconductors' UNION ALL
		SELECT N'CompanyIndustry_Shipbuilding', N'Brodogradnja', N'Shipbuilding' UNION ALL
		SELECT N'CompanyIndustry_SportingGoods', N'Sportska oprema', N'Sporting Goods' UNION ALL
		SELECT N'CompanyIndustry_Sports', N'Sportovi', N'Sports' UNION ALL
		SELECT N'CompanyIndustry_StaffingRecruiting', N'Kadroviranje i zapošljavanje', N'Staffing & Recruiting' UNION ALL
		SELECT N'CompanyIndustry_Supermarkets', N'Supermarketi', N'Supermarkets' UNION ALL
		SELECT N'CompanyIndustry_Telecommunications', N'Telekomunikacije', N'Telecommunications' UNION ALL
		SELECT N'CompanyIndustry_Textiles', N'Tekstilna industrija', N'Textiles' UNION ALL
		SELECT N'CompanyIndustry_ThinkTanks', N'Strateško promišljanje', N'Think Tanks' UNION ALL
		SELECT N'CompanyIndustry_Tobacco', N'Duhanska industrija', N'Tobacco' UNION ALL
		SELECT N'CompanyIndustry_TranslationLocalization', N'Prevođenje & Lokalizacija', N'Translation & Localization' UNION ALL
		SELECT N'CompanyIndustry_TransportationTruckingRailroad', N'Prijevoz/ Kamioni / Željeznica', N'Transportation/Trucking/Railroad' UNION ALL
		SELECT N'CompanyIndustry_Utilities', N'Komunalne usluge', N'Utilities' UNION ALL
		SELECT N'CompanyIndustry_VentureCapital', N'Investicijski kapital', N'Venture Capital' UNION ALL
		SELECT N'CompanyIndustry_Veterinary', N'Veterinarstvo', N'Veterinary' UNION ALL
		SELECT N'CompanyIndustry_Warehousing', N'Skladištenje', N'Warehousing' UNION ALL
		SELECT N'CompanyIndustry_Wholesale', N'Veleprodaja', N'Wholesale' UNION ALL
		SELECT N'CompanyIndustry_WineSpirits', N'Pića i osvježenja', N'Wine & Spirits' UNION ALL
		SELECT N'CompanyIndustry_Wireless', N'Bežični internet', N'Wireless' UNION ALL
		SELECT N'CompanyIndustry_WritingEditing', N'Pisanje i uređivanje', N'Writing & Editing' UNION ALL
		SELECT N'CompanyType_Customer', N'Klijent', N'Customer' UNION ALL
		SELECT N'CompanyType_Other', N'Drugo', N'Other' UNION ALL
		SELECT N'CompanyType_Partner', N'Partner', N'Partner' UNION ALL
		SELECT N'CompanyType_Prospect', N'Potencijalni klijent', N'Prospect' UNION ALL
		SELECT N'CompanyType_Reseller', N'Prodavač', N'Reseller' UNION ALL
		SELECT N'CompanyType_Supplier', N'Dobavljač', N'Supplier' UNION ALL
		SELECT N'CompanyType_Vendor', N'Klijent', N'Vendor' UNION ALL
		SELECT N'CompanyAccountType_Basic', N'Osnovni', N'Basic' UNION ALL
		SELECT N'CompanyAccountType_Elite', N'Elite', N'Elite' UNION ALL
		SELECT N'CompanyAccountType_Premium', N'Premium', N'Premium' UNION ALL
		SELECT N'CompanySize_10000', N'10000+', N'10000+' UNION ALL
		SELECT N'CompanySize_1001_5000', N'1001-5000', N'1001-5000' UNION ALL
		SELECT N'CompanySize_101_200', N'101-200', N'101-200' UNION ALL
		SELECT N'CompanySize_11_50', N'11-50', N'11-50' UNION ALL
		SELECT N'CompanySize_201_500', N'201-500', N'201-500' UNION ALL
		SELECT N'CompanySize_2_10', N'2-10', N'2-10' UNION ALL
		SELECT N'CompanySize_5001_10000', N'5001-10000', N'5001-10000' UNION ALL
		SELECT N'CompanySize_501_1000', N'501-1000', N'501-1000' UNION ALL
		SELECT N'CompanySize_51_100', N'51-100', N'51-100' UNION ALL
		SELECT N'CompanySize_OnlyMyself', N'Samostalna djelatnost', N'Only Myself' UNION ALL
		SELECT N'CompanyOperatingStatus_Acquired', N'Stečena', N'Acquired' UNION ALL
		SELECT N'CompanyOperatingStatus_Operating', N'U radu', N'Operating' UNION ALL
		SELECT N'CompanyOperatingStatus_OperatingSubsidiary', N'Operativna podružnica', N'Operating Subsidiary' UNION ALL
		SELECT N'CompanyOperatingStatus_OutofBusiness', N'Izvan poslovanja', N'Out of Business' UNION ALL
		SELECT N'CompanyOperatingStatus_Reorganizing', N'Restruktura', N'Reorganizing' UNION ALL
		SELECT N'CouponType_PercentageDiscount', N'Postotak popusta na ukupnu cijenu', N'Percentage Discount' UNION ALL
		SELECT N'CouponType_FixedCartDiscount', N'Fiksni popust na ukupnu cijenu', N'Fixed Cart Discount' UNION ALL
		SELECT N'CouponType_FixedProductDiscount', N'Fiksni popust na cijenu proizvoda', N'Fixed Product Discount' UNION ALL
		SELECT N'EmailAccountType_IMAP', N'IMAP', N'IMAP' UNION ALL
		SELECT N'EmailAccountType_POP3', N'POP3', N'POP3' UNION ALL
		SELECT N'EmailEncryptionType_None', N'Nijedan', N'None' UNION ALL
		SELECT N'EmailEncryptionType_SSL', N'SSL', N'SSL' UNION ALL
		SELECT N'EmailEncryptionType_TLS', N'TLS', N'TLS' UNION ALL
		SELECT N'MediaNiche_Casino', N'Casino', N'Casino Niche' UNION ALL
		SELECT N'MediaNiche_Cbd', N'CBD', N'CBD Niche' UNION ALL
		SELECT N'MediaNiche_Crypto', N'Crypto', N'Crypto Niche' UNION ALL
		SELECT N'MediaNiche_Dating', N'Upoznavanje', N'Dating Niche' UNION ALL
		SELECT N'MediaNiche_Erotic', N'Erotika', N'Erotic Niche' UNION ALL
		SELECT N'MediaNiche_Loan', N'Pozajmice', N'Loan Niche' UNION ALL
		SELECT N'CommentAction_Approved', N'Odobreno', N'Approved' UNION ALL
		SELECT N'CommentAction_Spam', N'Spam', N'Spam' UNION ALL
		SELECT N'CommentAction_Trash', N'Smeće', N'Trash' UNION ALL
		SELECT N'CommentAction_Unnaproved', N'Neodobreno', N'Unnaproved' UNION ALL
		SELECT N'DueDayType_DaysAfterTheInvoice', N'dan(a) nakon računa', N'day(s) after the invoice' UNION ALL
		SELECT N'DueDayType_OfTheFollowingMonth', N'sljedećeg kalendarskog mjeseca',  N'of the following month' UNION ALL
		SELECT N'DueDayType_DaysAfterTheEndOfTheInvoiceMonth', N'dan(a) početkom sljedećeg kalendarskog mjeseca', N'day(s) after the end of the invoice month' UNION ALL
		SELECT N'DueDayType_OfTheCurrentMonth', N'tekućeg kalendarskog mjeseca', N'of the current month' UNION ALL
		SELECT N'Tasks_Daily', N'Dnevno', N'Daily' UNION ALL
		SELECT N'Tasks_Interval', N'Interval', N'Interval' UNION ALL
		SELECT N'Tasks_Monthly', N'Mjesečno', N'Monthly' UNION ALL
		SELECT N'Tasks_Once', N'Jednom', N'Once' UNION ALL
		SELECT N'Tasks_Weekly', N'Tjedno', N'Weekly' UNION ALL
		SELECT N'Tasks_Yearly', N'Godišnje', N'Yearly' UNION ALL
		SELECT N'PaymentType_BankTransfer', N'Virmansko plaćanje', N'Bank Transfer' UNION ALL
		SELECT N'PaymentType_Cheque', N'Ček', N'Cheque' UNION ALL
		SELECT N'PaymentType_CreditCard', N'Kreditna kartica', N'Credit Card' UNION ALL
		SELECT N'PaymentType_PayPal', N'PayPal', N'PayPal' UNION ALL
		SELECT N'PaymentType_StandingOrder', N'Trajni nalog', N'Standing Order' UNION ALL
		SELECT N'ProjectType_Bug', N'Bug', N'Bug' UNION ALL
		SELECT N'ProjectType_Idea', N'Ideja', N'Idea' UNION ALL
		SELECT N'ProjectType_Task', N'Zadatak', N'Task' UNION ALL
		SELECT N'ProjectPriority_High', N'Visok', N'High' UNION ALL
		SELECT N'ProjectPriority_Low', N'Nizak', N'Low' UNION ALL
		SELECT N'ProjectPriority_Medium', N'Srednji', N'Medium' UNION ALL
		SELECT N'ProjectPriority_None', N'Nijedan', N'None' UNION ALL
		SELECT N'ProjectPriority_VeryHigh', N'Vrlo visoko', N'Very High' UNION ALL
		SELECT N'ProjectPriority_VeryLow', N'Vrlo nisko', N'Very Low' UNION ALL
		SELECT N'ProjectStatus_Active', N'Aktivan', N'Active' UNION ALL
		SELECT N'ProjectStatus_Cancelled', N'Otkazan', N'Cancelled' UNION ALL
		SELECT N'ProjectStatus_Completed', N'Završen', N'Completed' UNION ALL
		SELECT N'ProjectStatus_InProgress', N'U tijeku', N'In Progress' UNION ALL
		SELECT N'ProjectStatus_InReview', N'U pregledu', N'In Review' UNION ALL
		SELECT N'ProjectStatus_Paused', N'Pauza', N'Paused' UNION ALL
		SELECT N'ProjectStatus_Planned', N'U planu', N'Planned' UNION ALL
		SELECT N'Database_MSSQL', N'MSSQL', N'MSSQL' UNION ALL
		SELECT N'Database_MySQL', N'MySQL', N'MySQL' UNION ALL
		SELECT N'Database_PostgreSQL', N'PostgreSQL', N'PostgreSQL' UNION ALL
		SELECT N'Server_Linux', N'Linux', N'Linux' UNION ALL
		SELECT N'Server_Windows', N'Windows', N'Windows' UNION ALL
		SELECT N'PaymentGateway_Braintree', N'Braintree', N'Braintree' UNION ALL
		SELECT N'PaymentGateway_PayPal', N'PayPal', N'PayPal' UNION ALL
		SELECT N'PaymentGateway_Stripe', N'Stripe', N'Stripe' UNION ALL
		SELECT N'PaymentGateway_WSpayForm', N'WSpayForm', N'WSpayForm' UNION ALL
		SELECT N'ContactType_Client', N'Klijent', N'Client' UNION ALL
		SELECT N'ContactType_Friend', N'Prijatelj', N'Friend' UNION ALL
		SELECT N'ContactType_Lead', N'Potencijalni klijent', N'Lead' UNION ALL
		SELECT N'ContactType_Prospect', N'Očekivani klijent', N'Prospect' UNION ALL
		SELECT N'ProductSubscriptionType_Basic', N'Osnovno', N'Basic' UNION ALL
		SELECT N'ProductSubscriptionType_Enterprise', N'Enterprise', N'Enterprise' UNION ALL
		SELECT N'ProductSubscriptionType_Premium', N'Premium', N'Premium' UNION ALL
		SELECT N'RenewalPeriod_Days', N'Dan(a)', N'Day(s)'  UNION ALL
		SELECT N'RenewalPeriod_Weeks', N'Tjedan(a)', N'Week(s)'  UNION ALL
		SELECT N'RenewalPeriod_Months', N'Mjesec(i)', N'Month(s)' UNION ALL
		SELECT N'RenewalPeriod_Years', N'Godina(a)', N'Year(s)' UNION ALL
		SELECT N'SubscriptionTypePeriod_Monthly', N'Mjesečno', N'Monthly' UNION ALL
		SELECT N'SubscriptionTypePeriod_Yearly', N'Godišnje', N'Yearly' UNION ALL
		SELECT N'ContentType_Product', N'Proizvod', N'Product' UNION ALL
		SELECT N'ContentType_Company', N'Tvrtka', N'Company' UNION ALL
		SELECT N'DocumentStatus_Contract_Expired', N'Istekao', N'Expired' UNION ALL
		SELECT N'DocumentStatus_Contract_OnHold', N'Na čekanju', N'OnHold' UNION ALL
		SELECT N'DocumentStatus_Contract_Fulfilled', N'Ispunjeno', N'Fulfilled' UNION ALL
		SELECT N'DocumentStatus_Contract_Finalized', N'Završeno', N'Finalized' UNION ALL
		SELECT N'DocumentStatus_Contract_Cancelled', N'Raskinuto', N'Cancelled' UNION ALL
		SELECT N'DocumentStatus_Contract_Void', N'Stornirano', N'Void' UNION ALL
		SELECT N'DocumentStatus_Deals_Contact_Made', N'Kontaktiran', N'Contact Made' UNION ALL
		SELECT N'DocumentStatus_Deals_Lead_In', N'Potencijalni Klijent', N'Lead In' UNION ALL
		SELECT N'DocumentStatus_Deals_Negotiation', N'Pregovori', N'Negotiation' UNION ALL
		SELECT N'DocumentStatus_Deals_Prospect', N'Zainteresiran', N'Prospect' UNION ALL
		SELECT N'DocumentStatus_Deals_Proposal', N'Ponuda Poslana', N'Proposal' UNION ALL
		SELECT N'DocumentStatus_Contract_Sue', N'Tužba', N'Sue' UNION ALL
		SELECT N'DocumentStatus_Contract_Active', N'Aktivno', N'Active' UNION ALL
		SELECT N'DocumentStatus_SalesOrder_Draft', N'Skica', N'Draft' UNION ALL
		SELECT N'DocumentStatus_SalesOrder_Void', N'Stornirano', N'Void' UNION ALL
		SELECT N'DocumentStatus_SalesOrder_Active', N'Aktivno', N'Active' UNION ALL
		SELECT N'DocumentStatus_SalesOrder_Finalized', N'Završeno', N'Finalized' UNION ALL
		SELECT N'DocumentStatus_SalesOrder_Fulfilled', N'Ispunjeno', N'Fulfilled' UNION ALL
		SELECT N'DocumentStatus_SalesOrder_Deleted', N'Obrisano', N'Deleted' UNION ALL
		SELECT N'DocumentStatus_TransferOrders_Pending', N'U pripremi ', N'Deleted' UNION ALL
		SELECT N'DocumentStatus_TransferOrders_Approved', N'Odobreno', N'Deleted' UNION ALL
		SELECT N'DocumentStatus_TransferOrders_Confirmed', N'Potvrđeno', N'Deleted' UNION ALL
		SELECT N'DocumentStatus_TransferOrders_Finalized', N'Završeno', N'Deleted' UNION ALL
		SELECT N'DocumentStatus_TransferOrders_Void', N'Stornirano', N'Deleted' UNION ALL
		SELECT N'DocumentStatus_Invoice_Paid', N'Plaćeno', N'Paid' UNION ALL
		SELECT N'DocumentStatus_Invoice_Unpaid', N'Neplaćeno', N'Unpaid' UNION ALL
		SELECT N'DocumentStatus_Invoice_Partial', N'Djelomično plaćeno', N'Partial' UNION ALL
		SELECT N'DocumentStatus_PurchaseOrder_Active', N'Aktivno', N'Active' UNION ALL
		SELECT N'DocumentStatus_PurchaseOrder_Received', N'Primljeno', N'Received' UNION ALL
		SELECT N'DocumentStatus_Shipment_Shipped', N'Isporučeno', N'Shipped' UNION ALL
		SELECT N'DocumentStatus_Shipment_Unshipped', N'Nije poslano', N'Unshipped' UNION ALL
		SELECT N'DocumentStatus_Shipment_Partial', N'Djelomično isporučeno', N'Partial' UNION ALL
		SELECT N'DocumentStatus_Invoice_Sent', N'Poslano', N'Sent' UNION ALL
		SELECT N'DocumentStatus_SalesOrder_Cancelled', N'Otkazano', N'Cancelled' UNION ALL
		SELECT N'DocumentStatus_SalesOrder_OnHold', N'U pripremi', N'On Hold' UNION ALL
		SELECT N'DocumentStatus_Quote_Draft', N'Skica', N'Draft' UNION ALL
		SELECT N'DocumentStatus_Quote_Void', N'Stornirano', N'Void' UNION ALL
		SELECT N'DocumentStatus_Quote_Pending', N'U pripremi', N'Pending' UNION ALL
		SELECT N'DocumentStatus_Quote_Approved', N'Odobreno', N'Approved' UNION ALL
		SELECT N'DocumentStatus_Quote_Sent', N'Poslano', N'Sent' UNION ALL
		SELECT N'DocumentStatus_Quote_Unsucessful', N'Neuspješno', N'Unsucessful' UNION ALL
		SELECT N'DocumentStatus_ProductionOrder_Draft', N'Skica', N'Draft' UNION ALL
		SELECT N'DocumentStatus_ProductionOrder_Scheduled', N'Planirano', N'Scheduled' UNION ALL
		SELECT N'DocumentStatus_ProductionOrder_InProgress', N'U tijeku', N'In progress' UNION ALL
		SELECT N'DocumentStatus_ProductionOrder_Paused', N'Pauzirano', N'Paused' UNION ALL
		SELECT N'DocumentStatus_ProductionOrder_Fulfilled', N'Ispunjeno', N'Fulfilled' UNION ALL
		SELECT N'DocumentStatus_ProductionOrder_Shipped', N'Isporučeno', N'Shipped' UNION ALL
		SELECT N'DocumentStatus_ProductionOrder_Closed', N'Zatvoreno', N'Closed' UNION ALL
		SELECT N'DocumentStatus_ProductionOrder_Cancelled', N'Otkazano', N'Cancelled'
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
