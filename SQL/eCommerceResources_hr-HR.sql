/*=CONCATENATE("SELECT N'";A1;"', N'";B1;"' UNION ALL")*/
DECLARE @ResourcesTable TABLE (Name VARCHAR (128), Value NVARCHAR (MAX), [Description] NVARCHAR (MAX))

DECLARE @ResourceID INT, @ResourceTypeID INT, @LanguageID INT
DECLARE @Name VARCHAR (128), @Value NVARCHAR (MAX), @Description NVARCHAR (MAX)

SET @ResourceTypeID = NULL
SELECT TOP 1 @ResourceTypeID = ResourceTypeID FROM ResourceTypes WHERE Name = 'eCommerceResources'
SET @ResourceTypeID = ISNULL (@ResourceTypeID, 0)

SET @LanguageID = NULL
SELECT TOP 1 @LanguageID = LanguageID FROM Languages WHERE CultureName = 'hr-HR' --AND IsEnabled = 1
SET @LanguageID = ISNULL(@LanguageID, 0)

IF (@ResourceTypeID > 0 AND @LanguageID > 0) BEGIN
	INSERT INTO @ResourcesTable (Name, Value, [Description])
	SELECT N'AccountLocked_message', N'Račun je zaključan. Istekla vam je licenca. Za nastavak korištenja aplikacije, molimo obnovite licencu', N'Your account is locked because your license has been expired. To continue using this App, please renew your license.' UNION ALL
		SELECT N'Add_To_Cart', N'Dodaj u košaricu', N'Add to Cart' UNION ALL
		SELECT N'Add_to_Wishlist_Text', N'Dodaj u listu želja', N'Add to Wishlist' UNION ALL
		SELECT N'Already_bought_Warning', N'Aplikacija je već kupljena', N'You have already bought an Application' UNION ALL
		SELECT N'Amount_StatementTitle', N'Ukupno', N'Amount' UNION ALL
		SELECT N'Available_points', N'Raspoloživi iznos', N'Available points' UNION ALL
		SELECT N'Best_Sales_Title', N'Najprodavaniji proizvodi', N'Best Sales' UNION ALL
		SELECT N'Button_PlaceOrder', N'Naruči', N'Place Order' UNION ALL
		SELECT N'Button_RemoveAll', N'Ukloni sve', N'Remove All' UNION ALL
		SELECT N'Cancel_Payment_Message', N'Jeste li sigurni da želite otkazati plaćanje?', N'Are you sure you want to cancel this payment?' UNION ALL
		SELECT N'Cancel_Payment_Message_Confirm', N'Da, otkaži plaćanje', N'Yes, cancel it' UNION ALL
		SELECT N'Cart_Message_Successfully', N'Označene stavke su dodane u košaricu', N'Selected items was successfully added to your cart' UNION ALL
		SELECT N'Cart_Subtotal', N'Cijena', N'Subtotal' UNION ALL
		SELECT N'Cart_Title', N'Košarica', N'Cart' UNION ALL
		SELECT N'Cart_Totals_Title', N'Košarica ukupno', N'Cart Totals' UNION ALL
		SELECT N'Cart_Total', N'Ukupno', N'Cart Totals' UNION ALL
		SELECT N'Cart_Total_Order_Message', N'Izračunat će se tijekom finaliziranja narudžbe', N'It will be calculated during order finalization' UNION ALL
		SELECT N'Cart_VAT', N'Porez', N'VAT' UNION ALL
		SELECT N'Change_password', N'Promjena lozinke', N'Change password' UNION ALL
		SELECT N'Checkout_Title', N'Blagajna', N'Checkout' UNION ALL
		SELECT N'CityTagCloud_Title', N'Gradovi u oblaku', N'Cities Tag Cloud' UNION ALL
		SELECT N'Clear_Wishlist_Text', N'Ukloni sve', N'Clear Wishlist' UNION ALL
		SELECT N'Continue_Shopping', N'Nastavi kupovinu', N'Continue Shopping' UNION ALL
		SELECT N'Country_Warning', N'Država je pogrešna. Molim odaberite valjanu državu', N'Country is invalid. Select valid Country.' UNION ALL
		SELECT N'Coupon_Discounts', N'Kupon', N'Coupon Discounts' UNION ALL
		SELECT N'CreateAccount', N'Izradite novi online račun:', N'Create new online account' UNION ALL
		SELECT N'CreateAccount_Benefits_Checkout', N'Brži i lakši checkout', N'A quick and easy checkout' UNION ALL
		SELECT N'CreateAccount_Benefits_Newslettera', N'Jednostavna prijava i odjava od newslettera', N'Easy sign-up and sign-off from the newsletter' UNION ALL
		SELECT N'CreateAccount_Benefits_Orders', N'Pregled svih narudžbi i rezervacija', N'View all orders and reservations' UNION ALL
		SELECT N'CreateAccount_Benefits_Profile', N'Jednostavna promjena podataka u profilu', N'Simple change of profile data' UNION ALL
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
		SELECT N'CreditCard_ManagedAccountNote', N'Obavijest: Samo nepretplaćena US Viza ili Mastercard debitne kartice su podržane.', N'Note: Only a non-prepaid US Visa or MasterCard debit cards are supported.' UNION ALL
		SELECT N'CreditCard_MonthValidation', N'Datum isteka kartice je prazan. Unesite datum isteka kartice.', N'Expiration Month is empty. Enter Expiration Month.' UNION ALL
		SELECT N'CreditCard_Note', N'Obavijest : Uneseno ime i prezime se mora podudarati s imenom i prezimenom na kartici.', N'NOTE: Your name must match the name on your credit card' UNION ALL
		SELECT N'CreditCard_Number', N'Broj Kartice', N'Card Number' UNION ALL
		SELECT N'CreditCard_NumberValidation', N'Broj kreditne kartice je prazan. Unesite broj kreditne kartice.', N'Credit Card Number is empty. Enter Credit Card Number.' UNION ALL
		SELECT N'CreditCard_StateValidation', N'Država je prazna. Unesite državu', N'State is empty. Enter State.' UNION ALL
		SELECT N'CreditCard_StreetValidation', N'Adresa ulice je prazna. Unesite adresu ulice.', N'Street is empty. Enter Street.' UNION ALL
		SELECT N'CreditCard_YearValidation', N'Godina isteka kartice je prazna. Unesite godinu isteka kartice.', N'Expiration Year is empty. Enter Expiration Year.' UNION ALL
		SELECT N'CreditCard_ZipValidation', N'Poštanski broj je prazan. Unesite poštanski broj.', N'Zip is empty. Enter Zip.' UNION ALL
		SELECT N'Data_Address_Additional_Info', N'Stan, zgrada, kat itd.', N'Apartment, Suit, Unit etc. (optional)' UNION ALL
		SELECT N'Data_All', N'Sve', N'All' UNION ALL
		SELECT N'Data_AllCategories', N'Sve kategorije', N'All Categories' UNION ALL
		SELECT N'Data_Booked', N'Rezervirano', N'Booked' UNION ALL
		SELECT N'Data_Bookings', N'Rezervacije', N'Bookings' UNION ALL
		SELECT N'Data_BreakEndTIme', N'Kraj pauze', N'Break end time' UNION ALL
		SELECT N'Data_BreakStartTime', N'Početak pauze', N'Break start time' UNION ALL
		SELECT N'Data_BreakTimeByMinutes', N'Pauza po minutama', N'Break By Minutes' UNION ALL
		SELECT N'Data_City', N'Grad', N'City' UNION ALL
		SELECT N'Data_CompletedOrders', N'Ukupno naručeno iznos', N'Completed Orders' UNION ALL
		SELECT N'Data_ContractDate', N'Datum po ugovoru', N'Date by contract' UNION ALL
		SELECT N'Data_Country', N'Zemlja', N'Country' UNION ALL
		SELECT N'Data_CurrentBalance', N'Trenutno stanje', N'Current Balance' UNION ALL
		SELECT N'Data_DaysOfWeek', N'Dani u tjednu', N'Days of Week' UNION ALL
		SELECT N'Data_Deposits', N'Ukupno plaćeno', N'Deposits' UNION ALL
		SELECT N'Data_Description', N'Opis', N'Description' UNION ALL
		SELECT N'Data_EventDate', N'Datum događaja', N'Event Date' UNION ALL
		SELECT N'Data_EventEndTime', N'Završno vrijeme', N'End Time' UNION ALL
		SELECT N'Data_EventEntriesAdd', N'Dodaj događaje', N'Add Event Entries' UNION ALL
		SELECT N'Data_EventLocation', N'Mjesto događaja', N'Event Location' UNION ALL
		SELECT N'Data_EventSettings', N'Postavke događaja', N'Event Settings' UNION ALL
		SELECT N'Data_EventStartTime', N'Početno vrijeme', N'Start Time' UNION ALL
		SELECT N'Data_EventType', N'Tip', N'Type' UNION ALL
		SELECT N'Data_FirstName', N'Ime', N'First Name' UNION ALL
		SELECT N'Data_Friday', N'Petak', N'Friday' UNION ALL
		SELECT N'Data_ID', N'ID', N'ID' UNION ALL
		SELECT N'Data_Image', N'Slika', N'Image' UNION ALL
		SELECT N'Data_LastName', N'Prezime', N'Last Name' UNION ALL
		SELECT N'Data_Login', N'Prijavite se', N'Login' UNION ALL
		SELECT N'Data_MyAccount', N'Moj račun ', N'My Account' UNION ALL
		SELECT N'Data_Monday', N'Ponedjeljak', N'Monday' UNION ALL
		SELECT N'Data_Month', N'Mjesec', N'Month' UNION ALL
		SELECT N'Data_NotBooked', N'Nije rezerviran', N'Not booked' UNION ALL
		SELECT N'Data_Orders', N'Narudžbe', N'Orders' UNION ALL
		SELECT N'Order_Details_Message', N'Detalje vaše narudžbe možete pogledati u nastavku', N'See your order details below' UNION ALL
		SELECT N'Data_Payment', N'Plaćanje', N'Payment' UNION ALL
		SELECT N'Data_PeriodEndDate', N'Kraj razdoblja', N'Period end date' UNION ALL
		SELECT N'Data_PeriodStartDate', N'Početak razdoblja', N'Period start date' UNION ALL
		SELECT N'Data_Price', N'Cijena', N'Price' UNION ALL
		SELECT N'Data_PriceAfterDiscount', N'Cijena nakon rabata', N'Price after discount' UNION ALL
		SELECT N'Data_Repeat', N'Ponovi', N'Repeat' UNION ALL
		SELECT N'Data_RepeatCustom', N'Custom', N'Custom' UNION ALL
		SELECT N'Data_RepeatDaily', N'Dnevni', N'Daily' UNION ALL
		SELECT N'Data_RepeatEvery', N'Svaki', N'Every' UNION ALL
		SELECT N'Data_Reviews', N'Recenzije ({0})', N'Reviews ({0})' UNION ALL
		SELECT N'Data_Saturday', N'Subota', N'Saturday' UNION ALL
		SELECT N'Data_Selected', N'Odabrano', N'Selected' UNION ALL
		SELECT N'Data_ShiftEndTime', N'Kraj smjene', N'Shift end time' UNION ALL
		SELECT N'Data_ShiftStartTime', N'Početak smjene', N'Shift start time' UNION ALL
		SELECT N'Data_Shipping', N'Troškovi dostave', N'Shipping' UNION ALL
		SELECT N'Data_StateProvince', N'Država/Provincija', N'State/Province' UNION ALL
		SELECT N'Data_Street', N'Ulica', N'Street' UNION ALL
		SELECT N'Data_Sunday', N'Nedjelja', N'Sunday' UNION ALL
		SELECT N'Data_Thursday', N'četvrtak', N'Thursday' UNION ALL
		SELECT N'Data_TotalAfterDiscount', N'Ukupno nakon rabata', N'Total after discount' UNION ALL
		SELECT N'Data_Tuesday', N'Utorak', N'Tuesday' UNION ALL
		SELECT N'Data_Wednesday', N'Srijeda', N'Wednesday' UNION ALL
		SELECT N'Data_Year', N'Godina', N'Year' UNION ALL
		SELECT N'Data_Your_Order', N'Vaša narudžba', N'Your Order' UNION ALL
		SELECT N'Data_ZipPostal', N'Poštanski broj', N'Zip/Postal' UNION ALL
		SELECT N'Default_Sorting', N'Zadano sortiranje', N'Default sorting' UNION ALL
		SELECT N'Details_StatementTitle', N'Detalji', N'Details' UNION ALL
		SELECT N'Email_has_been_sent_Warning', N'E-mail obavijesti o kupnji uspješno je poslana korisniku: {0}', N'Purchase notification e-mail has been successfully sent for member: {0}' UNION ALL
		SELECT N'Email_has_not_sent_Warning', N'Notifikacijski mail o izradi računa nije poslan', N'Creating an account notification e-mail has not been sent' UNION ALL
		SELECT N'Error_ChargingAccount', N'Došlo je do greške prilikom naplate!', N'There Was an error while charging account!' UNION ALL
		SELECT N'Error_EmailData', N'Ne postoji email podatak', N'There is no Email data!' UNION ALL
		SELECT N'Error_EmailFormatInvalid', N'Nepodržani email format!', N'Invalid Email format!' UNION ALL
		SELECT N'Error_EnterCorrectPrice', N'Molimo unesite točnu cijenu! Minimalna cijena je {0:N2}!', N'Please enter correct price! Minimum price is {0:N2}!' UNION ALL
		SELECT N'Error_EntryOverlaping', N'Ulaz za datum {0:d} se preklapa s već postojećim!', N'Entry for date {0:d} overlaps existing!' UNION ALL
		SELECT N'Error_EventBooked', N'Događaj {0} je već rezerviran!', N'Event {0} is already booked!' UNION ALL
		SELECT N'Error_EventDelete', N'Došlo je do pogreške prilikom brisanja stavki događaja!', N'There was an error while deleting Event Entries!' UNION ALL
		SELECT N'Error_EventEntrySaving', N'Došlo je do pogreške prilikom snimanja stavki događaja!', N'There was an error while save Event entry!' UNION ALL
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
		SELECT N'Error_PriceNotDefined', N'Događaj nije definiran u Proizvodima!', N'Event is not defined in Products!' UNION ALL
		SELECT N'Error_SendingEmail', N'Došlo je do pogreške prilikom slanja email-a!', N'There was an error while sending email!' UNION ALL
		SELECT N'Error_TokenDataInvalid', N'Neispravan token!', N'Invalid Token data!' UNION ALL
		SELECT N'ErrorMessage_MaxFieldSize', N'Maksimalna veličina ''{0}'' polja je {1}!', N'The maximum field size for a ''{0}'' field is {1}!' UNION ALL
		SELECT N'Error_while_saving_Warning', N'Došlo je do pogreške prilikom spremanja podataka', N'There was an error while saving Company data.' UNION ALL
		SELECT N'Event_Description', N'{0:d} {0:HH:mm} - {1:HH:mm}', N'{0:d} {0:HH:mm} - {1:HH:mm}' UNION ALL
		SELECT N'Event_PageTitle', N'{0} - Postavke događaja', N'{0} - Event Settings' UNION ALL
		SELECT N'Existing_user', N'Postojeći korisnik?', N'Existing user?' UNION ALL
		SELECT N'Featured_Products', N'Izdvojeni proizvodi', N'Featured Products' UNION ALL
		SELECT N'File_Manager', N'Upravitelj datoteka', N'File Manager' UNION ALL
		SELECT N'File_name', N'Naziv datoteke', N'File name' UNION ALL
		SELECT N'File_Size', N'Veličina', N'Size' UNION ALL
		SELECT N'Filter_Top', N'Poredaj po ocjenama', N'Sort by average rating' UNION ALL
		SELECT N'Filter_MaxPrice', N'S višom cijenom', N'Sort by price: high to low' UNION ALL
		SELECT N'Filter_MinPrice', N'S nižom cijenom', N'Sort by price: low to high' UNION ALL
		SELECT N'Filter_Latest', N'Najnovije', N'Sort by newness' UNION ALL
		SELECT N'Filter_MostPopular', N'Poredaj po popularnosti', N'Sort by popularity' UNION ALL
		SELECT N'Filter_by_price', N'Filtriraj po cijeni', N'Filter by price' UNION ALL
		SELECT N'Footer_About_Us', N'O nama', N'About us' UNION ALL
		SELECT N'Footer_Complaints', N'Reklamacije', N'Complaints' UNION ALL
		SELECT N'Footer_Cookie_Statement', N'Izjava o kolačićima', N'Cookie Statement' UNION ALL
		SELECT N'Footer_Delivery_Terms', N'Uvjeti dostave', N'Terms of delivery' UNION ALL
		SELECT N'Footer_Instructions', N'Uputstva', N'Instructions' UNION ALL
		SELECT N'Footer_Legal_Entity', N'Pravne osobe', N'Legal entity' UNION ALL
		SELECT N'Footer_My_Account', N'Moj račun', N'My account' UNION ALL
		SELECT N'Footer_Order_History', N'Povijest narudžbi', N'Order History' UNION ALL
		SELECT N'Footer_Payment_Method', N'Način plaćanja', N'Method of payment' UNION ALL
		SELECT N'Footer_Payment_Security', N'Sigurnost plaćanja', N'Security of payments' UNION ALL
		SELECT N'Footer_Privacy_Statement', N'Izjava o privatnosti', N'Privacy Statement' UNION ALL
		SELECT N'Footer_Terms_of_Use', N'Uvjeti korištenja', N'Terms of use' UNION ALL
		SELECT N'Footer_Useful', N'Korisno', N'Useful' UNION ALL
		SELECT N'Footer_Useful_Questions', N'Korisna pitanja', N'Useful questions' UNION ALL
		SELECT N'Info_NoItems', N'Pretraga je neuspješna. Ne postoji takav artikl/proizvod.', N'No items match your search!' UNION ALL
		SELECT N'Info_SearchResult', N'{0} rezultata odgovara vašoj potrazi.', N'{0} results match your serch' UNION ALL
		SELECT N'Invalid_Card_Number', N'Pogrešan broj kartice. Molimo unesite ispravan broj', N'Credit Card Number is invalid. Enter valid Credit Card Number.' UNION ALL
		SELECT N'Image_IsCover', N'Naslovna slika', N'Is Cover' UNION ALL
		SELECT N'Link_Copy_Text', N'Kopiraj link', N'Copy link' UNION ALL
		SELECT N'ManagedAccount_Default', N'Standardan', N'Default' UNION ALL
		SELECT N'Manufacturer_Title', N'Proizvođači', N'Manufacturer' UNION ALL
		SELECT N'Member_already_subscribed', N'Već ste preplaćeni na {0}. Ako želite obnoviti preplatu ili imate više pitanja molimo kontaktirajte našu podršku.', N'You are already subscribed to {0}. If you want to renew your subscription or have more questions, please contact our support.' UNION ALL
		SELECT N'Membership_SignIn', N'Prijava', N'Sign In' UNION ALL
		SELECT N'Message_AddedToBasket', N'Dodano u košaricu.', N'Added to basket.' UNION ALL
		SELECT N'Message_AddedToFavorites', N'Dodano u favorite.', N'Added to favorites.' UNION ALL
		SELECT N'Message_AlredyPosted', N'Već ste objavili.', N'You have already posted.' UNION ALL
		SELECT N'Message_AlredyRated', N'Već ste ocjenili.', N'You have already rated.' UNION ALL
		SELECT N'Message_Favorites_UnauthorizedAccess', N'Molimo <a href="/signin"> Prijavite se </a> ili <a href="/signup">Registrajte se </a> da bi dodali u omiljeno.', N'Please <a href="/signin"> Sign In</a> or <a href="/signup">Sign Up</a> to add to favorites.' UNION ALL
		SELECT N'Message_Rating', N'Zahvaljujemo na ocjeni.', N'Thank you for rating!' UNION ALL
		SELECT N'Message_RemovedFromBasket', N'Uklonjeno iz košarice.', N'Removed from basket.' UNION ALL
		SELECT N'Message_RemovedFromFavorites', N'Uklonjeno iz favorita.', N'Removed from favorites.' UNION ALL
		SELECT N'Message_Success_ChangedSettings', N'Vaše postavke su promjenjene!', N'Your settings have been changed!' UNION ALL
		SELECT N'Message_Store_UnauthorizedAccess', N'Već postoji račun s tom email adresom. Molimo <a href="/signin">prijavite se </a> ili <a href="/signup"> </a> da bi nastavili s narudžbom.', N'An account with this email already exists. Please <a href="/signin">Sign In</a> to proceed to checkout.' UNION ALL
		SELECT N'New_Customer_message', N'Ja sam novi kupac', N'I am a new customer' UNION ALL
		SELECT N'Orders', N'Narudžbe', N'Orders' UNION ALL
		SELECT N'Order_number', N'Vaš broj narudžbe je', N'Your order number is' UNION ALL
		SELECT N'Option_Country', N'Odaberite vašu državu', N'Please, select your country' UNION ALL
		SELECT N'Package_Delivery_Message', N'U slučaju kupovine nekoliko proizvoda s različitim rokovima dostave, rok dostave kompletne narudžbe jednak je onom roku s dužim rokom. Iz razloga kvalitetnije organizacije, kompletiranja narudžbe i isporuke proizvoda u dogovorenom roku.', N'In the case of purchasing several products with different delivery deadlines, delivery deadline for the complete order is the same as the longer term.' UNION ALL
		SELECT N'Package_Discount_Price', N'Akcijska cijena', N'Discount Price:' UNION ALL
		SELECT N'Package_FreeDeliveryCRO', N'Dostava je besplatna unutar Hrvatske!', N'Shipping is free within Croatia!' UNION ALL
		SELECT N'Package_Lowest_Price', N'Naša najniža cijena:', N'Lowest price:' UNION ALL
		SELECT N'Package_Regular_Price', N'Naša Redovna cijena:', N'Regular Price:' UNION ALL
		SELECT N'Pay_Order', N'Plati narudžbu', N'Pay the order' UNION ALL
		SELECT N'Payment_BookingOrderText', N'Plaćanje za red rezervacije: {0}', N'Payment for Booking order: {0}' UNION ALL
		SELECT N'Payment_ChooseCreditCard', N'Odaberi kreditnu karticu', N'Choose your credit card' UNION ALL
		SELECT N'Payment_Cancel_Title', N'Plaćanje prekinuto', N'Payment Cancel' UNION ALL
		SELECT N'Payment_Complete_Message', N'Uspješno plaćanje', N'Your payment has been completed.' UNION ALL
		SELECT N'Payment_InstalmentNumber', N'Broj rata', N'Instalment Number' UNION ALL
		SELECT N'Payment_InstalmentPayment', N'Plaćanje na rate', N'Instalment Payment' UNION ALL
		SELECT N'Payment_OneTima_Pay', N'Jednokratno plaćanje', N'One-Time Pay' UNION ALL
		SELECT N'Payment_Complete_Title', N'Završetak plaćanja', N'Payment Complete' UNION ALL
		SELECT N'Payment_CreditCardsAccepted', N'Prihvaćene kreditne kartice', N'Credit Cards accepted' UNION ALL
		SELECT N'Payment_Delivery', N'Pouzeće', N'Delivery' UNION ALL
		SELECT N'Payment_Error_Title', N'Pogreška u procesu plaćanja', N'Payment Error' UNION ALL
		SELECT N'Payment_MainHeading', N'Nova narudžba', N'New Order' UNION ALL
		SELECT N'Payment_MainHeadingText', N'Koristite formu ispod da bi poslali informacije o kreditnoj kartici', N'Use the form below to submit your credit card information.' UNION ALL
		SELECT N'Payment_NewCreditCard', N'Nova kreditna kartica', N'New Credit Card' UNION ALL
		SELECT N'Payment_PageTitle', N'Naružba', N'Order' UNION ALL
		SELECT N'Payment_Complete_Message', N'Vaša narudžba je završena', N'Your payment has been completed' UNION ALL
		SELECT N'Payment_Order_Number', N'Vaš broj narudžbe je', N'Your order number is' UNION ALL
		SELECT N'Payment_Process_Problem', N'Došlo je do problema tijekom postupka plaćanja. Molimo pokušajte ponovno. Ako se ta pogreška nastavi, kontaktirajte podršku.', N'A problem has occurred during the payment process. Please try again. If this error continues, please contact support.' UNION ALL
		SELECT N'Payment_Reques_Cancel', N'Otkaži zahtjev za plaćanjem', N'Cancel Payment Reques' UNION ALL
		SELECT N'Payment_Rules_Message', N'Odabir kartica i broja rata je informativnog karaktera, plaćanje će se izvršiti na idućem koraku gdje odabirete karticu kojom ćete platiti kao i željeni broj rata.', N'Selecting a card and installment number is informative, payment will be made at the next step where you select a card to pay as well as the desired number of installments.' UNION ALL
		SELECT N'Payment_Total', N'TOTAL: ${0:N2}', N'TOTAL: ${0:N2}' UNION ALL
		SELECT N'Payment_Wire_Transfer', N'Virman', N'Wire Transfer ' UNION ALL
		SELECT N'Proceed_to_Checkout', N'Dovrši narudžbu', N'Proceed to Checkout' UNION ALL
		SELECT N'Product_IsFeatured', N'Istaknuto', N'Featured' UNION ALL
		SELECT N'Product_Image', N'Slika', N'Image' UNION ALL
		SELECT N'Product_Height', N'Visina', N'Height' UNION ALL
		SELECT N'Product_Length', N'Dužina', N'Length' UNION ALL
		SELECT N'Product_Weight', N'Težina', N'Weight' UNION ALL
		SELECT N'Product_Width', N'Širina', N'Width' UNION ALL
		SELECT N'Privacy_Policy_Agree', N'Pročitao sam i suglasan sam s', N'I read and agree with' UNION ALL
		SELECT N'Privacy_Policy_Message', N'Izjavom o privatnosti', N'Statement of Privacy' UNION ALL
		SELECT N'Purchase_app_Warning', N'Za kupovinu ove stavke potrebno je prvo kupiti aplikaciju', N'You must first purchase an Application before you can buy this item.' UNION ALL
		SELECT N'Purchase_Notification_Warning', N'Došlo je do pogreške tijekom slanja e-pošte obavijesti o kupnji. Obratite se administratoru.', N'There was an error while sending Purchase notification e-mail. Please contact your Administrator.' UNION ALL
		SELECT N'Registered_Users', N'Registriranih korisnika', N'Registered users' UNION ALL
		SELECT N'Remove_From_Wishlist_Text', N'Ukloni iz liste želja', N'Remove from wishlist' UNION ALL
		SELECT N'Referral_Bonus', N'Bonus', N'Bonus' UNION ALL
		SELECT N'Referral_Level', N'Razina', N'Level' UNION ALL
		SELECT N'Referral_Level_0', N'Razina 0', N'Level 0' UNION ALL
		SELECT N'Referral_Level_1', N'Razina 1', N'Level 1' UNION ALL
		SELECT N'Referral_Level_2', N'Razina 2', N'Level 2' UNION ALL
		SELECT N'Referral_Level_3', N'Razina 3', N'Level 3' UNION ALL
		SELECT N'Referral_Level_4', N'Razina 4', N'Level 4' UNION ALL
		SELECT N'Referral_Level_5', N'Razina 5', N'Level 5' UNION ALL
		SELECT N'Referrals_Member', N'Broj članova', N'Number of referrals' UNION ALL
		SELECT N'Referral_Members_Rule_Message', N'Bonus od kupovine korisnika koje ste pozvali u Superklub (Superbonus). Može se koristiti nakon što aktivirate virtualni novčanik, svojom kupovinom unutar 365 dana. Niste još obavili kupovinu.', N'You still miss {0} members in the team to be able to use Superbonus. <br /> Minimum number of members = 1' UNION ALL
		SELECT N'Referral_Purchases_Rule_Message', N'Bonus ostvarujete od kupovine. Do sada niste obavili kupovinu.', N'You get a bonus from buying. So far, you did not make a purchase.' UNION ALL
		SELECT N'Referrals_Realized_Sales', N'Ostvarenih prodaja', N'Realized sales' UNION ALL
		SELECT N'Reward_points', N'Virtualni novčanik', N'Virtual Wallet' UNION ALL
		SELECT N'SearchResults_Headline', N'Pronađi sve za vjenčanje u vašem gradu.', N'Find everything for a wedding in your city.' UNION ALL
		SELECT N'Success_EventDeleted', N'Stavke događaja uspješno obrisane!', N'Event Entries successfully deleted!' UNION ALL
		SELECT N'Success_EventEntrySaved', N'Stavke događaja uspješno snimljene!', N'Event entries successfully saved.' UNION ALL
		SELECT N'TipsForNewlyweds_Title', N'Savjeti za nove mladence', N'Tips for Newlyweds' UNION ALL
		SELECT N'Update_Cart', N'Osvježi košaricu', N'Update Cart' UNION ALL
		SELECT N'Validation_BreakEndTimeInvalid', N'Neispravni završetak pauze.', N'Invalid Break end time!' UNION ALL
		SELECT N'Validation_BreakStartTimeGreater', N'Početno vrijeme za pauzu je veće nego završno vrijeme!', N'Start time for Break is greater than end time!' UNION ALL
		SELECT N'Validation_BreakStartTimeInvalid', N'Neispravno početno vrijeme pauze!', N'Invalid Break start time!' UNION ALL
		SELECT N'Validation_BreakTimeLonger', N'Pauza je duža nego vrijeme smjene!', N'Break time is longer than Shift time!' UNION ALL
		SELECT N'Validation_BreakTimePeriodInvalid', N'Neispravno razdoblje pauze!', N'Invalid Break time period!' UNION ALL
		SELECT N'Validation_BreatTimeNotEntered', N'Vrijeme pauze za postavke nije unešeno!', N'Break time for settings is not entered!' UNION ALL
		SELECT N'Validation_CustomDatesNotSelected', N'Molimo odaberite datume.', N'Please select custom Dates.' UNION ALL
		SELECT N'Validation_DaysOfWeekNotSelected', N'Dani u tjednu nisu označeni!', N'Days of Week are not selected!' UNION ALL
		SELECT N'Validation_MemberData', N'Neispravan podatak korisnika!', N'Invalid Member Data!' UNION ALL
		SELECT N'Validation_MemberID', N'Neispravan korisnički ID!', N'Invalid Member ID!' UNION ALL
		SELECT N'Validation_NumberOfTicketsNotEntered', N'Broj kupaca nije unešen!', N'Number of Customers is not entered!' UNION ALL
		SELECT N'Validation_PeriodEndDateOverlapping', N'Završni datum za odabrano razdoblje se preklapa s postojećim stavkama događaja!', N'End date for selected period is overlapping existing Event entries!' UNION ALL
		SELECT N'Validation_PeriodStartDateGreater', N'Početni datum za razdoblje je veći nego završni datum!', N'Start date for period is greater than end date!' UNION ALL
		SELECT N'Validation_PeriodStartDateOverlapping', N'Početni datum za razdoblje se preklapa s postojećim stavkama događaja!', N'Start date for selected period is overlapping existing Event entries!' UNION ALL
		SELECT N'Validation_Post_Unauthorized', N'Nemate ovlasti da biste objavili ovu poruku!', N'You are not authorized to post this message!' UNION ALL
		SELECT N'Validation_PriceNotEntered', N'Cijena nije unesena!', N'Prise is not entered!' UNION ALL
		SELECT N'Validation_ProductSelect', N'Molimo odaberite proizvod.', N'Please select Product.' UNION ALL
		SELECT N'Validation_Rating', N'Ocjena je obavezna. Molimo ocjenite.', N'Rating is required. Please rate.' UNION ALL
		SELECT N'Validation_RefferalBonus', N'Molimo vas da unesete odgovarajući bonus', N'Please enter a valid referral bonus amount' UNION ALL
		SELECT N'Validation_SelectedPeriodOverlapping', N'Odabrano razdoblje se preklapa s već postojećim!', N'Selected Period is overlapping existing!' UNION ALL
		SELECT N'Validation_ShiftStartTimeGreater', N'Početno vrijeme smjene je veće nego završno vrijeme!', N'Start time for Shift is greater than end time!' UNION ALL
		SELECT N'Validation_ShiftTimePeriodInvalid', N'Neispravno razdoblje vremena smjene!', N'Invalid Shift time period!' UNION ALL
		SELECT N'Validation_VendorSetting_Success', N'Postavke poduzeća su promjenjena!', N'Company settings have been changed!' UNION ALL
		SELECT N'Validation_VendorSetting_Warning', N'Došlo je do pogreške prilikom snimanja promjena. Molimo pokušajte ponovno!', N'An error has been occurred during saving changes. Please try again!' UNION ALL
		SELECT N'VedorRegistration_Email_Content_AdvancedRegistration', N'Uspješno ste dodali vaše poduzeće u Vendor direktorij! Status vašeg paketa oglašavanja je <strong>Besplatno osnovno</strong> izlistanje.<br/>Nakon što primimo uplatu, unutar 24 sata status vašeg oglašivačkog paketa će biti promjenjen  <strong>{0}</ strong> listu.<br/><br/>Hvala Vam što oglašavate vaše poduzeće na {1}.', N'You have successfully added your company in the Vendor Directory! Status of your advertising package is <strong>Free Basic</strong> listing.<br/>After we receive the payment, within 24 hours Status of your advertising package will be changed to <strong>{0}</ strong> listing.<br/><br/>Thank you for advertising your Company on the {1}.' UNION ALL
		SELECT N'Vendor_Contact_Headline_LeaveMessage', N'Ostavite poruku', N'Leave a message' UNION ALL
		SELECT N'Vendor_Contact_Headline_WriteReview', N'Napišite recenziju', N'Write your Review' UNION ALL
		SELECT N'Vendor_Contact_Placeholder_WriteMessage', N'Napišite poruku...', N'Write a message...' UNION ALL
		SELECT N'Vendor_Contact_Subtitle', N'Kontakt {0}.<br />Email će biti poslan na sljedeće email adrese: {1}', N'Contact {0}.<br />E-mail will be sent to the following email address: {1}' UNION ALL
		SELECT N'Vendor_Link_Registration', N'Vendor registracija', N'Vendor Registration' UNION ALL
		SELECT N'Vendor_Link_Registration_Tooltip', N'Besplatno se registrirajte te budite objavljeni danas! Razvijajte vaše poslovanje s : {ApplicationTitle}.', N'Sign Up for free and get listed today! Grow your business with {ApplicationTitle}.' UNION ALL
		SELECT N'Vendor_Literal_RateFirst', N'Prvo ocjenite', N'Rate it first' UNION ALL
		SELECT N'Vendor_Literal_Rating', N'Ocjena : {0}/5', N'Rating: {0}/5' UNION ALL
		SELECT N'Vendor_Literal_RatingNumOfUsers', N'od {0} korisnika', N'from {0} users' UNION ALL
		SELECT N'Vendor_Literal_Views', N'Pogleda {0}', N'Views {0}' UNION ALL
		SELECT N'Vendor_RelatedContent_Title', N'Istaknuta poduzeća', N'Featured Companies' UNION ALL
		SELECT N'Vendor_Review_Placeholder_WriteRevew', N'Napišite recenziju...', N'Write a review...' UNION ALL
		SELECT N'VendorDirectory_Title', N'Vendor direktorij', N'Vendor Directory' UNION ALL
		SELECT N'VendorRegistration_Button_NextStep', N'Sljedeći korak', N'Next Step' UNION ALL
		SELECT N'VendorRegistration_Button_PreviousStep', N'Prijašnji korak', N'Previous Step' UNION ALL
		SELECT N'VendorRegistration_FirstStep_Subtitle', N'Vendor registracija sadržava 4 koraka.<br /><strong>Obavijest:</strong>Sva polja označena <strong style=color: #F86DA8;">*</strong> su obavezna.', N'Vendor registration screen consists of four steps.<br /><strong>Note:</strong> All fields marked <strong style=color: #F86DA8;">*</strong> are required.' UNION ALL
		SELECT N'VendorRegistration_FourStep_Subtitle', N'Upload logo Vašeg poduzeća. Klik na dugme "Traži" ili "Odaberi datoteku" te odaberite datoteku s Vašeg računala.<br />Ukoliko nemate logo poduzeća, možete ovo napraviti kasnije!', N'Upload your company logo. Click on the button Browse" or "Choose File" and select the file from your computer.<br />If you currently don''t have a company logo, you can do this later!' UNION ALL
		SELECT N'VendorRegistration_Message_Success', N'Uspješno ste dodali poduzeće u Vendor Direktorij!<br />Možete urediti postavke poduzeća koristeći link <a href="{0}">link</ a>.', N'You have successfully added your company to the Vendor Directory!<br/>You can edit your company information using the following <a href="{0}">link</ a>.' UNION ALL
		SELECT N'VendorRegistration_Message_SuccessShort', N'Uspješno ste dodali poduzeće u Vendor Direktorij!', N'You have successfully added your company to the Vendor Directory!' UNION ALL
		SELECT N'VendorRegistration_SecStep_Subtitle', N'Unesite ime poduzeća ili agencije te odaberite odgovarajuću kategoriju.<br />Ovo je dobro mjesto gdje će Vam biti objašnjeno zašto parovi trebaju odabrati vaš proizvod ili uslugu.',N'Enter the name of your company or agency and select the corresponding category.<br />This is also good place where you can briefly explain why the couples should select your products or services.' UNION ALL
		SELECT N'VendorRegistration_ThirdStep_Subtitle', N'Preporučljivo je da unesete adresu, lokaciju, telefon, fax, mobitel , email i/ili web adresu.<br />Svi podaci će biti vidljivi posjetiteljima portala.<br />', N'We recommend you to enter your address, location, phone, fax, mobile, e-mail or Web address.<br />All data will be visible to visitors of our portal.' UNION ALL
		SELECT N'Vlidation_UploadLogo_Format', N'Molimo uploadajte logo u sljedećem formatu: {0}.', N'Please upload a logo in one of the following formats {0}.' UNION ALL
		SELECT N'Vlidation_UploadLogo_Size', N'Maksimalna veličina loga je 1MB', N'Maximum size of the logo is 1MB' UNION ALL
		SELECT N'Widget_LatestArticles_Headline', N'Zadnji članci', N'Latest Articles' UNION ALL
		SELECT N'Widget_Newsletter_Description', N'Pretplatite se na naš Newsletter da bi ste dobili Važne obavijesti i odlične promotivne ponude.', N'Subscribe to Our Newsletter to get Important News, Amazing Offers & Inside Scoops.' UNION ALL
		SELECT N'Widget_Newsletter_Headline', N'Prijava na newsletter', N'Newsletter Singup' UNION ALL
		SELECT N'Widget_RelatedFeeds_Title', N'Vezani feeds', N'Related Feeds' UNION ALL
		SELECT N'Error_CreatingCustomer', N'Došlo je do greške prilikom kreiranja Kupca.', N'There was an error while creating customer.' UNION ALL
		SELECT N'Error_CreatingCreditCard', N'Došlo je do greške prilikom kreiranja Kreditne Kartice.', N'There was an error while creating credit card.' UNION ALL
		SELECT N'Error_CreatingMember', N'Došlo je do greške prilikom kreiranja Korisnika.', N'There was an error while creating Member.' UNION ALL
		SELECT N'Error_CreatingMemberToken', N'Došlo je do greške prilikom kreiranja Korisničkog Tokena.', N'There was an error while generating Member Token.' UNION ALL
		SELECT N'Partner_Companies', N'Tvrtke partnera', N'Partner companies' UNION ALL
		SELECT N'Payment_Bank_Transfer_Warning', N'Nakon što dovršite narudžbu na e-mail će vam biti poslani podaci za uplatu narudžbe. Kada vaša uplata bude evidentirana pokrenut će se proces isporuke narudžbe.', N'Once you have completed your order, you will receive the order details to e-mail. When your payment is recorded, the order delivery process will be launched' UNION ALL
		SELECT N'Payment_Credit_Card_Warning', N'Plati bankovnom karticom. TEST MOD JE OMOGUĆEN. U test modu možete koristiti broj kartice 0000 0000 0000 0000 sa bilo kojim CVC brojem kao i podacima o isteku kartice.', N'Pay with your credit card. TEST MODE ENABLED. In test mode, you can use the card number 0000 0000 0000 0000 with any CVC and a valid expiration date.' UNION ALL
		SELECT N'Payment_Info_Warning', N'Plati općom uplatnicom. Molimo vas koristite ID narudžbe kao referencu za plaćanje. Vaša narudžba neće se isporučiti sve dok su sredstva na vašem računu.', N'Make your payment directly into our bank account. Please use your Order ID as the payment reference. Your order won’t be shipped until the funds have cleared in our account.' UNION ALL
		SELECT N'PaymentSettings_PaymentCancelURL', N'Povratna adresa nakon odustajana', N'Cancel URL' UNION ALL
		SELECT N'PaymentSettings_PaymentEnviroment', N'Razvojno okruženje', N'Enviroment' UNION ALL
		SELECT N'PaymentSettings_PaymentGateway', N'Portal za Plaćanja', N'Payment Gateway' UNION ALL
		SELECT N'PaymentSettings_PaymentGatewayURL', N'Adresa za plaćanje', N'Payment Gateway URL' UNION ALL
		SELECT N'PaymentSettings_PaymentPrivateKey', N'Privatni Ključ za Plaćanja', N'Payment Private Key' UNION ALL
		SELECT N'PaymentSettings_PaymentPublicKey', N'Javni Ključ za Plaćanja', N'Payment Public Key' UNION ALL
		SELECT N'PaymentSettings_PaymentReturnErrorURL', N'Povratna adresa neuspješne autorizacije', N'Error URL' UNION ALL
		SELECT N'PaymentSettings_PaymentReturnURL', N'Povratna adresa uspješne autorizacije', N'Return URL' UNION ALL
		SELECT N'PaymentSettings_PaymentMerchantID', N'Trgovac ID za Plaćanja', N'Payment Merchant ID' UNION ALL
		SELECT N'Procesing_Payment', N'U OBRADI...', N'PROCESSING...' UNION ALL
		SELECT N'Product_Availability', N'Stanje na skladištu', N'Availability' UNION ALL
		SELECT N'Product_Description', N'Opis proizvoda', N'Product Description' UNION ALL
		SELECT N'Product_Reviews', N'Recenzije', N'Reviews' UNION ALL
		SELECT N'Save_Info_Warning', N'Spremi adresu i informacije za sljedeći puta', N'Save my address and info for next time' UNION ALL
		SELECT N'Select_Country_Title', N'Izaberite državu.', N'Please, select your country.' UNION ALL
		SELECT N'Share_Product_Title', N'Podijeli proizvod', N'Share this product' UNION ALL
		SELECT N'Share_ReferralLink_Title', N'Podijeli svoj jedinstveni referal link', N'Share your uniqoue referral link' UNION ALL
		SELECT N'Shop_Title', N'Trgovina', N'Shop' UNION ALL
		SELECT N'Signin_New_Customer', N'Novi korisnik', N'New Customer' UNION ALL
		SELECT N'Signin_Returning_Customer', N'Postojeći korisnik', N'Returning Customer'UNION ALL
		SELECT N'Signin_Returning_Customer_message', N'Ja sam postojeći korisnik', N'I am a returning customer' UNION ALL
		SELECT N'Store', N'Trgovina', N'Store'UNION ALL
		SELECT N'Subscription_cancelled', N'Vaša preplata je otkazana', N'Your subscription {0} has been cancelled' UNION ALL
		SELECT N'Table_Purchases_Number', N'Broj kupovina', N'Number of purchases' UNION ALL
		SELECT N'Table_Sum', N'Ukupno', N'Sum' UNION ALL
		SELECT N'Total_Fund', N'Ukupni fond', N'Total fund' UNION ALL
		SELECT N'Trade_Margin', N'Marža', N'Trade Margin' UNION ALL
		SELECT N'Update_All_to_basket', N'Dodaj sve u košaricu', N'Update All to basket' UNION ALL
		SELECT N'User_account', N'Korisnički račun', N'User account' UNION ALL
		SELECT N'User_data', N'Korisnički podaci', N'User data' UNION ALL
		SELECT N'Username_or_email', N'Korisničko ime ili email', N'Username or email' UNION ALL
		SELECT N'Webhooks_Error', N'Pogreška', N'Error' UNION ALL
		SELECT N'Wishlist_Title', N'Lista želja', N'Wishlist' UNION ALL
		SELECT N'Your_Order_Title', N'Vaša narudžba', N'Your Order'
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
