/*=CONCATENATE("SELECT N'";A1;"', N'";B1;"' UNION ALL")*/
DECLARE @ResourcesTable TABLE (Name VARCHAR (128), Value NVARCHAR (MAX), [Description] NVARCHAR (MAX))

DECLARE @ResourceID INT, @ResourceTypeID INT, @LanguageID INT
DECLARE @Name VARCHAR (128), @Value NVARCHAR (MAX), @Description NVARCHAR (MAX)

SET @ResourceTypeID = NULL
SELECT TOP 1 @ResourceTypeID = ResourceTypeID FROM ResourceTypes WHERE Name = 'AdminResources'
SET @ResourceTypeID = ISNULL (@ResourceTypeID, 0)

SET @LanguageID = NULL
SELECT TOP 1 @LanguageID = LanguageID FROM Languages WHERE CultureName = 'hr-HR' --AND IsEnabled = 1
SET @LanguageID = ISNULL(@LanguageID, 0)

IF (@ResourceTypeID > 0 AND @LanguageID > 0) BEGIN
	INSERT INTO @ResourcesTable (Name, Value, [Description])
		SELECT N'AuditEvent_Headline_Details', N'Detalji', N'Details' UNION ALL
		SELECT N'AuditEvent_Item_Added', N'Nova {0} stavka ''{1}'' s sljedećim ID-em ''{2}'' je dodana.', N'A new {0} item ''{1}'' with following ID ''{2}'' has been added.' UNION ALL
		SELECT N'AuditEvent_Item_BuiltIn', N'{0} je sistemska i nemože biti obrisana.', N'The {0} is built in and can''t be deleted.' UNION ALL
		SELECT N'AuditEvent_Item_Changed', N'{0} stavka ''{1}'' sa sljedećim ID-em ''{2}'' je promjenjena.', N'A {0} item ''{1}'' with following ID ''{2}'' has been changed.' UNION ALL
		SELECT N'AuditEvent_Item_Deleted', N'{0} stavka ''{1}'' sa sljedećim ID-em ''{2}'' je obrisana.', N'A {0} item ''{1}'' with following ID ''{2}'' has been deleted.' UNION ALL
		SELECT N'AuditEvent_Item_ItemDoesntExists', N'{0} ''{1}'' ne postoji. Molimo, osvežite {0} listu i pokušajte ponovno.', N'{0} ''{1}'' doesn''t exist. Please, refresh {0} list and try again.' UNION ALL
		SELECT N'AuditEvent_Item_ItemExists', N'Stavka sa istim imenom ''{0}'' već postoji.', N'An item with the same name ''{0}'' already exists.' UNION ALL
		SELECT N'AuditEvent_Item_ItemSpecificExists', N'{0} stavka s istim imenom {1} ''{2}'' već postoji.', N'An {0} with the same {1} ''{2}'' already exists.' UNION ALL
		SELECT N'AuditEvent_Item_NotDeleted', N'{0} stavka ''{1}'' s sljedećim ID-em ''{2}'' nije obrisana. Priloženo:', N'A {0} item ''{1}'' with following ID ''{2}'' has not been deleted. Attached fields:' UNION ALL
		SELECT N'AuditEvent_Item_Role_AssignedMemebers', N'Korisnicima su već dodjeljene ove uloge.', N'Members are already assigned to this role.' UNION ALL
		SELECT N'AuditEvent_Item_TimeZone_Changed', N'Korisnik {0} je promjenio svoju vremensku zonu na : ''{1}''.', N'A member {0} updated time zone to: ''{1}''.' UNION ALL
		SELECT N'AuditEvent_Message_ApplicationRestarded', N'Aplikacija je uspješno resetirana.', N'Application has been successfully restarted.' UNION ALL
		SELECT N'AuditEvent_Message_TempFileDeleted', N'Uspešno ste obrisali privremene datoteke.', N'Temporary files have been successfully deleted.' UNION ALL
		SELECT N'AvatarPanel_Button_FileManager', N'Upravljanje datotekama', N'File Manager' UNION ALL
		SELECT N'AvatarPanel_Button_ResetPhoto', N'Resetiraj sliku', N'Reset Photo' UNION ALL
		SELECT N'AvatarPanel_Button_SavePhoto', N'Snimi sliku', N'Save Photo' UNION ALL
		SELECT N'AvatarPanel_Button_UploadPhoto', N'Upload slike', N'Upload Photo' UNION ALL
		SELECT N'AvatarPanel_Description', N'Možete upload-ati JPG, GIF ili PNG datoteku. Datoteka mora biti manja od 4 MB.', N'You can upload a JPG, GIF or PNG file. File size limit is about 4 MB.' UNION ALL
		SELECT N'AvatarPanel_Message_Facebook', N'Autorizian preko Facebook-a.', N'Authenticated via Facebook.' UNION ALL
		SELECT N'AvatarPanel_Message_HideEncrypted', N'Ovo polje sadrži povjerljive informacije. Molimo, kliknite ovdje da uredite.', N'This field contains confidential information. Please, click here to edit.' UNION ALL
		SELECT N'AvatarPanel_Message_Twitter', N'Autorizacija preko Twitter-a.', N'Authenticated via Twitter.' UNION ALL
		SELECT N'AvatarPanel_Message_Warning', N'Samo slike su dozvoljene.', N'Only images are allowed.' UNION ALL
		SELECT N'AvatarPanel_Reset_Confirm', N'Da li ste sigurno da želite reset-irati svoj avatar?', N'Are you sure you want to reset avatar image?' UNION ALL
		SELECT N'AvatarPanel_Title', N'Uploadaj sliku', N'Upload a Photo' UNION ALL
		SELECT N'Button_Add', N'Dodaj', N'Add' UNION ALL
		SELECT N'Button_AddContact', N'Dodaj Kontakt', N'Add Contact' UNION ALL
		SELECT N'Button_AddLookupGroup', N'Dodaj novu grupu', N'Add Lookup Group' UNION ALL
		SELECT N'Button_AddNew', N'Dodaj novi', N'Add New' UNION ALL
		SELECT N'Button_AddRoles', N'Dodaj uloge', N'Add Roles' UNION ALL
		SELECT N'Button_Apply', N'Primijeni', N'Apply' UNION ALL
		SELECT N'Button_Archive', N'Arhiviraj', N'Archive' UNION ALL
		SELECT N'Button_Assign', N'Dodjeli', N'Assign' UNION ALL
		SELECT N'Button_Cancel', N'Odustani', N'Cancel' UNION ALL
		SELECT N'Button_Clear', N'Očisti', N'Clear' UNION ALL
		SELECT N'Button_Close', N'Zatvori', N'Close' UNION ALL
		SELECT N'Button_Compose', N'Sastavi', N'Compose' UNION ALL
		SELECT N'Button_Copy', N'Kopiraj', N'Copy' UNION ALL
		SELECT N'Button_Create', N'Kreiraj', N'Create' UNION ALL
		SELECT N'Button_CreateRecord', N'Kreiraj zapis', N'Create Record' UNION ALL
		SELECT N'Button_Delete', N'Obriši', N'Delete' UNION ALL
		SELECT N'Button_DeleteAll', N'Obriši sve', N'Delete All' UNION ALL
		SELECT N'Button_DeleteTempFile', N'Obriši privremene datoteke', N'Delete Temporary files' UNION ALL
		SELECT N'Button_DownloadPDF', N'Snimi kao PDF', N'Download as PDF' UNION ALL
		SELECT N'Button_Edit', N'Uredi', N'Edit' UNION ALL
		SELECT N'Button_EditGallery', N'Uredi galeriju', N'Edit Gallery' UNION ALL
		SELECT N'Button_Export', N'Izvezi', N'Export' UNION ALL
		SELECT N'Button_Follow', N'Prati', N'Follow' UNION ALL
		SELECT N'Button_GenerateAndSendPassword', N'Generiraj & Pošalji lozinku', N'Generate & Send Password' UNION ALL
		SELECT N'Button_GenerateAndSendPassword_DoneText', N'Završi', N'Done' UNION ALL
		SELECT N'Button_GenerateAndSendPassword_LoadingText', N'Kreiram...', N'Generating...' UNION ALL
		SELECT N'Button_GenerateAPIToken', N'Kreiraj novi API token', N'Generate a new API Token' UNION ALL
		SELECT N'Button_GenerateAPIToken_DoneText', N'Završi', N'Done' UNION ALL
		SELECT N'Button_GenerateAPIToken_LoadingText', N'Kreiram...', N'Generating...' UNION ALL
		SELECT N'Button_GenerateStore', N'Kreiraj novu trgovinu za korisnika', N'Generate Member Store' UNION ALL
		SELECT N'Button_GenerateStore_DoneText', N'Gotovo', N'Done' UNION ALL
		SELECT N'Button_GenerateStore_LoadingText', N'Kreiranje nove trgovine...', N'Generating Store...' UNION ALL
		SELECT N'Button_Grid', N'Lista', N'Grid' UNION ALL
		SELECT N'Button_Import', N'Uvezi', N'Import' UNION ALL
		SELECT N'Button_LoadMore', N'Učitaj više', N'Load more' UNION ALL
		SELECT N'Button_MappData', N'Mapiraj', N'Mapp Data' UNION ALL
		SELECT N'Button_MarkAsRead', N'Označi kao Pročitano', N'Mark as Read' UNION ALL
		SELECT N'Button_MoveToInbox', N'Premjesti u Inbox', N'Move to Inbox' UNION ALL
		SELECT N'Button_Preview', N'Pregled', N'Preview' UNION ALL
		SELECT N'Button_PrintPreview', N'Pregled ispisa', N'Print Preview' UNION ALL
		SELECT N'Button_Refresh', N'Osvježi', N'Refresh' UNION ALL
		SELECT N'Button_Remove', N'Ukloni', N'Remove' UNION ALL
		SELECT N'Button_RemoveAll', N'Ukloni sve...', N'Remove All' UNION ALL
		SELECT N'Button_RemoveToken', N'Ukloni token', N'Remove Token' UNION ALL
		SELECT N'Button_RemoveToken_DoneText', N'Završi', N'Done' UNION ALL
		SELECT N'Button_RemoveToken_LoadingText', N'Uklanjam...', N'Removing...' UNION ALL
		SELECT N'Button_Resend', N'Ponovno pošalji', N'Resend' UNION ALL
		SELECT N'Button_Reset', N'Resetiraj', N'Reset' UNION ALL
		SELECT N'Button_RestartApplication', N'Resetiraj aplikaciju', N'Restart Application' UNION ALL
		SELECT N'Button_RestartApplication_DoneText', N'Resetirana.', N'Restarted' UNION ALL
		SELECT N'Button_RestartApplication_LoadingText', N'Resetiram...', N'Restarting...' UNION ALL
		SELECT N'Button_Save', N'Snimi', N'Save' UNION ALL
		SELECT N'Button_SaveChanges', N'Snimi promjene', N'Save Changes' UNION ALL
		SELECT N'Button_SaveChanges_DoneText', N'Promjene snimljene', N'Changes Saved' UNION ALL
		SELECT N'Button_SaveChanges_LoadingText', N'Snimam...', N'Saving...' UNION ALL
		SELECT N'Button_Search', N'Traži', N'Search' UNION ALL
		SELECT N'Button_Send', N'Pošalji', N'Send' UNION ALL
		SELECT N'Button_SendEmail', N'Pošalji E-mail', N'Send E-mail' UNION ALL
		SELECT N'Button_Sent', N'Poslano', N'Sent' UNION ALL
		SELECT N'Button_Unfollow', N'Prestani pratiti', N'Unfollow' UNION ALL
		SELECT N'Button_ViewAll', N'Pregledaj sve', N'View All' UNION ALL
		SELECT N'ContentType_AccountSettings', N'Korisničke Postavke', N'Account Settings' UNION ALL
		SELECT N'ContentType_Article', N'Članak', N'Article' UNION ALL
		SELECT N'ContentType_BlogPost', N'Blog post', N'Blog Post' UNION ALL
		SELECT N'ContentType_Campaign', N'Kampanja', N'Campaign' UNION ALL
		SELECT N'ContentType_CampaignList', N'Lista kampanje', N'Campaign List' UNION ALL
		SELECT N'ContentType_Category', N'Kategorija', N'Category' UNION ALL
		SELECT N'ContentType_City', N'Grad', N'City' UNION ALL
		SELECT N'ContentType_Comment', N'Komentar', N'Comment' UNION ALL
		SELECT N'ContentType_Company', N'Tvrtka', N'Company' UNION ALL
		SELECT N'ContentType_Contact', N'Kontakt', N'Contact' UNION ALL
		SELECT N'ContentType_Content', N'Sadržaj', N'Content' UNION ALL
		SELECT N'ContentType_Country', N'Država', N'Country' UNION ALL
		SELECT N'ContentType_CountyStateProvince', N'Županije', N'County/State/Province' UNION ALL
		SELECT N'ContentType_Coupon', N'Kupon', N'Kupon' UNION ALL
		SELECT N'ContentType_CouponType', N'Vrsta kupona', N'Coupon type' UNION ALL
		SELECT N'ContentType_Domain', N'Domena', N'Domain' UNION ALL
		SELECT N'ContentType_Education', N'Obrazovanje', N'Education' UNION ALL
		SELECT N'ContentType_Experience', N'Iskustvo', N'Experience' UNION ALL
		SELECT N'ContentType_EmailCampaign', N'Email kampanje', N'Email Campaign' UNION ALL
		SELECT N'ContentType_Event', N'Događaj', N'Event' UNION ALL
		SELECT N'ContentType_Field', N'Polje', N'Field' UNION ALL
		SELECT N'ContentType_Form', N'Forma', N'Form' UNION ALL
		SELECT N'ContentType_FormEntry', N'Zapis forme', N'Form Entry' UNION ALL
		SELECT N'ContentType_Gallery', N'Galerija', N'Gallery' UNION ALL
		SELECT N'ContentType_Group', N'Grupa', N'Group' UNION ALL
		SELECT N'ContentType_IPBlockAddress', N'Blokirana IP adresa', N'IP Block Address' UNION ALL
		SELECT N'ContentType_List', N'Lista', N'List' UNION ALL
		SELECT N'ContentType_Lookup', N'Šifrarnik', N'Lookup' UNION ALL
		SELECT N'ContentType_Media', N'Medij', N'Media' UNION ALL
		SELECT N'ContentType_MediaItem', N'Stavka medija', N'Media Item' UNION ALL
		SELECT N'ContentType_Member', N'Korisnik', N'Member' UNION ALL
		SELECT N'ContentType_NavigationItem', N'Navigacijska stavka', N'Navigation Item' UNION ALL
		SELECT N'ContentType_News', N'Vijesti', N'News' UNION ALL
		SELECT N'ContentType_Note', N'Poruka', N'Note' UNION ALL
		SELECT N'ContentType_Note_Additional_Info', N'Bilješke o narudžbi, posebne napomene za dostavu', N'Notes above your order, e.g. special notes for delivery' UNION ALL
		SELECT N'ContentType_Organization', N'Organizacija', N'Organization' UNION ALL
		SELECT N'ContentType_Portfolio', N'Referenca', N'Portfolio' UNION ALL
		SELECT N'ContentType_Portfolios', N'Reference', N'Portfolios' UNION ALL
		SELECT N'ContentType_ProjectRate', N'Satnica', N'Project Rate' UNION ALL
		SELECT N'ContentType_ProjectSkill', N'Iskustvo', N'Project Skill' UNION ALL
		SELECT N'ContentType_ProjectStatus', N'Status projekta', N'Project Status' UNION ALL
		SELECT N'ContentType_ProjectTaskStatus', N'Status projektnog zadatka', N'Project Task Status' UNION ALL
		SELECT N'ContentType_Role', N'Uloga', N'Role' UNION ALL
		SELECT N'ContentType_Task', N'Zadatak', N'Task' UNION ALL
		SELECT N'ContentType_Template', N'Predložak', N'Template' UNION ALL
		SELECT N'ContentType_Testimonial', N'Preporuka', N'Testimonial' UNION ALL
		SELECT N'Contract_Compliance_Percentage', N'Postotak Ispunjenosti ugovora', N'Contract Compliance Percentage' UNION ALL
		SELECT N'Contract_Delay', N'Kašnjenje (u danima)', N'Delay (in days)' UNION ALL
		SELECT N'Data_About', N'O meni', N'About' UNION ALL
		SELECT N'Data_Abbreviation', N'Skraćenica', N'Abbreviation' UNION ALL
		SELECT N'Data_AccountType', N'Tip računa', N'Account Type' UNION ALL
		SELECT N'Data_Active', N'Aktivan', N'Active' UNION ALL
		SELECT N'Data_AdditionalInfo', N'Dodatne informacije', N'Additional info' UNION ALL
		SELECT N'Data_Address', N'Adresa', N'Address' UNION ALL
		SELECT N'Data_Admins', N'Administratori', N'Admins' UNION ALL
		SELECT N'Data_AdminUse', N'Admin koristi', N'Admin Use' UNION ALL
		SELECT N'Data_AdminUseOnly', N'Admin samo može koristiti', N'Admin Use Only' UNION ALL
		SELECT N'Data_Allow', N'Dozvoli', N'Allow' UNION ALL
		SELECT N'Data_AllowFreeShipping', N'Besplatna dostava', N'Allow Free Shipping' UNION ALL
		SELECT N'Data_AllowUsageForNonRegisteredUsers', N'Dozvoli za neregistrirane korisnike', N'Allow Usage For Non Registered Users' UNION ALL
		SELECT N'Data_AlternativeText', N'Alternativni tekst', N'Alternative Text' UNION ALL
		SELECT N'Data_Application', N'Aplikacija', N'Application' UNION ALL
		SELECT N'Data_Area', N'Područje', N'Area' UNION ALL
		SELECT N'Data_AreaCode', N'Poštanski broj', N'Area Code' UNION ALL
		SELECT N'Data_AssignedMember', N'Dodijeljeni korisnik', N'Assigned Member' UNION ALL
		SELECT N'Data_AuhtorityScore', N'Ocjena autoriteta', N'Auhtority Score' UNION ALL
		SELECT N'Data_BackgroundColor', N'Pozadinska boja', N'Background Color' UNION ALL
		SELECT N'Data_Bank', N'Banka', N'Bank' UNION ALL
		SELECT N'Data_BankAddress', N'Adresa banke', N'Bank address' UNION ALL
		SELECT N'Data_BankIBAN', N'IBAN banke', N'Bank IBAN' UNION ALL
		SELECT N'Data_BankName', N'Naziv banke', N'Bank name' UNION ALL
		SELECT N'Data_CampaignEndDate', N'Završetak kampanje', N'Campaign End Date' UNION ALL
		SELECT N'Data_CampaignEndDate_Required', N'Molimo promjenite završetak kampanje.', N'Please change campaign end date.' UNION ALL
		SELECT N'Data_CampaignStartDate', N'Početak kampanje.', N'Campaign Start Date' UNION ALL
		SELECT N'Data_CampaignStartDate_Required', N'Molimo odaberite početni datum kampanje.', N'Please select campaign start date.' UNION ALL
		SELECT N'Data_Capital', N'Kapital', N'Capital' UNION ALL
		SELECT N'Data_CasinoContent', N'Casino', N'Casino Content' UNION ALL
		SELECT N'Data_Categories', N'Kategorije', N'Categories' UNION ALL
		SELECT N'Data_Category', N'Kategorija', N'Category' UNION ALL
		SELECT N'Data_CBDContent', N'CBD', N'CBD Content' UNION ALL
		SELECT N'Data_City', N'Grad', N'City' UNION ALL
		SELECT N'Data_Client', N'Klijent', N'Client' UNION ALL
		SELECT N'Data_Code', N'Kod', N'Code' UNION ALL
		SELECT N'Data_Comment', N'Komentar', N'Comment' UNION ALL
		SELECT N'Data_Company', N'Tvrtka', N'Company' UNION ALL
		SELECT N'Data_CompanyAdmins', N'Administratori', N'Company Admins' UNION ALL
		SELECT N'Data_CompanySize', N'Veličina tvrtke', N'Company Size' UNION ALL
		SELECT N'Data_Content', N'Sadržaj', N'Content' UNION ALL
		SELECT N'Data_ContentType', N'Tip sadržaja', N'Content Type' UNION ALL
		SELECT N'Data_ContentTypes', N'Vrste sadržaja', N'Content Types' UNION ALL
		SELECT N'Data_Countries', N'Zemlje', N'Countries' UNION ALL
		SELECT N'Data_Country', N'Zemlja', N'Country' UNION ALL
		SELECT N'Data_CountyStateProvince', N'Županija', N'County/State/Province' UNION ALL
		SELECT N'Data_CouponAmount', N'Iznos kupona', N'Coupon Amount' UNION ALL
		SELECT N'Data_CouponMinAmount', N'Minimalni iznos narudžbe', N'Minimun order amount' UNION ALL
		SELECT N'Data_CouponMaxAmount', N'Maximalni iznos narudžbe', N'Maximum order amount' UNION ALL
		SELECT N'Data_Created', N'Kreirano', N'Created' UNION ALL
		SELECT N'Data_CssClass', N'CSS klasa', N'CSS Class' UNION ALL
		SELECT N'Data_DailyEmailLimit', N'Dnevno ograničenje email-ova', N'Daily Email Limit' UNION ALL
		SELECT N'Data_DatingContent', N'Upoznavanje', N'Dating Content' UNION ALL
		SELECT N'Data_Description', N'Opis', N'Description' UNION ALL
		SELECT N'Data_Discount', N'Rabat na dokument', N'Discount' UNION ALL
		SELECT N'Data_DisplayName', N'Ime', N'Display Name' UNION ALL
		SELECT N'Data_Domain', N'Domena', N'Domain' UNION ALL
		SELECT N'Data_DomainAuthority', N'Autoritet domene', N'Domain Authority' UNION ALL
		SELECT N'Data_DomainCountry', N'Država domene', N'Domain Country' UNION ALL
		SELECT N'Data_DomainIP', N'IP domene', N'Domain IP' UNION ALL
		SELECT N'Data_DomainLanguage', N'Jezik domene', N'Domain Language' UNION ALL
		SELECT N'Data_DomainRating', N'Ocjena domene', N'Domain Rating' UNION ALL
		SELECT N'Data_Drafts', N'Predlošci', N'Drafts' UNION ALL
		SELECT N'Data_Email', N'Email', N'Email' UNION ALL
		SELECT N'Data_Email_Invalid', N'Format email-a je netočan.', N'Email format is invalid.' UNION ALL
		SELECT N'Data_Enabled', N'Uključeno', N'Enabled' UNION ALL
		SELECT N'Data_Entry', N'Zapis', N'Entry' UNION ALL
		SELECT N'Data_Encrypted', N'Enkriptirano', N'Encrypted' UNION ALL
		SELECT N'Data_EndTime', N'Krajnji datum', N'End Time' UNION ALL
		SELECT N'Data_EroticContent', N'Erotika', N'Erotic Content' UNION ALL
		SELECT N'Data_EventDate', N'Datum događaja', N'Event Date' UNION ALL
		SELECT N'Data_EventEndDate', N'Krajnji datum', N'End Date' UNION ALL
		SELECT N'Data_EventLocation', N'Lokacija', N'Location' UNION ALL
		SELECT N'Data_EventStartDate', N'Početni datum', N'Start Date' UNION ALL
		SELECT N'Data_Fax', N'Faks', N'Fax' UNION ALL
		SELECT N'Data_Field', N'Polje', N'Field' UNION ALL
		SELECT N'Data_Fields', N'Polja', N'Fields' UNION ALL
		SELECT N'Data_FileOwner', N'Vlasnik datoteke', N'File Owner' UNION ALL
		SELECT N'Data_Filter', N'Filteri', N'Filter' UNION ALL
		SELECT N'Data_FirstName', N'Ime', N'First Name' UNION ALL
		SELECT N'Data_Form', N'Forma', N'Form' UNION ALL
		SELECT N'Data_Forms', N'Forme', N'Forms' UNION ALL
		SELECT N'Data_FormTypes', N'Tipovi formi', N'Form Types' UNION ALL
		SELECT N'Data_GenerateButtonDescription', N'Ili klikni na gumb za generiranje', N'Or Click Generate Button' UNION ALL
		SELECT N'Data_Group', N'Grupa', N'Group' UNION ALL
		SELECT N'Data_GroupName', N'Ime grupe', N'Group Name' UNION ALL
		SELECT N'Data_GroupOrder', N'Redoslijed grupe', N'Group Order' UNION ALL
		SELECT N'Data_HtmlBody', N'Html Zaglavlje', N'Html Body' UNION ALL
		SELECT N'Data_ID', N'ID', N'ID' UNION ALL
		SELECT N'Data_ImageOwner', N'Vlasnik slike', N'Image Owner' UNION ALL
		SELECT N'Data_Important', N'Važna Pošta', N'Important' UNION ALL
		SELECT N'Data_InActive', N'Neaktivan', N'Inactive' UNION ALL
		SELECT N'Data_IncomingMailServer', N'Dolazni Mail Server', N'Incoming Mail Server' UNION ALL
		SELECT N'Data_IndividualUseOnly', N'Samo za pojedinačnu upotrebu', N'Individual Use Only' UNION ALL
		SELECT N'Data_Industry', N'Industrija', N'Industry' UNION ALL
		SELECT N'Data_Interval', N'Interval', N'Interval' UNION ALL
		SELECT N'Data_InvalidInput', N'Molimo unesite valjani {0}.', N'Please enter a valid {0}.' UNION ALL
		SELECT N'Data_IP', N'IP adresa', N'IP Address' UNION ALL
		SELECT N'Data_IPAddress', N'IP adresa', N'IP Address' UNION ALL
		SELECT N'Data_IPAddresses', N'IP adrese', N'IP Addresses' UNION ALL
		SELECT N'Data_IsActive', N'Aktivan', N'Is Active' UNION ALL
		SELECT N'Data_IsDefaultSmptClient', N'Zadani Email klijent', N'Is Default Email Client' UNION ALL
		SELECT N'Data_IsFilterColumn', N'Kolona za pretraživanje', N'Is Filter Column' UNION ALL
		SELECT N'Data_IsImportDataEnabled', N'Omogućen uvoz podataka', N'Is Import Data Enabled' UNION ALL
		SELECT N'Data_IsFileManagerEnabled', N'Omogućen upload datoteka', N'Is File Manager Enabled' UNION ALL
		SELECT N'Data_IsMandatory', N'Obavezno polje', N'Is Mandatory' UNION ALL
		SELECT N'Data_IsPrivate', N'Privatna grupa', N'Is Private Group' UNION ALL
		SELECT N'Data_ISO', N'ISO', N'ISO' UNION ALL
		SELECT N'Data_ISO3', N'ISO3', N'ISO3' UNION ALL
		SELECT N'Data_IsSortColumn', N'Kolona za sortiranje', N'Is Sort Column' UNION ALL
		SELECT N'Data_IsSubForm', N'Subforma', N'Is Subform' UNION ALL
		SELECT N'Data_IsSubscribed', N'Pretplaćen', N'Is Subscribed' UNION ALL
		SELECT N'Data_Language', N'Jezik', N'Language' UNION ALL
		SELECT N'Data_LastLogin', N'Zadnji login', N'Last Login' UNION ALL
		SELECT N'Data_LastName', N'Prezime', N'Last Name' UNION ALL
		SELECT N'Data_LastStart', N'Zadnje vrijeme izvršavanja', N'Last Start' UNION ALL
		SELECT N'Data_LastSuccess', N'Zadnje uspješno vrijeme izvršavanja', N'Last Success' UNION ALL
		SELECT N'Data_LastSuccessfulLogin', N'Zadnja uspješna prijava', N'Last Successful Login' UNION ALL
		SELECT N'Data_Latitude', N'Širina', N'Latitude' UNION ALL
		SELECT N'Data_LicenceExpire', N'Vaša licenca će uskoro isteći', N'Your Licence is about to expire' UNION ALL
		SELECT N'Data_LinkUrl', N'URL poveznica', N'Link Url' UNION ALL
		SELECT N'Data_LoanContent', N'Pozajmice', N'Loan Content' UNION ALL
		SELECT N'Data_Longitude', N'Dužina', N'Longitude' UNION ALL
		SELECT N'Data_Lookup', N'Šifrarnik', N'Lookup' UNION ALL
		SELECT N'Data_LookupGroup_Empty', N'Lista grupa šifrarnika je trenutno prazna. Molim kliknite na {0} gumb kako bi kreirali novu grupu šifrarnika.', N'The list of lookups is empty for now. Please click on {0} button to create a new lookup group.' UNION ALL
		SELECT N'Data_Mandatory', N'Obavezno', N'Mandatory' UNION ALL
		SELECT N'Data_Members', N'Korisnici', N'Members' UNION ALL
		SELECT N'Data_MembershipType', N'Tip Korisnika', N'Membership Type' UNION ALL
		SELECT N'Data_Message', N'Poruka', N'Message' UNION ALL
		SELECT N'Data_MessageType', N'Vrsta poruke', N'Message Type' UNION ALL
		SELECT N'Data_MessageTypes', N'Vrste poruka', N'Message Types' UNION ALL
		SELECT N'Data_Mobile', N'Mobitel', N'Mobile' UNION ALL
		SELECT N'Data_MobileGrid', N'Mobilna lista', N'Mobile Grid' UNION ALL
		SELECT N'Data_Modified', N'Promjenjeno', N'Modified' UNION ALL
		SELECT N'Data_MonthlyEmailLimit', N'Mjesečno ograničenje email-ova', N'Monthly Email Limit' UNION ALL
		SELECT N'Data_MonthlyLimitDocuments', N'Mjesečno ograničenje dokumenata', N'Monthly Limit Documents' UNION ALL
		SELECT N'Data_MonthlyLimitFiles', N'Mjesečno ograničenje datoteka', N'Monthly Limit Files' UNION ALL
		SELECT N'Data_Name', N'Naziv', N'Name' UNION ALL
		SELECT N'Data_New', N'Novi {0}', N'New {0}' UNION ALL
		SELECT N'Data_NewsletterSubscriber', N'Pretplatnik newsletter-a', N'Newsletter Subscriber' UNION ALL
		SELECT N'Data_No', N'Ne', N'No' UNION ALL
		SELECT N'Data_None', N'Nijedan', N'None' UNION ALL
		SELECT N'Data_NotActive', N'Nije aktivan', N'Not Active' UNION ALL
		SELECT N'Data_NumberOfAttempts', N'Broj pokušaja', N'Number of Attempts' UNION ALL
		SELECT N'Data_NumberOfContacts', N'Broj kontakata', N'Number of contacts' UNION ALL
		SELECT N'Data_NumberOfCustomers', N'Broj korisnika', N'Number of Customers' UNION ALL
		SELECT N'Data_NumberOfProducts', N'Broj proizvoda', N'Number of Products' UNION ALL
		SELECT N'Data_NumberOfFiles', N'Broj datoteka', N'Number Of Files' UNION ALL
		SELECT N'Data_NumCode', N'Num. Kod', N'Num Code' UNION ALL
		SELECT N'Data_OperatingStatus', N'Operacijski status', N'Operating Status' UNION ALL
		SELECT N'Data_OrganicTraffic', N'Organski promet', N'Organic Traffic' UNION ALL
		SELECT N'Data_OrdersNumber', N'Uneiste broj narudžbi', N'Enter Number of Orders' UNION ALL
		SELECT N'Data_OutgoingMailServer', N'Odlazni Mail server', N'Outgoing Mail Server' UNION ALL
		SELECT N'Data_Parent', N'Roditelj', N'Parent' UNION ALL
		SELECT N'Data_Password', N'Lozinka', N'Password' UNION ALL
		SELECT N'Data_Password_Incorrect', N'Unešena lozinka je neispravna, molimo vad da unesite točnu lozinku.', N'The password you entered is incorrect, please retype your current password.' UNION ALL
		SELECT N'Data_PageSize', N'Broj stranica', N'Page Size' UNION ALL
		SELECT N'Data_Percentage', N'Postotak', N'Percentage' UNION ALL
		SELECT N'Data_Permalink', N'Permalink', N'Permalink' UNION ALL
		SELECT N'Data_Permissions', N'Dozvole', N'Permissions' UNION ALL
		SELECT N'Data_Phone', N'Telefon', N'Phone' UNION ALL
		SELECT N'Data_Phone_Invalid', N'Format telefonskog broja je netočan', N'Phone number format is invalid.' UNION ALL
		SELECT N'Data_Placeholder', N'Rezervirano mjesto', N'Placeholder' UNION ALL
		SELECT N'Data_PlainBody', N'Neformatirano Zaglavlje', N'Plain Body' UNION ALL
		SELECT N'Data_Plan', N'Plan' , N'Plan' UNION ALL
		SELECT N'Data_Population', N'Populacija', N'Population' UNION ALL
		SELECT N'Data_Position', N'Pozicija', N'Position' UNION ALL
		SELECT N'Data_PossibleValues', N'Moguće vrijednosti', N'Possible Values' UNION ALL
		SELECT N'Data_Primary', N'Primarno', N'Primary' UNION ALL
		SELECT N'Data_PrimaryPhone', N'Glavni telefon', N'Primary Phone' UNION ALL
		SELECT N'Data_ProjectEndDate', N'Završetak projekta.', N'Project End Date' UNION ALL
		SELECT N'Data_ProjectEndDate_Required', N'Molimo promjenite završni datum projekta.', N'Please change project end date.' UNION ALL
		SELECT N'Data_ProjectStartDate', N'Početak projekta.', N'Project Start Date' UNION ALL
		SELECT N'Data_ProjectStartDate_Required', N'Molimo odaberite početni datum projekta.', N'Please select project start date.' UNION ALL
		SELECT N'Data_ProjectUrl', N'URL projekta', N'Project Url' UNION ALL
		SELECT N'Data_Publish', N'Objavi', N'Publish' UNION ALL
		SELECT N'Data_Published', N'Objavljeno', N'Published' UNION ALL
		SELECT N'Data_PurchaseDate', N'Kupljeno', N'Purchase Date' UNION ALL
		SELECT N'Data_Records', N'Zapisi', N'Records' UNION ALL
		SELECT N'Data_ReferringDomains', N'Preporučujuće domene', N'Referring Domains' UNION ALL
		SELECT N'Data_RepeatPassword', N'Ponovite lozinku', N'Repeat Password' UNION ALL
		SELECT N'Data_RepeatPassword_Mismatch', N'Lozinka ne zadovoljava uvjete.', N'Password doesn''t match confirmation.' UNION ALL
		SELECT N'Data_Resource', N'Resurs', N'Resource' UNION ALL
		SELECT N'Data_Result', N'Rezultat', N'Result' UNION ALL
		SELECT N'Data_Role', N'Uloga', N'Role' UNION ALL
		SELECT N'Data_RowNumber', N'Redni broj', N'Row Number' UNION ALL
		SELECT N'Data_Save', N'Uštedi', N'Save' UNION ALL
		SELECT N'Data_Schedule', N'Zakaži', N'Schedule' UNION ALL
		SELECT N'Data_Scheduler', N'', N'' UNION ALL
		SELECT N'Data_SecondaryPhone', N'Drugi telefon', N'Secondary Phone' UNION ALL
		SELECT N'Data_Select', N'Odaberi', N'Select' UNION ALL
		SELECT N'Data_SentMail', N'Poslana Pošta', N'Sent Mail' UNION ALL
		SELECT N'Data_Settings', N'Postavke', N'Settings' UNION ALL
		SELECT N'Data_Settled', N'Osnovano', N'Settled' UNION ALL
		SELECT N'Data_ShowOnTable', N'Prikaži na tablici', N'Show On Table' UNION ALL
		SELECT N'Data_ShowProdDescription', N'Prikaži opis pod stavkama dokumenta', N'Show description under document items' UNION ALL
		SELECT N'Data_ShowOnSignUpForm', N'Pokaži na formi prijave', N'Show On SignUp Form' UNION ALL
		SELECT N'Data_SignUp', N'Registracija', N'SignUp' UNION ALL
		SELECT N'Data_Social_AccessToken', N'Token pristupa', N'Access Token' UNION ALL
		SELECT N'Data_Social_AccessTokenSecret', N'Tajni token pristupa', N'Access Token Secret' UNION ALL
		SELECT N'Data_Social_AppID', N'App ID', N'App ID' UNION ALL
		SELECT N'Data_Social_AppSecret', N'Tajni app', N'App Secret' UNION ALL
		SELECT N'Data_Social_AssignMember', N'Pridruži korisniku sljedeće uloge.', N'Assign Member to Following Roles.' UNION ALL
		SELECT N'Data_Social_ConsumerKey', N'Potrošački ključ', N'Consumer Key' UNION ALL
		SELECT N'Data_Social_ConsumerSecret', N'Potrošački tajni ključ', N'Consumer Secret' UNION ALL
		SELECT N'Data_SortOrder', N'Sortiraj prema', N'Sort Order' UNION ALL
		SELECT N'Data_SortPossibleValues', N'Sortiraj moguće vrijednosti', N'Sort Possible Values' UNION ALL
		SELECT N'Data_Source', N'Izvor', N'Source' UNION ALL
		SELECT N'Data_Spam', N'Spam', N'Spam' UNION ALL
		SELECT N'Data_SpamScore', N'Spam ocjena', N'Spam Score' UNION ALL
		SELECT N'Data_StartTime', N'Početni datum', N'Start Time' UNION ALL
		SELECT N'Data_Street1', N'Ulica 1', N'Street 1' UNION ALL
		SELECT N'Data_Street2', N'Ulica 2', N'Street 2' UNION ALL
		SELECT N'Data_Subform', N'Subforma', N'Subform' UNION ALL
		SELECT N'Data_Subforms', N'Podforme', N'Subforms' UNION ALL
		SELECT N'Data_Subject', N'Predmet', N'Subject' UNION ALL
		SELECT N'Data_SubnetMask', N'Subnet maska', N'Subnet Mask' UNION ALL
		SELECT N'Data_Subscribed', N'Pretplaćen', N'Subscribed' UNION ALL
		SELECT N'Data_SubscriberList', N'Lista pretplatnika', N'Subscriber List' UNION ALL
		SELECT N'Data_SwiftCode', N'SWIFT', N'SWIFT' UNION ALL
		SELECT N'Data_Table', N'Tablica', N'Table' UNION ALL
		SELECT N'Data_Tags', N'Tagovi', N'Tags' UNION ALL
		SELECT N'Data_Task', N'Zadatak', N'Task' UNION ALL
		SELECT N'Data_TaskType', N'Vrsta zadatka', N'Task Type' UNION ALL
		SELECT N'Data_TeamMemberLimit', N'Broj korisnika', N'Team members limit' UNION ALL
		SELECT N'Data_PlanLimitDesc', N'{0} ({1} iskorišteno, {2} ostalo)', N'{0} ({1} used, {2} left)' UNION ALL
		SELECT N'Data_ThreeLetterISO', N'Tri slova ISO', N'Three Letter ISO' UNION ALL
		SELECT N'Data_TimeSpan', N'Vremenski raspon', N'Time Span' UNION ALL
		SELECT N'Data_TimeZone', N'Vremenska zona', N'Time Zone' UNION ALL
		SELECT N'Data_Title', N'Naslov', N'Title' UNION ALL
		SELECT N'Data_TollFree', N'Bez naplate', N'Toll-free' UNION ALL
		SELECT N'Data_TollFree_Long', N'Telefonski broj bez naplate', N'Toll-free telephone number' UNION ALL
		SELECT N'Data_Trash', N'Smeće', N'Trash' UNION ALL
		SELECT N'Data_TwoLetterISO', N'Dva slova ISO', N'Two Letter ISO' UNION ALL
		SELECT N'Data_Type', N'Tip', N'Type' UNION ALL
		SELECT N'Data_UsageLimit', N'Maksimalan broj kupona', N'Usage Limit' UNION ALL
		SELECT N'Data_UsageLimitPerUser', N'Maksimalan broj kupona po korisniku', N'Usage Limit Per User' UNION ALL
		SELECT N'Data_Username', N'Korisničko ime', N'Username' UNION ALL
		SELECT N'Data_Value', N'Vrijednost', N'Value' UNION ALL
		SELECT N'Data_Version', N'Verzija', N'Version' UNION ALL
		SELECT N'Data_VerticalLayout', N'Vertikalni raspored', N'Vertical Layout' UNION ALL
		SELECT N'Data_WebGrid', N'Web lista', N'Web Grid' UNION ALL
		SELECT N'Data_Website', N'Web stranica', N'Website' UNION ALL
		SELECT N'Data_WeeklyEmailLimit', N'Tjedno ograničenje email-ova', N'Weekly Email Limit' UNION ALL
		SELECT N'Data_Yes', N'Da', N'Yes' UNION ALL
		SELECT N'Data_Zip', N'Zip', N'Zip' UNION ALL
		SELECT N'Date_PublishDate', N'Datum objave', N'Publish Date' UNION ALL
		SELECT N'Default_All', N'Sve', N'All' UNION ALL
		SELECT N'Default_CSV', N'CSV', N'CSV' UNION ALL
		SELECT N'Default_Export', N'Eksportiraj', N'Export' UNION ALL
		SELECT N'Default_Friends', N'Prijatelji', N'Friends' UNION ALL
		SELECT N'Default_Import', N'Uvezi', N'Import' UNION ALL
		SELECT N'Default_Invitations', N'Pozivnice', N'Invitations' UNION ALL
		SELECT N'Default_Search', N'Traži...', N'Search...' UNION ALL
		SELECT N'Default_SearchTerm', N'Traži izraz', N'Search term' UNION ALL
		SELECT N'Default_ShowAllRoles', N'Prikaži sve uloge', N'Show All Roles' UNION ALL
		SELECT N'Default_StatusAll', N'Svi statusi', N'Status (All)' UNION ALL
		SELECT N'Default_StatusAllowed', N'Dozvoljeno', N'Allowed' UNION ALL
		SELECT N'Default_StatusBlocked', N'Blokirano', N'Blocked' UNION ALL
		SELECT N'Default_Statuses', N'Statusi', N'Statuses' UNION ALL
		SELECT N'Default_StatusPublished', N'Objavljeno', N'Published' UNION ALL
		SELECT N'Default_StatusUnpublished', N'Neobjavljeno', N'Unpublished' UNION ALL
		SELECT N'Delivery', N'Dostava', N'Delivery' UNION ALL
		SELECT N'Delivery_Day', N'Dan dostave', N'Delivery day' UNION ALL
		SELECT N'Dialog_Title_Success', N'Uspjeh', N'Success' UNION ALL
		SELECT N'Dialog_Title_Warning', N'Upozorenje', N'Warning' UNION ALL
		SELECT N'Distance_Of_Two_Deliveries', N'Razmak između 2 poslednje dostave', N'Distance between the last 2 deliveries' UNION ALL
		SELECT N'Drfault_And', N'I', N'And' UNION ALL
		SELECT N'Drfault_OR', N'Ili', N'Or' UNION ALL
		SELECT N'DropDown_Default', N'Molimo odaberite', N'Please Select' UNION ALL
		SELECT N'DropDown_FilterBy', N'Filtriraj po {0}', N'Filter by {0}' UNION ALL
		SELECT N'DropDown_Message_PleaseSelectMembers', N'Molimo, odaberi korisnike i pokušaj ponovno.', N'Please, select member(s) and try again.' UNION ALL
		SELECT N'DropDown_Select', N'Odaberite {0}', N'Select {0}' UNION ALL
		SELECT N'DropDown_SortBy', N'Sortiraj po {0}', N'Sort by {0}' UNION ALL
		SELECT N'DropDown_TimeZone', N'Molimo, odaberite vremensku zonu.', N'Please, select time zone' UNION ALL
		SELECT N'DropDown_Value_AllRoles', N'Sve uloge', N'All Roles' UNION ALL
		SELECT N'Email_Compse_Field_Bcc', N'Bcc', N'Bcc' UNION ALL
		SELECT N'Email_Compse_Field_Cc', N'Cc', N'Cc' UNION ALL
		SELECT N'Email_Compse_Field_From', N'OD', N'From' UNION ALL
		SELECT N'Email_Compse_Field_To', N'Prema', N'To' UNION ALL
		SELECT N'Email_Compse_Title', N'Uredi poruku', N'Compose Message' UNION ALL
		SELECT N'EmailStatus_Read', N'Pročitano', N'Read' UNION ALL
		SELECT N'EmailStatus_Unread', N'Nepročitano', N'Unread' UNION ALL
		SELECT N'Enable_ShippingCheckout', N'Omogući izračun troškava dostave', N'Enable shipping on checkout' UNION ALL
		SELECT N'Errors_403_Description', N'Nemate ovlaštenja da bi pristupili stranici.', N'You are not authorized to access this page.' UNION ALL
		SELECT N'Errors_403_Headline', N'Zabranjen pristup.', N'Access denied' UNION ALL
		SELECT N'Errors_403_Title', N'Neovlašten pristup.', N'Unauthorized access' UNION ALL
		SELECT N'Errors_404_Description', N'Stranica koju tražite nije pronađena.', N'The page you were looking for could not be found.' UNION ALL
		SELECT N'Errors_404_Headline', N'Whoops, stranica nije pronađena.', N'Whoops... Page Not Found' UNION ALL
		SELECT N'Errors_404_Title', N'Stranica nije pronađena.', N'Page Not Found' UNION ALL
		SELECT N'Errors_500_Description', N'Nešto je pošlo krivo...', N'Looks like something went wrong' UNION ALL
		SELECT N'Errors_500_Headline', N'Došlo je do greške.', N'An Error Occurred' UNION ALL
		SELECT N'Errors_500_Title', N'Greška u stranici', N'Site Error' UNION ALL
		SELECT N'Errors_Link_GoBack', N'Povratak na glavnu stranicu', N'Back to Homepage' UNION ALL
		SELECT N'Expected_Contract_Compliance_Percentage', N'Očekivani postotak ispunjenosti ugovora', N'Expected Contract Compliance Percentage' UNION ALL
		SELECT N'Link_Google', N'Google map link', N'Google map link' UNION ALL
		SELECT N'Exporting_Headline', N'Izvoz podataka pomoću čarabnjaka', N'Export Data with the Data Export Wizard' UNION ALL
		SELECT N'Exporting_HelpBlock', N'Odaberite kolone za izvoz.', N'Please choose which columns to export?.' UNION ALL
		SELECT N'Field_Encrypted_Message', N'Vrijednost polja će biti enkriptirano u bazi podataka.', N'The field value will be encrypted in the database.' UNION ALL
		SELECT N'Fields_Description', N'Ovo područje nudi mogućnost za stvaranje <u><b> polja korisničkog profila</b></u> u kojoj će biti pohranjene dodatne informacije o korisniku. Bilo koje područje može biti uključeno u formu prijave. Ova polja mogu biti također grupirana. Da bi promenili redosled polja samo kliknite na red tablice te prenesite red na odabranu poziciju. Da bi promenili redosled grupe, kliknite na dugme "Uredi Grupu" te prenesite red grupe na odabranu poziciju. Možete koristiti ova polja tokom procesa prijave ili ispuniti nakon iste.', N'This area provides the ability to create <u><b>member profile fields</b></u> which will keep additional information about a member. Any field can be included to sign up form. The fields can be grouped as well. To change the order of a field just click on a table row and drag & drop the row into a specific position. To change a group order, please click on "Edit Group" button and drag & drop the group row into a specific position on. You can use these fields during sign up process or to fill that after the sign up.' UNION ALL
		SELECT N'Fields_Required_Headline', N'Sva polja označena s asteriksom (*) su obavezna.', N'All fields marked with an asterisk (*) are required.' UNION ALL
		SELECT N'Filter_Headline', N'Filtriraj {0}', N'Filter {0}' UNION ALL
		SELECT N'Filter_Headline_Search', N'Traži {0}', N'Search {0}' UNION ALL
		SELECT N'Friends_NoActiveConnections', N'Bez aktivnih konekcija.', N'No Active Connections' UNION ALL
		SELECT N'Gallery_Button_AddFiles', N'Dodaj datoteku (e)', N'Add File(s)' UNION ALL
		SELECT N'Gallery_Button_AddMediaLink', N'Dodaj link medija', N'Add Media Link' UNION ALL
		SELECT N'Gallery_Button_CancelUpload', N'Prekini upload', N'Cancel upload' UNION ALL
		SELECT N'Gallery_Button_StartUpload', N'Započni upload', N'Start upload' UNION ALL
		SELECT N'Gallery_Title', N'{0} Galerija', N'{0} Gallery' UNION ALL
		SELECT N'HelpBlock_AdminUseOnly', N'Samo admin korisnici će vidjeti ovu grupu.', N'The admin members will see this group only.' UNION ALL
		SELECT N'HelpBlock_AlternativeText', N'Alternativni tekst ili dodatni titlovi za prikaz.', N'Alternative text or optional subtitle to display.' UNION ALL
		SELECT N'HelpBlock_CampaignPosition', N'Pozicija stavke kampanje u popisu kampanje ( npr. 1,2,3 itd.)', N'Campaign item position in campaign list (eg. 1, 2, 3 etc.)' UNION ALL
		SELECT N'HelpBlock_CampaignsSent', N'Kampanja je poslana.', N'The Campaign has been sent.' UNION ALL
		SELECT N'HelpBlock_Category', N'Morate unijeti ime kategorije.', N'You must provide a category name.' UNION ALL
		SELECT N'HelpBlock_ClassName', N'Dodatne opcionalne CSS klase koje će biti pridužene stavci.', N'Optional additional CSS classes to apply to this item.' UNION ALL
		SELECT N'HelpBlock_ContentTitle', N'Morate unijeti {0} naziv.', N'You must provide a {0} title.' UNION ALL
		SELECT N'HelpBlock_Default', N'Morate unijeti {0} ime.', N'You must provide a {0} name.' UNION ALL
		SELECT N'HelpBlock_Email', N'Morate unijeti valjanu email adresu.', N'You must provide a valid E-mail.' UNION ALL
		SELECT N'HelpBlock_Encrypted', N'Vrijednost polja će biti enkriptirana u bazi podataka, te kasnije ne možete izmijeniti ovu oznaku.', N'The field value will be stored encrypted in the database and you can''t edit this flag after.' UNION ALL
		SELECT N'HelpBlock_Field_AdminUseOnly', N'Samo admini mogu vidjeti ovo polje.', N'The admin members will see this field only.' UNION ALL
		SELECT N'HelpBlock_Field_IsActive', N'Ukoliko nije označeno ovo polje je skriveno.', N'If unchecked then the field is hidden.' UNION ALL
		SELECT N'HelpBlock_Field_ShowOnTable', 'Ako nije označeno onda se podaci neće prikazati na veznoj tablici.', 'If unchecked then the values will not be shown on the related table.' UNION ALL
		SELECT N'HelpBlock_GroupOrder', N'Za promjenu redoslijeda grupe samo prenesite odgovarajuću stavku u grupi tablici na odabrano mesto.', N'To change the group order just drag & drop appropriate item in the group table below to place you need:' UNION ALL
		SELECT N'HelpBlock_IPAddress', N'Morate unijeti IP adresu.', N'You must provide an IP Address.' UNION ALL
		SELECT N'HelpBlock_IsActive', N'Korisnici ne vide ovu grupu na profilnoj stranici ukoliko nije aktivna.', N'The members don''t see this group on the profile page if it is not active.' UNION ALL
		SELECT N'HelpBlock_Lookup', N'Morate unijeti naziv Šifrarnika.', N'You must provide a Lookup name' UNION ALL
		SELECT N'HelpBlock_MediaEmbed', N'Priljepi vimeo ili youtube video.', N'Embed a vimeo or youtube video.' UNION ALL
		SELECT N'HelpBlock_MediaTitle', N'Morate unijeti naziv medija.', N'You must provide a media title.' UNION ALL
		SELECT N'HelpBlock_MenuPosition', N'Pozicija stavke izbornika u izborniku, koristite decimalna mjesta ( npr. 1, 1.1, 1.12 itd.).', N'Menu item position in menu, using decimal places (eg. 1, 1.1, 1.12 etc.).' UNION ALL
		SELECT N'HelpBlock_Permalink', N'Kod spremanja ako se ostavi polje permalink prazno tada se autogenerira permalink koristeći predložak naziva (npr. moja-stranica).', N'Save the current item and leave the input empty to have it automatically generated using the pattern Title e.g., my-page' UNION ALL
		SELECT N'HelpBlock_RoleName', N'Ova uloga je sistemska, te nije moguće promjeniti njen naziv.', N'This rols is built in, so you can''t change the role name.' UNION ALL
		SELECT N'HelpBlock_SubnetMask', N'Subnet maska ''255.255.255.0'' blokira mrežu od 83.116.119.0 do 83.116.119.255.', N'Subnet mask ''255.255.255.0'' blocks network from 83.116.119.0 to 83.116.119.255.' UNION ALL
		SELECT N'HelpBlock_Tags', N'Odvojite tagove sa zarezima', N'Separate multiple tags with commas' UNION ALL
		SELECT N'HelpBlock_Username', N'Morate unijeti korisničko ime', N'You must provide a Username.' UNION ALL
		SELECT N'HelpBlock_VerticalLayout', N'Koristi vertikalni prikaz za checkbox i radio grupe.', N'Use vertical layout for checkbox and radio button group only' UNION ALL
		SELECT N'Importing_Contacts_Headline', N'Unos kontakta izvještaj.', N'Importing Contacts Report' UNION ALL
		SELECT N'Importing_Delimiter', N'Izaberite razdjelnik', N'Choose your delimiter' UNION ALL
		SELECT N'Importing_Headline', N'Uvoz podataka pomoću čarabnjaka', N'Import Data with the Data Import Wizard' UNION ALL
		SELECT N'Importing_HelpBlock', N'Mapirajte svaku kolonu izvorne CSV datoteke u jednu od odredišnih stupaca.', N'Please map each coulmn of your source CSV file to one of destination columns.' UNION ALL
		SELECT N'Importing_Members_Headline', N'Unos korisnika izvještaj.', N'Importing Members Report' UNION ALL
		SELECT N'Importing_Roles_Headline', N'Unos korisničkih uloga izvještaj.', N'Importing Roles Report' UNION ALL
		SELECT N'Inventory_Only_Summary', N'Prikaži samo ukupno', N'Show Only Summary' UNION ALL
		SELECT N'Link_AddField', N'Dodaj polje', N'Add Field' UNION ALL
		SELECT N'Link_AddGroup', N'Dodaj grupu', N'Add Group' UNION ALL
		SELECT N'Link_Details', N'Detalji', N'Details' UNION ALL
		SELECT N'Link_EditField', N'Uredi polje', N'Edit Field' UNION ALL
		SELECT N'Link_EditGroup', N'Uredi grupu', N'Edit Group' UNION ALL
		SELECT N'Link_Entries', N'Zapisi', N'Entries' UNION ALL
		SELECT N'Link_Fields', N'Polja', N'Fields' UNION ALL
		SELECT N'Link_Gallery', N'Galerija', N'Gallery' UNION ALL
		SELECT N'Link_GoBack', N'Idi nazad', N'Go Back' UNION ALL
		SELECT N'Link_Link', N'Poveznica', N'Link' UNION ALL
		SELECT N'Link_LogOut', N'Odjava', N'Logout' UNION ALL
		SELECT N'Link_Preview', N'Pregled', N'Preview' UNION ALL
		SELECT N'Link_RemoveFields', N'Ukloni polje(a)', N'Remove Field(s)' UNION ALL
		SELECT N'Link_RemoveGroup', N'Ukloni grupu', N'Remove Group' UNION ALL
		SELECT N'Link_Run', N'Pokreni', N'Run' UNION ALL
		SELECT N'Link_View', N'Pogled', N'View' UNION ALL
		SELECT N'Members_Message_AccountNotExists', N'Račun ne postoji.', N'The account doesn''t exists.' UNION ALL
		SELECT N'Members_Message_AuthorizedToModifyData', N'Nemate dopuštenje napraviti izmjene.', N'You are not authorized to make changes.' UNION ALL
		SELECT N'Members_Message_MemberTokenCreated', N'Token je stvoren.', N'The token has been created.' UNION ALL
		SELECT N'Members_Message_MemberTokenRemoved', N'Token je uklonjen.', N'The token has been removed.' UNION ALL
		SELECT N'Members_Message_NumberOfUsers', N'Ne možete kreirati više korisnika.', N'You have exceeded the maximum number of member accounts you are allowed to create.' UNION ALL
		SELECT N'Members_Message_PasswordNonAlphaNumeric', N'Korisničko ime ne smije sadržavati alfanumeričke znakove (# @! $ itd .)!', N'The name contains non-alpha numeric characters (#@!$ etc.). Please change it.' UNION ALL
		SELECT N'Members_Message_RandomPassDidNotSend', N'Nešto je pošlo krivo, slučajna lozinka je generirana ali nije poslana korisniku.', N'Something went wrong. Random password has been generated but didn''t send to the member.' UNION ALL
		SELECT N'Members_Message_RandomPassSent', N'Generirana lozinka je kreirana i poslana korisniku.', N'Random password has been generated and sent to the member.' UNION ALL
		SELECT N'Members_Message_UserNameIsSameAsEmail', N'Korisničko ime i e-mail adresa se moraju razlikovati.', N'The member''s name looks like an e-mail address. Please change it.' UNION ALL
		SELECT N'Message_AppLimitation', N'Koristite ograničenu verziju naše aplikacije', N'You are using limited version of our app' UNION ALL
		SELECT N'Message_ContactSupport', N'Za više detalja kontaktirajte podršku ili posjetite <a href="http://app.store4.com.hr/Admin/Billings">{0}</a>  za nadogradnju plana', N'Please contact our support for more details or visit the <a href="http://app.store4.com/Admin/Billings">{0}</a> area to upgrade your plan.' UNION ALL
		SELECT N'Message_LicenceExpire', N'Molimo kontaktirajte našu podršku ili vlasnika računa za više detalja', N'Please contact our support or account owner for more details.' UNION ALL
		SELECT N'Message_Members_Desc', N'Obrađujem, molim pričekajte...', N'In progress, please wait ...' UNION ALL
		SELECT N'Message_Members_Title', N'Unos uloga', N'Importing Roles' UNION ALL
		SELECT N'Message_Roles_Desc', N'Obrađujem, molim pričekajte...', N'In progress, please wait ...' UNION ALL
		SELECT N'Message_Roles_Title', N'Unos uloga', N'Importing Roles' UNION ALL
		SELECT N'ModalTitle_Add', N'Dodaj {0}', N'Add {0}' UNION ALL
		SELECT N'ModalTitle_AssignRoles', N'Dodaj uloge {0}', N'Assign roles to {0}' UNION ALL
		SELECT N'ModalTitle_Edit', N'Uredi', N'Edit' UNION ALL
		SELECT N'ModalTitle_New', N'Nova {0}', N'New {0}' UNION ALL
		SELECT N'No_Delivery_Packages', N'Broj paketa za dostavu', N'Number of delivery packages' UNION ALL
		SELECT N'Package_Delivered', N'Dostavljeno paketa', N'Package Delivered' UNION ALL
		SELECT N'Packet_Lag', N'Zaostatak u paketima', N'The packet lag' UNION ALL
		SELECT N'Pager_ShowingEntries', N'Prikaz <b>{0}</b> do <b>{1}</b> od <b>{2}</b> unosa', N'Showing <b>{0}</b> to <b>{1}</b> of <b>{2}</b> entries' UNION ALL
		SELECT N'Placaholder_Default', N'Unesi {0}', N'Enter {0}' UNION ALL
		SELECT N'Planned_Delivery', N'Planirano za dostavu', N'Planned for delivery' UNION ALL
		SELECT N'Profile_Message_HideEncrypted', N'Ovo polja sadrži povjerljive informacije. Molimo, kliknite ovdje da bi uredili.', N'This field contains confidential information. Please, click here to edit' UNION ALL
		SELECT N'Profile_Message_PhotoNotReset', N'Slika nije resetirana:', N'Photo has not been reset:' UNION ALL
		SELECT N'Profile_Message_PhotoNotSaved', N'Vaša nova slika nije uspješno pohranjena:', N'Your new photo has not been saved successfully:' UNION ALL
		SELECT N'Profile_Message_PhotoReset', N'Slika je resetirana.', N'Photo has been reset.' UNION ALL
		SELECT N'Profile_Message_PhotoSaved', N'Vaša nova slika je uspješno pohranjena.', N'Your new photo has been saved successfully.' UNION ALL
		SELECT N'Profile_Message_ProfileSaved', N'Uspješno ste snimili promjene vašeg profila.', N'Your profile has been updated successfully.' UNION ALL
		SELECT N'Profile_Setting_Headline_FieldSettings', N'{0} Postavke', N'{0} Settings' UNION ALL
		SELECT N'Profile_Setting_Headline_General', N'Generalne Postavke', N'General Settings' UNION ALL
		SELECT N'Profile_Setting_Message_DomainSwitched', N'Profil za trenutnu domeu ''{0}'' je isključen. Molimo kontaktirajte administratora.', N'The profile for current domain ''{0}'' is switched off. Please contact site administrator.' UNION ALL
		SELECT N'Public_Captcha_Requierd', N'Je li potrebna captcha', N'Is captcha requierd' UNION ALL
		SELECT N'RemoveDialog_Description', N'Da li ste sigurni da želite ukloniti sljedeću stavku(e)?', N'Are you sure to remove selected item(s)?' UNION ALL
		SELECT N'RemoveDialog_Title', N'Ukloni stavku(e)', N'Remove item(s)' UNION ALL
		SELECT N'ResizeAvatar_Description', N'Da bi napravili promjene, možete pomaknuti i promjeniti veličinu kvadrata ispod.<br/> Kada ste sretni s svojom slikom kliknite na dugme "Snimi sliku".', N'To make adjustments, you can drag around and resize the square below.<br/> When you are happy with your photo click the “Save Photo” button.' UNION ALL
		SELECT N'ResizeAvatar_Headline', N'Lijevo je primjer Vašeg prikaza sadržaja.', N'To the left is what your content cover will look like.' UNION ALL
		SELECT N'ResizeAvatar_Title', N'Promjeni veličinu slike', N'Resize Photo' UNION ALL
		SELECT N'Roles_Assign_Description', N'Da li ste sigurni da želite dodjeliti <span style=''background-color:#{0};'' class="label">{1}</span> ulogu sljedećem korisniku/korisnicima ?', N'Are you sure you want to assign the <span style=''background-color:#{0};'' class="label">{1}</span> role to selected member(s)?' UNION ALL
		SELECT N'Roles_Assign_Headline', N'Dodaj uloge', N'Assign Roles' UNION ALL
		SELECT N'Roles_Assigned_Headline', N'Dodjeljene uloge', N'Assigned Roles' UNION ALL
		SELECT N'Roles_Reset_Description', N'Da li ste sigurni da želite resetirati <span style=''background-color:#{0};'' class="label">{1}</span> uloge sljedećem korisniku/korisnicima ?', N'Are you sure you want to reset the <span style=''background-color:#{0};'' class="label">{1}</span> role to selected member(s)?' UNION ALL
		SELECT N'Roles_Reset_Headline', N'Resetiraj uloge', N'Reset Roles' UNION ALL
		SELECT N'Settings_Data_Activation', N'Aktivacija', N'Activation' UNION ALL
		SELECT N'Settings_Data_AddGroupAsRole', N'Dodaj grupu kao ulogu', N'Add Group as Role' UNION ALL
		SELECT N'Settings_Data_AdminEmail', N'Email admina', N'Admin E-mail' UNION ALL
		SELECT N'Settings_Data_AndRedirectTo', N'I preusmjeri na', N'And Redirect To' UNION ALL
		SELECT N'Settings_Data_APIEnabled', N'API uključen', N'API Enabled' UNION ALL
		SELECT N'Settings_Data_APIKey', N'API ključ' , N'API Key' UNION ALL
		SELECT N'Settings_Data_APISecretURL', N'API tajni URL', N'API Secret URL' UNION ALL
		SELECT N'Settings_Data_ApplicationName', N'Ime aplikacije', N'Application Name' UNION ALL
		SELECT N'Settings_Data_ApplicationPath', N'Putanja aplikacije', N'Application Path' UNION ALL
		SELECT N'Settings_Data_AssignMemberToRole', N'Dodaj ulogu korisniku', N'Assign Member to Role' UNION ALL
		SELECT N'Settings_Data_AuthCookieName', N'Auth ime cookie-a', N'Auth Cookie Name' UNION ALL
		SELECT N'Settings_Data_Bcc', N'Blind Carbon Copy (Bcc)', N'Blind Carbon Copy (Bcc)' UNION ALL
		SELECT N'Settings_Data_DefaultPagingSize', N'Standardna veličina obilježavanja', N'Default Paging Size' UNION ALL
		SELECT N'Settings_Data_DefaultUILanguage', N'Standardni UI jezik', N'Default UI Language' UNION ALL
		SELECT N'Settings_Data_DomainName', N'Naziv domene', N'Domain Name' UNION ALL
		SELECT N'Settings_Data_EnablePrivacyAndPolicyConfirmation', N'Omogući potvrdu uvjeta korištenja tijekom registracije', N'Enable Privacy and policy confirmation' UNION ALL
		SELECT N'Settings_Data_Fluid', N'Fluid', N'Fluid' UNION ALL
		SELECT N'Settings_Data_GoogleAnalyticsID', N'Google Analytics ID za Praćenje', N'Google Analytics Tracking ID' UNION ALL
		SELECT N'Settings_Data_GooglePublisherId', N'Id vlasnika Google+ stranice', N'Google Publisher Id' UNION ALL
		SELECT N'Settings_Data_LDAP_Domain', N'LDAP domena', N'LDAP Domain' UNION ALL
		SELECT N'Settings_Data_LDAP_MemberToRole', N'Dodaj ulogu korisniku', N'Add Member to Role' UNION ALL
		SELECT N'Settings_Data_LDAP_Path', N'LDAP putanja', N'LDAP Path' UNION ALL
		SELECT N'Settings_Data_LDAPEnabled', N'LDAP Uključen', N'LDAP Enabled' UNION ALL
		SELECT N'Settings_Data_LDAPUseOnly', N'LDAP samo koristi', N'LDAP Use Only' UNION ALL
		SELECT N'Settings_Data_Logs', N'Logovi', N'Logs' UNION ALL
		SELECT N'Settings_Data_MailDomains', N'Mail domene', N'Mail Domains' UNION ALL
		SELECT N'Settings_Data_MailDomains_AllowAll', N'Dozvoli sve (osim iz popisa)', N'Allow All (Excluding from the list)' UNION ALL
		SELECT N'Settings_Data_MailDomains_DenyAll', N'Zabrani sve (osim iz popisa)', N'Deny All (Excluding from the list)' UNION ALL
		SELECT N'Settings_Data_MaintenanceTime', N'Vrijeme održavanja', N'Maintenance Time' UNION ALL
		SELECT N'Settings_Data_MaintenanceTimeURL', N'Poveznica vremena održavanja', N'Maintenance Time URL' UNION ALL
		SELECT N'Settings_Data_MandrilAPIKey', N'Mandril API ključ', N'Mandril API Key' UNION ALL
		SELECT N'Settings_Data_PasswordChange', N'Promjena lozinke', N'Password Change' UNION ALL
		SELECT N'Settings_Data_PasswordFailed', N'Ukoliko lozinka ne uspije', N'If Password Was Failed' UNION ALL
		SELECT N'Settings_Data_RedirectAfterSignIn', N'Preusmeri nakon prijave', N'Redirect After Sign In' UNION ALL
		SELECT N'Settings_Data_RedirectAfterSignOut', N'Preusmeri nakon odjave', N'Redirect After Sign Out' UNION ALL
		SELECT N'Settings_Data_RedirectAfterSignUp', N'Preusmeri nakon registracije', N'Redirect After Sing Up' UNION ALL
		SELECT N'Settings_Data_Registration', N'Registracija', N'Registration' UNION ALL
		SELECT N'Settings_Data_ResetPassword', N'Reset lozinke', N'Reset Password' UNION ALL
		SELECT N'Settings_Data_SecretAdminURL', N'Tajni ADMIN URL', N'Secret Admin URL' UNION ALL
		SELECT N'Settings_Data_SelfActivation', N'Samo-Aktivacija', N'Self-Activation' UNION ALL
		SELECT N'Settings_Data_SelfActivationRoles', N'Uloge samo-aktivacije', N'Self-Activation Roles' UNION ALL
		SELECT N'Settings_Data_SelfRegistration', N'Samo-Registracija', N'Self-Registration' UNION ALL
		SELECT N'Settings_Data_SelfRegistrationRoles', N'Uloge samo-registracije', N'Self-Registration Roles' UNION ALL
		SELECT N'Settings_Data_SendEmail', N'Pošalji Email', N'Send Email' UNION ALL
		SELECT N'Settings_Data_SendEmailsViaMandrilAPI', N'Slanje email-a preko Mandril API-a', N'Send Emails via Mandril API' UNION ALL
		SELECT N'Settings_Data_SendEmailsViaSendGridAPI', N'Slanje email-a preko Sendgrid API-a', N'Send Emails via SendGrid API' UNION ALL
		SELECT N'Settings_Data_SMTPHost', N'SMTP domaćin', N'SMTP Host' UNION ALL
		SELECT N'Settings_Data_SMTPPassword', N'SMTP Lozinka', N'SMTP Password' UNION ALL
		SELECT N'Settings_Data_SMTPPort', N'SMTP Port', N'SMTP Port' UNION ALL
		SELECT N'Settings_Data_SMTPUserEmail', N'SMTP Korisnički email', N'SMTP User Email' UNION ALL
		SELECT N'Settings_Data_SMTPUserName', N'SMTP Korisničko ime', N'SMTP User Name' UNION ALL
		SELECT N'Settings_Data_SN_Blogger', N'Bloger', N'Blogger' UNION ALL
		SELECT N'Settings_Data_SN_Facebook', N'Facebook', N'Facebook' UNION ALL
		SELECT N'Settings_Data_SN_Google', N'Google', N'Google' UNION ALL
		SELECT N'Settings_Data_SN_LiveJournal', N'Live Journal', N'Live Journal' UNION ALL
		SELECT N'Settings_Data_SN_myOpenID', N'myOpenID', N'myOpenID' UNION ALL
		SELECT N'Settings_Data_SN_OpenID', N'OpenID', N'OpenID' UNION ALL
		SELECT N'Settings_Data_SN_Twitter', N'Twitter', N'Twitter' UNION ALL
		SELECT N'Settings_Data_SN_Yahoo', N'Yahoo', N'Yahoo' UNION ALL
		SELECT N'Settings_Data_SSL', N'SSL', N'SSL' UNION ALL
		SELECT N'Settings_Data_SublimeToken', N'Sublime Token', N'Sublime Token' UNION ALL
		SELECT N'Settings_Data_Theme', N'Tema', N'Theme' UNION ALL
		SELECT N'Settings_HelpBlock_AddGroupAsRole', N'Dodaj grupe korisnicima automatski kao uloge ukoliko već ne postoje.', N'Add members groups as role automatically if it doesn''t exists.' UNION ALL
		SELECT N'Settings_HelpBlock_AdminEmail', N'Email adresa admina.', N'The E-mail address of the site admin.' UNION ALL
		SELECT N'Settings_HelpBlock_AndRedirectTo', N'Preusmjeri na url ukoliko je račun blokiran.', N'Redirect to the url if account was blocked.' UNION ALL
		SELECT N'Settings_HelpBlock_APIEnabled', N'Uključi API podršku.', N'Enables API support.' UNION ALL
		SELECT N'Settings_HelpBlock_APISecretURL', N'URL koji će biti korišten pri izvršavanju API metode.', N'The URL which will be used for API method execution.' UNION ALL
		SELECT N'Settings_HelpBlock_ApplicationName', N'Naziv aplikacije', N'The name of the application.' UNION ALL
		SELECT N'Settings_HelpBlock_ApplicationPath', N'Puna putanja aplikacije.', N'Application''s absolute path.' UNION ALL
		SELECT N'Settings_HelpBlock_AuthCookieName', N'Naziv cookie-a koji će se koristiti pri korisničkovoj autentikaciji.', N'The name of the cookie which will use for the user authentication.' UNION ALL
		SELECT N'Settings_HelpBlock_Bcc', N'Ovo je kopija email poruke poslane primatelju čija email adresa nije sadržana u poruci. <br/> Koristi "," - zarez da odvojiš', N'This is a copy of an email message sent to a recipient whose email address does not appear in the message.<br/> Use "," - comma as separator.' UNION ALL
		SELECT N'Settings_HelpBlock_DefaultPagingSize', N'Standardna veličina stranice za sve tablice.', N'The default page size for all grids.' UNION ALL
		SELECT N'Settings_HelpBlock_DefaultUILanguage', N'Standardni javni UI jezik.', N'Default public UI language.' UNION ALL
		SELECT N'Settings_HelpBlock_DomainName', N'Domena stranice.', N'The website domain.' UNION ALL
		SELECT N'Settings_HelpBlock_Fluid', N'Uključi tečno ponašanje za UI admina.', N'Enable fluid behavior for admin UI.' UNION ALL
		SELECT N'Settings_HelpBlock_GoogleAnalyticsID', N'Ovo je univerzalni Google Analytics prateći kod.', N'This is the Universal Google Analytics tracking code.' UNION ALL
		SELECT N'Settings_HelpBlock_GooglePublisherId', N'Id vlasnika Google+ stranice.', N'Google+ Publisher Id.' UNION ALL
		SELECT N'Settings_HelpBlock_LDAP_Domain', N'LDAP mail domena koja će se koristiti za ime korisnika.', N'LDAP mail domain which will be used for member name.' UNION ALL
		SELECT N'Settings_HelpBlock_LDAP_Path', N'Kada se spajate na AD možete koristiti "bezserverno" ili možete specifirati pristup serveru da koristi uvijek. Primjer kako koristiti obadvoje :', N'When connecting to AD you can use "serverless" binding or you can specify a serverbound to use everytime (server bound). Here''s an example of using both:' UNION ALL
		SELECT N'Settings_HelpBlock_LDAPEnabled', N'Koristi LDAP kao primaran za autentikaciju korisnika.', N'Using LDAP as primary for a member authentication.' UNION ALL
		SELECT N'Settings_HelpBlock_LDAPUseOnly', N'Koristi samo LDAP autentikaciju. Molimo, dodajte prije LDAP admin korisnika u Admin uloge.', N'Using LDAP authentication only. Please, add LDAP admin user to Admins role before.' UNION ALL
		SELECT N'Settings_HelpBlock_Logs', N'Uključite funkcionalnost loga.', N'Enable logs functionality.' UNION ALL
		SELECT N'Settings_HelpBlock_MailDomains', N'Zabranjena lista mail domena .</br> Koristite "," - koristite razmak da bi razdvojili.', N'Restricted mail domain list.</br> Use "," - comma as separator' UNION ALL
		SELECT N'Settings_HelpBlock_MaintenanceTime', N'Promjenite u mod održavanja.', N'Switch to the maintenance mode.' UNION ALL
		SELECT N'Settings_HelpBlock_MaintenanceTimeURL', N'Lokalna ili eksterna putanja stranice održavanja.', N'Local or external path of maintenance page.' UNION ALL
		SELECT N'Settings_HelpBlock_MandrilAPIKey', N'Mandrill API Ključ za Mandrill Api korišten za slanje email-a.', N'The Mandrill API Key for Mandrill Api used for sending emails.' UNION ALL
		SELECT N'Settings_HelpBlock_MemberToRole', N'Dodjeli kreiranog korisnika sljedećim ulogama.', N'Assign created member to the following roles.' UNION ALL
		SELECT N'Settings_HelpBlock_PasswordFailed', N'Liste uloga (Blokiran; Blokiran > 5 za stavku).', N'Role list (Blocked; Blocked > 5 for instance).' UNION ALL
		SELECT N'Settings_HelpBlock_RedirectAfterAccountActivation', N'Preusmjeri na URL nakon uspješne aktivacije računa.', N'Redirect to the url after success account activation.' UNION ALL
		SELECT N'Settings_HelpBlock_RedirectAfterSignIn', N'Preusmjeri na url nakon prijave ukoliko nema povratne veze.', N'Redirect to the url after sign in if there is no back link.' UNION ALL
		SELECT N'Settings_HelpBlock_RedirectAfterSignOut', N'Preusmjeri na url nakon odjave ukoliko nema povratne veze.', N'Redirect to the url after sign out if there is no back link.' UNION ALL
		SELECT N'Settings_HelpBlock_RedirectAfterSignUp', N'Preusmjeri na url nakon registracije ukoliko nema povratne veze.', N'Redirect to the url after sign up if there is no back link.' UNION ALL
		SELECT N'Settings_HelpBlock_ResetPassword', N'Uključi mogućnost resetiranja lozinke.', N'Enables reset password functionality,' UNION ALL
		SELECT N'Settings_HelpBlock_SecretAdminURL', N'Administracijski tajni URL.', N'The administration secret URL.' UNION ALL
		SELECT N'Settings_HelpBlock_SelfActivation', N'Uključi mogućnost aktivacije', N'Enables self-activation functionality' UNION ALL
		SELECT N'Settings_HelpBlock_SelfActivationRoles', N'Pridruži korisniku ova pravila nakon samo-aktivacije.', N'Assign member to these roles after self-activation.' UNION ALL
		SELECT N'Settings_HelpBlock_SelfRegistration', N'Uključi mogućnost registracije.', N'Enables self-registration functionality.' UNION ALL
		SELECT N'Settings_HelpBlock_SelfRegistrationRoles', N'Dodjeli korisniku ove uloge nakon samo-registracije', N'Assign member to these roles after self-registration' UNION ALL
		SELECT N'Settings_HelpBlock_SendEmailsViaMandrilAPI', N'Uključi Madrill za slanje email-a.', N'Enable Madrill for sending emails.' UNION ALL
		SELECT N'Settings_HelpBlock_SendEmailsViaSendGridAPI', N'Uključi SendGrid za slanje email-a.', N'Enable SendGrid for sending emails.' UNION ALL
		SELECT N'Settings_HelpBlock_SMTPHost', N'SMTP server host koji se koristi za slanje email-a ( npr. Smtp.imedomene.com).', N'SMTP server host used for sending emails (e.g. smtp.domainname.com).' UNION ALL
		SELECT N'Settings_HelpBlock_SMTPPassword', N'Lozinka za SMTP račun za slanje email-a.', N'The password for the SMTP account used for sending emails.' UNION ALL
		SELECT N'Settings_HelpBlock_SMTPPort', N'Port za SMTP server koji se koristi za slanje email-a.', N'The port for SMTP server used for sending emails.' UNION ALL
		SELECT N'Settings_HelpBlock_SMTPUserEmail', N'Korisnički email SMTP računa za slanje email-a.', N'The user email for SMTP account used for sending emails.' UNION ALL
		SELECT N'Settings_HelpBlock_SMTPUserName', N'Korisničko ime za SMTP račun za slanje email-a.', N'The user name for SMTP account used for sending emails.' UNION ALL
		SELECT N'Settings_HelpBlock_SN_Blogger', N'Uključi prijavu s Blogger-om.', N'Enable login via Blogger.' UNION ALL
		SELECT N'Settings_HelpBlock_SN_Facebook', N'Uključi prijavu s Facebook-om', N'Enable login via Facebook.' UNION ALL
		SELECT N'Settings_HelpBlock_SN_Google', N'Uključi prijavu s Google-om.', N'Enable login via Google.' UNION ALL
		SELECT N'Settings_HelpBlock_SN_LiveJournal', N'Uključi prijavu s Live Journal-om.', N'Enable login via Live Journal.' UNION ALL
		SELECT N'Settings_HelpBlock_SN_myOpenID', N'Uključi prijavu s LivemyOpenIDl-jem.', N'Enable login via LivemyOpenIDl.' UNION ALL
		SELECT N'Settings_HelpBlock_SN_OpenID', N'Uključi prijavu s OpenID-om.', N'Enable login via OpenID.' UNION ALL
		SELECT N'Settings_HelpBlock_SN_Twitter', N'Uključi prijavu s Twitter-om.', N'Enable login via Twitter.' UNION ALL
		SELECT N'Settings_HelpBlock_SN_Yahoo', N'Uključi prijavu s Yahoo-om.', N'Enable login via Yahoo.' UNION ALL
		SELECT N'Settings_HelpBlock_SSL', N'Uključi SSL vezu između aplikacije i mail servera.', N'Enable SSL connection between application and mail server.' UNION ALL
		SELECT N'Settings_HelpBlock_SublimeToken', N'Sublime Token', N'The Sublime Token Id.' UNION ALL
		SELECT N'Settings_HelpBlock_Theme', N'Odaberi glavnu temu aplikacije.', N'Select application main theme.' UNION ALL
		SELECT N'Settings_Instructions_SN_Facebook', N'Da bi koristili ovu opciju prvo morate postaviti <a href="https://developers.facebook.com/apps"> Facebook aplikaciju.</a>', N'To use this option you must first setup a <a href="https://developers.facebook.com/apps"> Facebook App.</a>' UNION ALL
		SELECT N'Settings_Instructions_SN_Facebook_Detailed', N'Preporučeno je korisnici se mogu autenticirati s Facebook-om tako da prilikom socijalizacije promoviraju vašu aplikaciju. Prvi korak za Facebook je dobiti APP ID i App tajni ključ ( bazirano na oAuth 2.0 ), tako da je potrebno registrirati Vašu aplikaciju na <a href=https://developers.facebook.com/apps">https://developers.facebook.com/apps</a>."', N'It is recommended that users be able to authenticate with Facebook when using Socialize so as to maximize the exposure and promotion of your app. First step for Facebook is retrieve the App ID and App Secret (it is based on oAuth 2.0), so register you application on <a href=https://developers.facebook.com/apps">https://developers.facebook.com/apps</a>."' UNION ALL
		SELECT N'Settings_Instructions_SN_Twitter', N'Da bi koristili ovu opciju morate prvo podesiti <a href="https://dev.twitter.com/apps/new" target="_blank">Twitter Applikaciju.</a>', N'To use this option you must first setup a <a href="https://dev.twitter.com/apps/new" target="_blank">Twitter App.</a>' UNION ALL
		SELECT N'Settings_Instructions_SN_Twitter_Detailed', N'Potretno je registrirati Vašu aplikaciju na Twitter-u. To znači da imate produkcijski URL spreman prije nego počnete aplikaciju razvijati. Kada završite s registracijom, dobiti ćete klijentski ključ i klijentski tajni ključ. Ove jedinstvene vrijednosti će pomoći da Vaša aplikacija radi s Twitter-om. Ništa strašno. Možete pogledati sve vaše registrirane aplikacije na <a href="http://twitter.com/oauth">http://twitter.com/oauth</a>.Te da bi je registrirali morate posjetiti <a href="http://twitter.com/apps/new">http://twitter.com/apps/new</a>.', N'You need to register your application with Twitter. That means you should have your production URL ready before you think to start your development. When you finished with registration, you will receive consumer key and consumer secret. These unique credentials will help your app to interact with Twitter. No big deal. You can visit your all registered applications on <a href="http://twitter.com/oauth">http://twitter.com/oauth</a>. And to register for new app you need to visit <a href="http://twitter.com/apps/new">http://twitter.com/apps/new</a>.' UNION ALL
		SELECT N'Settings_RedirectAfterAccountActivation', N'Preusmjeri nakon Korisničke registracije', N'Redirect After Account Activation' UNION ALL
		SELECT N'SiteMenu_AccountSettings', N'Korisničke Postavke', N'Account Settings' UNION ALL
		SELECT N'SiteMenu_Ads', N'Oglasi/Baneri', N'Ads/Banners' UNION ALL
		SELECT N'SiteMenu_Articles', N'članci', N'Articles' UNION ALL
		SELECT N'SiteMenu_Audit', N'Logovi', N'Event Log' UNION ALL
		SELECT N'SiteMenu_Blog', N'Blog', N'Blog' UNION ALL
		SELECT N'SiteMenu_Campaigns', N'Kampanje', N'Campaigns' UNION ALL
		SELECT N'SiteMenu_Categories', N'Kategorije', N'Categories' UNION ALL
		SELECT N'SiteMenu_Cities', N'Gradovi', N'Cities' UNION ALL
		SELECT N'SiteMenu_Comments', N'Komentari', N'Comments' UNION ALL
		SELECT N'SiteMenu_Companies', N'Tvrtke', N'Companies' UNION ALL
		SELECT N'SiteMenu_Connections', N'Veze', N'Connections' UNION ALL
		SELECT N'SiteMenu_Content', N'Sadržaj', N'Content' UNION ALL
		SELECT N'SiteMenu_Countries', N'Zemlje', N'Countries' UNION ALL
		SELECT N'SiteMenu_CountyStateProvinces', N'Županije', N'County/State/Provinces' UNION ALL
		SELECT N'SiteMenu_Coupons', N'Kuponi', N'Coupons' UNION ALL
		SELECT N'SiteMenu_CRM', N'CRM', N'CRM' UNION ALL
		SELECT N'SiteMenu_Dashboard', N'Upravljačka ploča', N'Dashboard' UNION ALL
		SELECT N'SiteMenu_DepositInvoices', N'Račun za Predujam', N'Deposit Invoices' UNION ALL
		SELECT N'SiteMenu_Description_Default', N'{0} Uređivač', N'{0} Editor' UNION ALL
		SELECT N'SiteMenu_Description_Lists', N'Uređivač listi (FAQs)', N'Lists Editor (FAQs)' UNION ALL
		SELECT N'SiteMenu_Description_Settings', N'Globalne postavke', N'Global Settings' UNION ALL
		SELECT N'SiteMenu_Description_Support', N'Pomoć & Podrška', N'Help & Support' UNION ALL
		SELECT N'SiteMenu_Domains', N'Domene', N'Domains' UNION ALL
		SELECT N'SiteMenu_EmailCampaigns', N'Email kampanje', N'Email Campaigns' UNION ALL
		SELECT N'SiteMenu_Events', N'Događaji', N'Events' UNION ALL
		SELECT N'SiteMenu_Expenses', N'Troškovi', N'Expenses' UNION ALL
		SELECT N'SiteMenu_Fields', N'Polja', N'Fields' UNION ALL
		SELECT N'SiteMenu_FilesManager', N'Upravljanje datotekama', N'Files Manager' UNION ALL
		SELECT N'SiteMenu_FormBuilder', N'Kreiranje obrazaca', N'Form Builder' UNION ALL
		SELECT N'SiteMenu_FormCategories', N'Kategorije formi', N'Form Categories' UNION ALL
		SELECT N'SiteMenu_FormEntries', N'Unosi Formi', N'Form Entries' UNION ALL
		SELECT N'SiteMenu_FormFields', N'Polja formi', N'Form Fields' UNION ALL
		SELECT N'SiteMenu_FormLookups', N'Šifrarnici', N'Form Lookups' UNION ALL
		SELECT N'SiteMenu_FormSettings', N'Postavke formi', N'Form Settings' UNION ALL
		SELECT N'SiteMenu_Forms', N'Forme', N'Forms' UNION ALL
		SELECT N'SiteMenu_Friends', N'Prijatelji', N'Friends' UNION ALL
		SELECT N'SiteMenu_Home', N'Naslovna', N'Home' UNION ALL
		SELECT N'SiteMenu_HtmlTemplates', N'HTML predlošci', N'Html Templates' UNION ALL
		SELECT N'SiteMenu_Inbox', N'Dolazna pošta', N'Inbox' UNION ALL
		SELECT N'SiteMenu_Industries', N'Industrija' , N'Industries' UNION ALL
		SELECT N'SiteMenu_IPBlockList', N'Lista blokiranih IP adresa', N'IP Block List' UNION ALL
		SELECT N'SiteMenu_Lists', N'Liste', N'Lists' UNION ALL
		SELECT N'SiteMenu_Locations', N'Lokacije', N'Locations' UNION ALL
		SELECT N'SiteMenu_Lookups', N'Šifrarnici', N'Lookups' UNION ALL
		SELECT N'SiteMenu_Members', N'Korisnici', N'Members' UNION ALL
		SELECT N'SiteMenu_Messages', N'Poruke', N'Messages' UNION ALL
		SELECT N'SiteMenu_News', N'Vijesti', N'News' UNION ALL
		SELECT N'SiteMenu_Organizations', N'Organizacije', N'Organizations' UNION ALL
		SELECT N'SiteMenu_Pages', N'Stranice', N'Pages' UNION ALL
		SELECT N'SiteMenu_Plugins', N'Moduli', N'Plugins' UNION ALL
		SELECT N'SiteMenu_Portfolios', N'Portfolio', N'Portfolios' UNION ALL
		SELECT N'SiteMenu_Posts', N'Postovi', N'Posts' UNION ALL
		SELECT N'SiteMenu_Profile', N'Profil', N'Profile' UNION ALL
		SELECT N'SiteMenu_ProjectDeliverables', N'Rezultati projekta', N'Project Deliverables' UNION ALL
		SELECT N'SiteMenu_ProjectDuration', N'Trajanje projekta', N'Project Duration' UNION ALL
		SELECT N'SiteMenu_ProjectRates', N'Troškovi projekta', N'Project Rates' UNION ALL
		SELECT N'SiteMenu_ProjectSkills', N'Vještine', N'Project Skills' UNION ALL
		SELECT N'SiteMenu_ProjectStatuses', N'Statusi projekta', N'Project Statuses' UNION ALL
		SELECT N'SiteMenu_ProjectTaskStatuses', N'Statusi', N'Project Task Statuses' UNION ALL
		SELECT N'SiteMenu_ProjectTimeRequirements', N'Trajanje projekta', N'Project Time Requirements' UNION ALL
		SELECT N'SiteMenu_Qualification', N'Kvalifikacije' , N'Qualification' UNION ALL
		SELECT N'SiteMenu_Roles', N'Korisničke Uloge', N'Roles' UNION ALL
		SELECT N'SiteMenu_ScheduledTasks', N'Zakazani zadaci', N'Scheduled Tasks' UNION ALL
		SELECT N'SiteMenu_Security', N'Sigurnost', N'Security' UNION ALL
		SELECT N'SiteMenu_Settings', N'Postavke', N'Settings' UNION ALL
		SELECT N'SiteMenu_SignOut', N'Odjavi se', N'Sign Out' UNION ALL
		SELECT N'SiteMenu_SiteContent', N'Sadržaj stranice', N'Site Content' UNION ALL
		SELECT N'SiteMenu_SiteNavigation', N'Navigacija stranice', N'Site Navigation' UNION ALL
		SELECT N'SiteMenu_SubscriberLists', N'Lista pretplatnika', N'Subscriber Lists' UNION ALL
		SELECT N'SiteMenu_Subscribers', N'Pretplatnici', N'Subscribers' UNION ALL
		SELECT N'SiteMenu_Support', N'Podrška', N'Support' UNION ALL
		SELECT N'SiteMenu_Tasks', N'Zadaci', N'Tasks' UNION ALL
		SELECT N'SiteMenu_Testimonials', N'Testimonijali', N'Testimonials' UNION ALL
		SELECT N'Store_Name_Placeholder', N'Unesite valjano ime za trgovinu', N'Enter valid Store Name' UNION ALL
		SELECT N'Switch_Grid', N'Promijeni na grid', N'Switch to grid' UNION ALL
		SELECT N'Switch_List', N'Promijeni na listu', N'Switch to list' UNION ALL
		SELECT N'Tabs_Address', N'Adresa', N'Address' UNION ALL
		SELECT N'Tabs_API', N'API', N'API' UNION ALL
		SELECT N'Tabs_API_Description', N'Da biste pristupili API-u, potrebne su dvije informacije. Prva je korisnički email koji je jedinstven, te koji koristimo da identificiramo korisnički račun. Drugi je API token koji se koristi kao lozinka za spajanje na API. Na ovom ekranu možete dobiti obje. U slučaju kreiranja novog API tokena, trebate kliknuti na "Generiraj novi API oznake" kako bi ga generirali. Obje informacije su vam potrebne kod dohvaćanja podataka preko API-a.', N'In order to access the API, you need two pieces of information. The first is a member email which is a unique code that we use to identify your account. The other is an API Token which acts as a password when you connect to the API. You can get both of those here. You should click on the "Generate a new API Token" to display it. You''ll need to remember both of those later when you start writing code.' UNION ALL
		SELECT N'Tabs_Attempts', N'Pokušaji', N'Attempts' UNION ALL
		SELECT N'Tabs_BankInformation', N'Banka', N'Bank' UNION ALL
		SELECT N'Tabs_Contacts', N'Kontakti', N'Contacts' UNION ALL
		SELECT N'Tabs_Details', N'Detalji', N'Details' UNION ALL
		SELECT N'Tabs_Domains', N'Domene', N'Domains' UNION ALL
		SELECT N'Tabs_FacebookWall', N'Facebook zid', N'Facebook Wall' UNION ALL
		SELECT N'Tabs_General', N'Općenito', N'General' UNION ALL
		SELECT N'Tabs_Languages', N'Jezici', N'Languages' UNION ALL
		SELECT N'Tabs_LDAP', N'LDAP', N'LDAP' UNION ALL
		SELECT N'Tabs_Membership', N'Članstvo', N'Membership' UNION ALL
		SELECT N'Tabs_OutgoingMailServer', N'SMTP postavke', N'SMTP Settings' UNION ALL
		SELECT N'Tabs_POPAndIMAP', N'POP i IMAP', N'POP and IMAP' UNION ALL
		SELECT N'Tabs_Profile', N'Profil', N'Profile' UNION ALL
		SELECT N'Tabs_Profile_Description', N'Ovo područje sadrži dodatna polja koja mogu biti definirana s Vaše strane na ekranu Opcije/Polja. Obratite pažnju koja polja mogu biti obvezna za ispunu od strane korisnika prilikom registracije.', N'This area contains extra fields which can be defined by you on Settings/Fields. Please pay attention what fields can be mandatory and filled in by a member during sign up process.' UNION ALL
		SELECT N'Tabs_ProfileFields', N'Profilna polja', N'Profile Fields' UNION ALL
		SELECT N'Tabs_Registration', N'Registracija', N'Registration' UNION ALL
		SELECT N'Tabs_RestrictedByDomains', N'Zarbranjeno od domene', N'Restricted By Domains' UNION ALL
		SELECT N'Tabs_RestrictedByRoles', N'Zabranjeno po ulogama', N'Restricted By Roles' UNION ALL
		SELECT N'Tabs_Rules', N'Uloge', N'Rules' UNION ALL
		SELECT N'Tabs_Sales', N'Prodaja', N'Sales' UNION ALL
		SELECT N'Tabs_SocialNetworks', N'Socijalne mreže', N'Social Networks' UNION ALL
		SELECT N'Tabs_Store', N'Trgovina', N'Store' UNION ALL
		SELECT N'Tabs_Store_Description', N'Trgovina', N'Store' UNION ALL
		SELECT N'Tabs_Themes', N'Teme', N'Themes' UNION ALL
		SELECT N'Tabs_Title', N'Općenito', N'General' UNION ALL
		SELECT N'Tabs_Tweets', N'Tweet-ovi', N'Tweets' UNION ALL
		SELECT N'Tabs_UserInterface', N'Korisničko sučelje', N'User Interface' UNION ALL
		SELECT N'Total_Delay', N'Ukupno kašnjenje', N'Total delay' 
				
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
