/*=CONCATENATE("SELECT N'";A1;"', N'";B1;"' UNION ALL")*/
DECLARE @ResourcesTable TABLE (Name VARCHAR (128), Value NVARCHAR (MAX), [Description] NVARCHAR (MAX))

DECLARE @ResourceID INT, @ResourceTypeID INT, @LanguageID INT
DECLARE @Name VARCHAR (128), @Value NVARCHAR (MAX), @Description NVARCHAR (MAX)

SET @ResourceTypeID = NULL
SELECT TOP 1 @ResourceTypeID = ResourceTypeID FROM ResourceTypes WHERE Name = 'eCommerceResources'
SET @ResourceTypeID = ISNULL (@ResourceTypeID, 0)

SET @LanguageID = NULL
SELECT TOP 1 @LanguageID = LanguageID FROM Languages WHERE CultureName = 'sr-Latn-RS' --AND IsEnabled = 1
SET @LanguageID = ISNULL(@LanguageID, 0)

IF (@ResourceTypeID > 0 AND @LanguageID > 0) BEGIN
	INSERT INTO @ResourcesTable (Name, Value, [Description])
		SELECT N'Add_To_Cart', N'Dodaj u košaricu', N'Add to Cart' UNION ALL
		SELECT N'Add_To_Wishlist', N'Dodaj u listu želja', N'Add to Wishlist' UNION ALL
		SELECT N'Button_PlaceOrder', N'Naruči', N'Place Order' UNION ALL
		SELECT N'Button_RemoveAll', N'Ukloni sve', N'Remove All' UNION ALL
		SELECT N'Cart_Message_Successfully', N'Označene stavke su dodane u košaricu', N'Selected items was successfully added to your cart' UNION ALL
		SELECT N'Cart_Subtotal', N'Cijena', N'Subtotal' UNION ALL
		SELECT N'Cart_Title', N'Košarica', N'Cart' UNION ALL
		SELECT N'Cart_Total', N'Ukupno', N'Cart Totals' UNION ALL
		SELECT N'Cart_Totals_Title', N'Košarica ukupno', N'Cart Totals' UNION ALL
		SELECT N'Cart_Total_Order_Message', N'Izračunat će se tijekom finaliziranja narudžbe', N'It will be calculated during order finalization' UNION ALL
		SELECT N'Cart_VAT', N'Porez', N'VAT' UNION ALL
		SELECT N'Checkout_Title', N'Blagajna', N'Checkout' UNION ALL
		SELECT N'CityTagCloud_Title', N'Gradovi u oblaku', N'Cities Tag Cloud' UNION ALL
		SELECT N'Continue_Shopping', N'Nastavi kupovati', N'Continue Shopping' UNION ALL
		SELECT N'Coupon_Discounts', N'Kupon', N'Coupon Discounts' UNION ALL
		SELECT N'CreditCard_BillingAddress', N'Adresa za naplatu', N'Billing Address' UNION ALL
		SELECT N'CreditCard_CardTypeValidation', N'Nepodržan format kartice.', N'Invalid card type.' UNION ALL
		SELECT N'CreditCard_CityValidation', N'Grad je prazan. Unesite Grad.', N'City is empty. Enter City.' UNION ALL
		SELECT N'CreditCard_Code', N'KOD ( CVC)', N'Code (CVC)' UNION ALL
		SELECT N'CreditCard_CreditCardNumber', N'Broj kreditne kartice', N'Credit Card Number' UNION ALL
		SELECT N'CreditCard_CVC_Code', N'CVC kod', N'CVC Code' UNION ALL
		SELECT N'CreditCard_CvcEmpty', N'CVC kod je prazan. Unesite CVC.', N'CVC is empty. Enter CVC.' UNION ALL
		SELECT N'CreditCard_CvcValidation', N'CVC kod je neispravan. Unesite ispravan CVC kod.', N'CVC is invalid. Enter valid CVC.' UNION ALL
		SELECT N'CreditCard_ExpirationDate', N'Datum isteka', N'Expiration Date' UNION ALL
		SELECT N'CreditCard_ExpirationYear', N'Godina isteka kartice.', N'Expiration Year' UNION ALL
		SELECT N'CreditCard_FirstNameValidation', N'Ime je prazno. Unesite ime.', N'First Name is empty. Enter First Name.' UNION ALL
		SELECT N'CreditCard_LastNameValidation', N'Prezime je prazno. Unesite prezime.', N'Last Name is empty. Enter Last Name.' UNION ALL
		SELECT N'CreditCard_ManagedAccountNote', N'Obavještenje : Samo nepretplatničke US Viza ili Mastercard debitne kartice su podržane.', N'Note: Only a non-prepaid US Visa or MasterCard debit cards are supported.' UNION ALL
		SELECT N'CreditCard_MonthValidation', N'Datum isteka kartice je prazan. Unesite datum isteka kartice.', N'Expiration Month is empty. Enter Expiration Month.' UNION ALL
		SELECT N'CreditCard_Note', N'Obavještenje : Unešeno ime i prezime se mora podudarati s imenom i prezimenom na kartici.', N'NOTE: Your name must match the name on your credit card' UNION ALL
		SELECT N'CreditCard_Number', N'Broj Kartice', N'Card Number' UNION ALL
		SELECT N'CreditCard_NumberValidation', N'Broj kreditne kartice je prazan. Unesite broj kreditne kartice.', N'Credit Card Number is empty. Enter Credit Card Number.' UNION ALL
		SELECT N'CreditCard_StateValidation', N'Država je prazna. Unesite državu', N'State is empty. Enter State.' UNION ALL
		SELECT N'CreditCard_StreetValidation', N'Adresa ulice je prazna. Unesite adresu ulice.', N'Street is empty. Enter Street.' UNION ALL
		SELECT N'CreditCard_YearValidation', N'Godina isteka kartice je prazna. Unesite godinu isteka kartice.', N'Expiration Year is empty. Enter Expiration Year.' UNION ALL
		SELECT N'CreditCard_ZipValidation', N'Poštanski broj je prazan. Unesite poštanski broj.', N'Zip is empty. Enter Zip.' UNION ALL
		SELECT N'Data_All', N'Sve', N'All' UNION ALL
		SELECT N'Data_Booked', N'Rezervisano', N'Booked' UNION ALL
		SELECT N'Data_Bookings', N'Rezervacije', N'Bookings' UNION ALL
		SELECT N'Data_BreakEndTIme', N'Kraj pauze', N'Break end time' UNION ALL
		SELECT N'Data_BreakStartTime', N'Početak pauze', N'Break start time' UNION ALL
		SELECT N'Data_BreakTimeByMinutes', N'Pauza po minutama', N'Break By Minutes' UNION ALL
		SELECT N'Data_City', N'Grad', N'City' UNION ALL
		SELECT N'Data_Country', N'Zemlja', N'Country' UNION ALL
		SELECT N'Data_DaysOfWeek', N'Dani u nedelji', N'Days of Week' UNION ALL
		SELECT N'Data_Description', N'Opis', N'Description' UNION ALL
		SELECT N'Data_EventDate', N'Datum događaja', N'Event Date' UNION ALL
		SELECT N'Data_EventEndTime', N'Završno vreme', N'End Time' UNION ALL
		SELECT N'Data_EventEntriesAdd', N'Dodaj događaje', N'Add Event Entries' UNION ALL
		SELECT N'Data_EventLocation', N'Mjesto događaja', N'Event Location' UNION ALL
		SELECT N'Data_EventSettings', N'Postavke događaja', N'Event Settings' UNION ALL
		SELECT N'Data_EventStartTime', N'Početno vreme', N'Start Time' UNION ALL
		SELECT N'Data_EventType', N'Tip', N'Type' UNION ALL
		SELECT N'Data_FirstName', N'Ime', N'First Name' UNION ALL
		SELECT N'Data_Friday', N'Petak', N'Friday' UNION ALL
		SELECT N'Data_ID', N'ID', N'ID' UNION ALL
		SELECT N'Data_Image', N'Slika', N'Image' UNION ALL
		SELECT N'Data_LastName', N'Prezime', N'Last Name' UNION ALL
		SELECT N'Data_Monday', N'Ponedjeljak', N'Monday' UNION ALL
		SELECT N'Data_Month', N'Mesec', N'Month' UNION ALL
		SELECT N'Data_NotBooked', N'Nije rezervisan', N'Not booked' UNION ALL
		SELECT N'Data_Payment', N'Plaćanje', N'Payment' UNION ALL
		SELECT N'Data_PeriodEndDate', N'Kraj razdoblja', N'Period end date' UNION ALL
		SELECT N'Data_PeriodStartDate', N'Početak razdoblja', N'Period start date' UNION ALL
		SELECT N'Data_Price', N'Cena', N'Price' UNION ALL
		SELECT N'Data_Repeat', N'Ponovi', N'Repeat' UNION ALL
		SELECT N'Data_RepeatCustom', N'Custom', N'Custom' UNION ALL
		SELECT N'Data_RepeatDaily', N'Dnevni', N'Daily' UNION ALL
		SELECT N'Data_RepeatEvery', N'Svaki', N'Every' UNION ALL
		SELECT N'Data_Reviews', N'Recenzije ({0})', N'Reviews ({0})' UNION ALL
		SELECT N'Data_Saturday', N'Subota', N'Saturday' UNION ALL
		SELECT N'Data_Selected', N'Odabrano', N'Selected' UNION ALL
		SELECT N'Data_ShiftEndTime', N'Kraj smjene', N'Shift end time' UNION ALL
		SELECT N'Data_ShiftStartTime', N'Početak smjene', N'Shift start time' UNION ALL
		SELECT N'Data_StateProvince', N'Država/Provincija', N'State/Province' UNION ALL
		SELECT N'Data_Street', N'Ulica', N'Street' UNION ALL
		SELECT N'Data_Sunday', N'Nedjelja', N'Sunday' UNION ALL
		SELECT N'Data_Thursday', N'Četvrtak', N'Thursday' UNION ALL
		SELECT N'Data_Tuesday', N'Utorak', N'Tuesday' UNION ALL
		SELECT N'Data_Wednesday', N'Sreda', N'Wednesday' UNION ALL
		SELECT N'Data_Year', N'Godina', N'Year' UNION ALL
		SELECT N'Data_ZipPostal', N'Poštanski broj', N'Zip/Postal' UNION ALL
		SELECT N'Error_ChargingAccount', N'Došlo je do greške prilikom naplate!', N'There Was an error while charging account!' UNION ALL
		SELECT N'Error_EmailData', N'Ne postoji email podatak', N'There is no Email data!' UNION ALL
		SELECT N'Error_EmailFormatInvalid', N'Nepodržani email format!', N'Invalid Email format!' UNION ALL
		SELECT N'Error_EnterCorrectPrice', N'Molimo unesite tačnu cijenu! Minimalna cena je {0:N2}!', N'Please enter correct price! Minimum price is {0:N2}!' UNION ALL
		SELECT N'Error_EntryOverlaping', N'Ulaz za datum {0:d} se preklapa s već postojećim!', N'Entry for date {0:d} overlaps existing!' UNION ALL
		SELECT N'Error_EventBooked', N'Događaj {0} je već rezervisan!', N'Event {0} is already booked!' UNION ALL
		SELECT N'Error_EventDelete', N'Došlo je do greške prilikom brisanja stavki događaja!', N'There was an error while deleting Event Entries!' UNION ALL
		SELECT N'Error_EventEntrySaving', N'Došlo je do greške prilikom snimanja stavki događaja!', N'There was an error while save Event entry!' UNION ALL
		SELECT N'Error_EventLocation', N'Maksimalna veličina simbola za lokaciju je 250!', N'Maximum allowed character length for Location is 250!' UNION ALL
		SELECT N'Error_ManagedAccount', N'Greška upravljanja računom!', N'Managed account error!' UNION ALL
		SELECT N'Error_MemberData', N'Nepostojeći podatak korisnika!', N'Invalid Member data!' UNION ALL
		SELECT N'Error_NoOrderData', N'Ne postoje podaci narudžbe!', N'There is no Order data!' UNION ALL
		SELECT N'Error_NoPaymentData', N'Ne postoje podaci o plaćanju!', N'There is no Payment data!' UNION ALL
		SELECT N'Error_OrderAlreadyPaid', N'Narudžba je već plaćena', N'Order is already paid' UNION ALL
		SELECT N'Error_OrderHasNoBookings', N'Narudžba ne sadrži niti jednu rezervaciju događaja!', N'Order does not contains any Event bookings!' UNION ALL
		SELECT N'Error_OrderInvalid', N'Neispravna narudžba!', N'Invalid Order!' UNION ALL
		SELECT N'Error_OrderTotalInvalid', N'Neispravna sveukupna narudžba!', N'Invalid order Total!' UNION ALL
		SELECT N'Error_OrderTotalMissMatch', N'Ukupan iznos narudžbe ne odgovara ukupnom događaju rezervacije!', N'Order total does not match Event bookings total!' UNION ALL
		SELECT N'Error_PriceNotDefined', N'Događaj nije definisan u Proizvodima!', N'Event is not defined in Products!' UNION ALL
		SELECT N'Error_SendingEmail', N'Došlo je do greške prilikom slanja email-a!', N'There was an error while sending email!' UNION ALL
		SELECT N'Error_TokenDataInvalid', N'Neispravan token!', N'Invalid Token data!' UNION ALL
		SELECT N'ErrorMessage_MaxFieldSize', N'Maksimalna veličina ''{0}'' polja je {1}!', N'The maximum field size for a ''{0}'' field is {1}!' UNION ALL
		SELECT N'Event_Description', N'{0:d} {0:HH:mm} - {1:HH:mm}', N'{0:d} {0:HH:mm} - {1:HH:mm}' UNION ALL
		SELECT N'Event_PageTitle', N'{0} - Postavke događaja', N'{0} - Event Settings' UNION ALL
		SELECT N'Info_NoItems', N'Pretraga je neuspešna. Ne postoji takav artikal/proizvod.', N'No items match your search!' UNION ALL
		SELECT N'Info_SearchResult', N'{0} rezultata odgovara vašoj pretrazi.', N'{0} results match your serch' UNION ALL
		SELECT N'ManagedAccount_Default', N'Standardan', N'Default' UNION ALL
		SELECT N'Membership_SignIn', N'Prijava', N'Sign In' UNION ALL
		SELECT N'Message_AddedToBasket', N'Dodano u korpu.', N'Added to basket.' UNION ALL
		SELECT N'Message_AddedToFavorites', N'Dodato u omiljene proizvode.', N'Added to favorites.' UNION ALL
		SELECT N'Message_AlredyPosted', N'Već ste objavili.', N'You have already posted.' UNION ALL
		SELECT N'Message_AlredyRated', N'Već ste ocenili.', N'You have already rated.' UNION ALL
		SELECT N'Message_Favorites_UnauthorizedAccess', N'Molimo <a href="/signin2> Prijavite se </a> ili <a href="/signup">Odjavite </a> da bi dodali u omiljeno.', N'Please <a href="/signin2> Sign In</a> or <a href="/signup">Sign Up</a> to add to favorites.' UNION ALL
		SELECT N'Message_Rating', N'Zahvaljujemo na oceni.', N'Thank you for rating!' UNION ALL
		SELECT N'Message_RemovedFromBasket', N'Uklonjeno iz korpe.', N'Removed from basket.' UNION ALL
		SELECT N'Message_RemovedFromFavorites', N'Uklonjeno iz favorita.', N'Removed from favorites.' UNION ALL
		SELECT N'Message_Success_ChangedSettings', N'Vaše postavke su promenjene!', N'Your settings have been changed!' UNION ALL
		SELECT N'Payment_BookingOrderText', N'Plaćanje za red rezervacije: {0}', N'Payment for Booking order: {0}' UNION ALL
		SELECT N'Payment_CreditCardsAccepted', N'Prihvaćene kreditne kartice', N'Credit Cards accepted' UNION ALL
		SELECT N'Payment_MainHeading', N'Nova narudžba', N'New Order' UNION ALL
		SELECT N'Payment_MainHeadingText', N'Koristite formu ispod da bi poslali informacije o kreditnoj kartici', N'Use the form below to submit your credit card information.' UNION ALL
		SELECT N'Payment_NewCreditCard', N'Nova kreditna kartica', N'New Credit Card' UNION ALL
		SELECT N'Payment_PageTitle', N'Naružba', N'Order' UNION ALL
		SELECT N'Payment_Total', N'TOTAL: ${0:N2}', N'TOTAL: ${0:N2}' UNION ALL
		SELECT N'Proceed_to_Checkout', N'Dovrši narudžbu', N'Proceed to Checkout' UNION ALL
		SELECT N'Product_Image', N'Slika', N'Image' UNION ALL
		SELECT N'SearchResults_Headline', N'Pronađi sve za venčanje u svom gradu.', N'Find everything for a wedding in your city.' UNION ALL
		SELECT N'Success_EventDeleted', N'Stavke događaja uspešno obrisane!', N'Event Entries successfully deleted!' UNION ALL
		SELECT N'Success_EventEntrySaved', N'Stavke događaja uspešno sačuvane!', N'Event entries successfully saved.' UNION ALL
		SELECT N'TipsForNewlyweds_Title', N'Saveti za nove mladence', N'Tips for Newlyweds' UNION ALL
		SELECT N'Update_Cart', N'Osveži košaricu', N'Update Cart' UNION ALL
		SELECT N'Validation_BreakEndTimeInvalid', N'Neispravni završetak pauze.', N'Invalid Break end time!' UNION ALL
		SELECT N'Validation_BreakStartTimeGreater', N'Početno vreme za pauzu je veće nego završno vreme!', N'Start time for Break is greater than end time!' UNION ALL
		SELECT N'Validation_BreakStartTimeInvalid', N'Neipravno početno vreme pauze!', N'Invalid Break start time!' UNION ALL
		SELECT N'Validation_BreakTimeLonger', N'Pauza je duža nego vreme smjene!', N'Break time is longer than Shift time!' UNION ALL
		SELECT N'Validation_BreakTimePeriodInvalid', N'Neispravno razdoblje pauze!', N'Invalid Break time period!' UNION ALL
		SELECT N'Validation_BreatTimeNotEntered', N'vreme pauze za postavke nije uneto!', N'Break time for settings is not entered!' UNION ALL
		SELECT N'Validation_CustomDatesNotSelected', N'Molimo odaberite datume.', N'Please select custom Dates.' UNION ALL
		SELECT N'Validation_DaysOfWeekNotSelected', N'Dani u nedelji nisu označeni!', N'Days of Week are not selected!' UNION ALL
		SELECT N'Validation_MemberData', N'Neispravan podatak korisnika!', N'Invalid Member Data!' UNION ALL
		SELECT N'Validation_MemberID', N'Neispravan korisnički ID!', N'Invalid Member ID!' UNION ALL
		SELECT N'Validation_NumberOfTicketsNotEntered', N'Broj kupaca nije unešen!', N'Number of Customers is not entered!' UNION ALL
		SELECT N'Validation_PeriodEndDateOverlapping', N'Završni datum za odabrano razdoblje se preklapa s postojećim stavkama događaja!', N'End date for selected period is overlapping existing Event entries!' UNION ALL
		SELECT N'Validation_PeriodStartDateGreater', N'Početni datum za razdoblje je veći nego završni datum!', N'Start date for period is greater than end date!' UNION ALL
		SELECT N'Validation_PeriodStartDateOverlapping', N'Početni datum za razdoblje se preklapa s postojećim stavkama događaja!', N'Start date for selected period is overlapping existing Event entries!' UNION ALL
		SELECT N'Validation_Post_Unauthorized', N'Nemate ovlašćenja da objavite ovu poruku!', N'You are not authorized to post this message!' UNION ALL
		SELECT N'Validation_PriceNotEntered', N'Cena nije uneta!', N'Prise is not entered!' UNION ALL
		SELECT N'Validation_ProductSelect', N'Molimo odaberite proizvod.', N'Please select Product.' UNION ALL
		SELECT N'Validation_Rating', N'Ocjena je obavezna. Molimo ocjenite.', N'Rating is required. Please rate.' UNION ALL
		SELECT N'Validation_SelectedPeriodOverlapping', N'Odabrano razdoblje se preklapa s već postojećim!', N'Selected Period is overlapping existing!' UNION ALL
		SELECT N'Validation_ShiftStartTimeGreater', N'Početno vreme smene je veće nego završno vreme!', N'Start time for Shift is greater than end time!' UNION ALL
		SELECT N'Validation_ShiftTimePeriodInvalid', N'Neispravno razdoblje vremena smene!', N'Invalid Shift time period!' UNION ALL
		SELECT N'Validation_VendorSetting_Success', N'Postavke poduzeća su promenjena!', N'Company settings have been changed!' UNION ALL
		SELECT N'Validation_VendorSetting_Warning', N'Došlo je do greške prilikom snimanja promjena. Molimo pokušajte ponovno!', N'An error has been occurred during saving changes. Please try again!' UNION ALL
		SELECT N'VedorRegistration_Email_Content_AdvancedRegistration', N'Uspešno ste dodali vaše poduzeće u Vendor direktorijum! Status vašeg paketa oglašavanja je <strong>Besplatno osnovno</strong> izlistanje.<br/>Nakon što primimo uplatu, unutar 24 sata status vašeg oglašivačkog paketa će biti promjenjen  <strong>{0}</ strong> listu.<br/><br/>Hvala Vam što oglašavate vaše poduzeće na {1}.', N'You have successfully added your company in the Vendor Directory! Status of your advertising package is <strong>Free Basic</strong> listing.<br/>After we receive the payment, within 24 hours Status of your advertising package will be changed to <strong>{0}</ strong> listing.<br/><br/>Thank you for advertising your Company on the {1}.' UNION ALL
		SELECT N'Vendor_Contact_Headline_LeaveMessage', N'Ostavite poruku', N'Leave a message' UNION ALL
		SELECT N'Vendor_Contact_Headline_WriteReview', N'Napišite recenziju', N'Write your Review' UNION ALL
		SELECT N'Vendor_Contact_Placeholder_WriteMessage', N'Napišite poruku...', N'Write a message...' UNION ALL
		SELECT N'Vendor_Contact_Subtitle', N'Kontakt {0}.<br />Email će biti poslat na sledeće email adrese: {1}', N'Contact {0}.<br />E-mail will be sent to the following email address: {1}' UNION ALL
		SELECT N'Vendor_Link_Registration', N'Vendor registracija', N'Vendor Registration' UNION ALL
		SELECT N'Vendor_Link_Registration_Tooltip', N'Besplatno se registrujte te budite objavljeni danas! Razvijajte vaše poslovanje s : {ApplicationTitle}.', N'Sign Up for free and get listed today! Grow your business with {ApplicationTitle}.' UNION ALL
		SELECT N'Vendor_Literal_RateFirst', N'Prvo ocenite', N'Rate it first' UNION ALL
		SELECT N'Vendor_Literal_Rating', N'Ocena : {0}/5', N'Rating: {0}/5' UNION ALL
		SELECT N'Vendor_Literal_RatingNumOfUsers', N'od {0} korisnika', N'from {0} users' UNION ALL
		SELECT N'Vendor_Literal_Views', N'Pregleda {0}', N'Views {0}' UNION ALL
		SELECT N'Vendor_RelatedContent_Title', N'Istaknuta poduzeća', N'Featured Companies' UNION ALL
		SELECT N'Vendor_Review_Placeholder_WriteRevew', N'Napišite recenziju...', N'Write a review...' UNION ALL
		SELECT N'VendorDirectory_Title', N'Vendor direktorijum', N'Vendor Directory' UNION ALL
		SELECT N'VendorRegistration_Button_NextStep', N'Sledeći korak', N'Next Step' UNION ALL
		SELECT N'VendorRegistration_Button_PreviousStep', N'Prethodni korak', N'Previous Step' UNION ALL
		SELECT N'VendorRegistration_FirstStep_Subtitle', N'Vendor registracija sadrži 4 koraka.<br /><strong>Obaveštenje:</strong> Sva polja označena <strong style=color: #F86DA8;">*</strong> su obavezna.', N'Vendor registration screen consists of four steps.<br /><strong>Note:</strong> All fields marked <strong style=color: #F86DA8;">*</strong> are required.' UNION ALL
		SELECT N'VendorRegistration_FourStep_Subtitle', N'Upload logotipa Vašeg poduzeća. Klik na dugme "Traži" ili "Odaberi datoteku" te odaberite datoteku s Vašeg računara.<br />Ukoliko nemate logo poduzeća, možete ovo napraviti kasnije!', N'Upload your company logo. Click on the button Browse" or "Choose File" and select the file from your computer.<br />If you currently don''t have a company logo, you can do this later!' UNION ALL
		SELECT N'VendorRegistration_Message_Success', N'Uspešno ste dodali poduzeće u Vendor Direktorijum!<br />Možete urediti postavke poduzeća koristeći link <a href="{0}">link</ a>.', N'You have successfully added your company to the Vendor Directory!<br/>You can edit your company information using the following <a href="{0}">link</ a>.' UNION ALL
		SELECT N'VendorRegistration_Message_SuccessShort', N'Uspešno ste dodali poduzeće u Vendor Direktorijum!', N'You have successfully added your company to the Vendor Directory!' UNION ALL
		SELECT N'VendorRegistration_SecStep_Subtitle', N'Unesite ime kompanije ili agencije te odaberite odgovarajuću kategoriju.<br />Ovo je dobro mesto gdje će Vam biti objašnjeno zašto parovi trebaju odabrati vaš proizvod ili uslugu.',N'Enter the name of your company or agency and select the corresponding category.<br />This is also good place where you can briefly explain why the couples should select your products or services.' UNION ALL
		SELECT N'VendorRegistration_ThirdStep_Subtitle', N'Preporučljivo je da unesete adresu, lokaciju, telefon, fax, mobilni , email i/ili web adresu.<br />Svi podaci će biti vidljivi posetiocima portala.<br />', N'We recommend you to enter your address, location, phone, fax, mobile, e-mail or Web address.<br />All data will be visible to visitors of our portal.' UNION ALL
		SELECT N'Vlidation_UploadLogo_Format', N'Molimo uploadujte logo u sledećem formatu: {0}.', N'Please upload a logo in one of the following formats {0}.' UNION ALL
		SELECT N'Vlidation_UploadLogo_Size', N'Maksimalna veličina loga je 1MB', N'Maximum size of the logo is 1MB' UNION ALL
		SELECT N'Widget_LatestArticles_Headline', N'Poslednji članci', N'Latest Articles' UNION ALL
		SELECT N'Widget_Newsletter_Description', N'Pretplatite se na naš Newsletter da bi ste dobili Važna obaveštenja i odlične promotivne ponude.', N'Subscribe to Our Newsletter to get Important News, Amazing Offers & Inside Scoops.' UNION ALL
		SELECT N'Widget_Newsletter_Headline', N'Prijava na newsletter', N'Newsletter Singup' UNION ALL
		SELECT N'Widget_RelatedFeeds_Title', N'Vezani feeds', N'Related Feeds' UNION ALL
		SELECT N'Error_CreatingCustomer', N'Došlo je do greške prilikom kreiranja Kupca.', N'There was an error while creating customer.' UNION ALL
		SELECT N'Error_CreatingCreditCard', N'Došlo je do greške prilikom kreiranja Kreditne Kartice.', N'There was an error while creating credit card.' UNION ALL
		SELECT N'Error_CreatingMember', N'Došlo je do greške prilikom kreiranja Korisnika.', N'There was an error while creating Member.' UNION ALL
		SELECT N'Error_CreatingMemberToken', N'Došlo je do greške prilikom kreiranja Korisničkog Tokena.', N'There was an error while generating Member Token.' UNION ALL
		SELECT N'PaymentSettings_PaymentCancelURL', N'Povratna adresa nakon odustajana', N'Cancel URL' UNION ALL
		SELECT N'PaymentSettings_PaymentEnviroment', N'Razvojno okruženje', N'Enviroment' UNION ALL
		SELECT N'PaymentSettings_PaymentGateway', N'Portal za Plaćanja', N'Payment Gateway' UNION ALL
		SELECT N'PaymentSettings_PaymentGatewayURL', N'Adresa za plaćanje', N'Payment Gateway URL' UNION ALL
		SELECT N'PaymentSettings_PaymentPrivateKey', N'Privatni Ključ za Plaćanja', N'Payment Private Key' UNION ALL
		SELECT N'PaymentSettings_PaymentPublicKey', N'Javni Ključ za Plaćanja', N'Payment Public Key' UNION ALL
		SELECT N'PaymentSettings_PaymentReturnErrorURL', N'Povratna adresa neuspješne autorizacije', N'Error URL' UNION ALL
		SELECT N'PaymentSettings_PaymentReturnURL', N'Povratna adresa uspješne autorizacije', N'Return URL' UNION ALL
		SELECT N'PaymentSettings_PaymentMerchantID', N'Trgovac ID za Plaćanja', N'Payment Merchant ID' UNION ALL
		SELECT N'Product_Availability', N'Stanje na skladištu', N'Availability' UNION ALL
		SELECT N'Shop_Title', N'Trgovina', N'Shop' UNION ALL
		SELECT N'Signin_New_Customer', N'Novi korisnik', N'New Customer' UNION ALL
		SELECT N'Signin_Returning_Customer', N'Postojeći korisnik', N'Returning Customer' UNION ALL
		SELECT N'Store', N'Trgovina', N'Store'
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
