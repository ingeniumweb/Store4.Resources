/*=CONCATENATE("SELECT N'";A1;"', N'";B1;"' UNION ALL")*/
DECLARE @ResourcesTable TABLE (Name VARCHAR (128), Value NVARCHAR (MAX), [Description] NVARCHAR (MAX))

DECLARE @ResourceID INT, @ResourceTypeID INT, @LanguageID INT
DECLARE @Name VARCHAR (128), @Value NVARCHAR (MAX), @Description NVARCHAR (MAX)

SET @ResourceTypeID = NULL
SELECT TOP 1 @ResourceTypeID = ResourceTypeID FROM ResourceTypes WHERE Name = 'GlobalResources'
SET @ResourceTypeID = ISNULL (@ResourceTypeID, 0)

SET @LanguageID = NULL
SELECT TOP 1 @LanguageID = LanguageID FROM Languages WHERE CultureName = 'sr-Latn-RS' --AND IsEnabled = 1
SET @LanguageID = ISNULL(@LanguageID, 0)

IF (@ResourceTypeID > 0 AND @LanguageID > 0) BEGIN
	INSERT INTO @ResourcesTable (Name, Value, [Description])
		SELECT N'Account__SignUp_Headline_Terms', N'Pregled uslova korištenja', N'Review the Terms' UNION ALL
		SELECT N'Account_ActivateAccount_Headline', N'Aktivacija računa', N'Account Activation' UNION ALL
		SELECT N'Account_ActivateAccount_Title', N'Aktivirajte račun', N'Activate your account' UNION ALL
		SELECT N'Account_ActivationRequest_Title', N'Ponovno pošalji zahtjev za aktivaciju', N'Re-send Activation Request' UNION ALL
		SELECT N'Account_ChangeAccountPassword__Link_Change', N'Promijeni lozinku', N'Change Password' UNION ALL
		SELECT N'Account_ChangeAccountPassword_Title', N'Promjenite lozinku računa', N'Change Account Password' UNION ALL
		SELECT N'Account_Controller_AccountBlocked', N'Vaš račun je blokiran.', N'Your account was blocked.' UNION ALL
		SELECT N'Account_Controller_AccountDoesntExist', N'Račun ne postoji.', N'The account doesn''t exist.' UNION ALL
		SELECT N'Account_Controller_AccountLocked', N'Račun je zaključan!', N'The account is locked!' UNION ALL
		SELECT N'Account_Controller_AccountExists', N'Već postoji račun s tom email adresom.', N'The account already exists with that email address' UNION ALL
		SELECT N'Account_Controller_Activated', N'Vaš račun {{name}} je uspješno aktiviran.', N'Your account {{name}} has been activated successfully.' UNION ALL
		SELECT N'Account_Controller_ActivationMailSent', N'Aktivacioni email je poslan. Molimo provjerite vaš inbox ili spam direktorijum.', N'Activation email has been sent. Please check your Inbox or Spam folder.' UNION ALL
		SELECT N'Account_Controller_CantSendNotification', N'Došlo je do greške s slanjem email-a. Administracija je obavještena o ovoj grešci.', N'Something went wrong with sending email notification. Site administration has been notified.' UNION ALL
		SELECT N'Account_Controller_DomainNotAllowed', N'Mail domen nije dozvoljen. Molimo koristite drugu email adresu.', N'The mail domain is not allowed. Please use another e-mail address.' UNION ALL
		SELECT N'Account_Controller_IsActivated', N'Vaš račun je aktiviran.', N'Your account is activated.' UNION ALL
		SELECT N'Account_Controller_NotActivated', N'Vaš račun nije aktiviran.', N'Your account was not activated.' UNION ALL
		SELECT N'Account_Controller_PassChanged', N'Vaša lozinka je promjenjena.', N'Your password has been changed.' UNION ALL
		SELECT N'Account_Controller_ResetPassMail', N'Zahtjev za promjenu lozinke je poslan na email. Molimo provjerite vaš inbox ili spam direktorijum.', N'Reset password email has been sent. Please check your Inbox or Spam folder.' UNION ALL
		SELECT N'Account_Controller_WrongActiveLink', N'Pogrešan aktivacioni link ili je aktivacija istekla.', N'The wrong activation link or activation has been expired.' UNION ALL
		SELECT N'Account_Controller_WrongEmail', N'Nevažeća email adresa.', N'Wrong e-mail address format.' UNION ALL
		SELECT N'Account_Controller_WrongResetPassLink', N'Pogrešan aktivacijski link ili je aktivacija istekla.', N'Wrong reset password link or the link has been expired.' UNION ALL
		SELECT N'Account_Controller_WrongUser', N'Pogrešno korisničko ime ili lozinka.', N'Wrong user name or password.' UNION ALL
		SELECT N'Account_CreateAccount_CreateAccount', N'Kreiraj račun', N'Create your account' UNION ALL
		SELECT N'Account_CreateAccount_Description', N'Unesite detalje računa ispod', N'Enter your account details below' UNION ALL
		SELECT N'Account_CreateAccount_Label_PrivacyTermsConditions', N'Pri registraciji, slažete se s <a href="{0}">Uslovima usluge </a> i <a href="{1}"> polisom privatnosti.</a>.', N'By registering, you agree to our <a href="{0}">Terms of Service</a> and <a href="{1}">Privacy Policy</a>.' UNION ALL
		SELECT N'Account_CreateAccount_Mandatory', N'{0} polje je obavezno, molimo ispunite ga.', N'{0} field is mandatory, please fill it.' UNION ALL
		SELECT N'Account_CreateAccount_NameLooksLikeEmail', N'Vaše korisničko ime previše liči na Vaš email. Molimo promjenite ga.', N'The member''s username looks like an e-mail address. Please change it.' UNION ALL
		SELECT N'Account_CreateAccount_NameNonAlfaNum', N'Korisničko ime sadrži nedozvoljene znakove (#@!$ itd...). Molimo promjenite ga.', N'The username contains non-alpha numeric characters (#@!$ etc...). Please change it.' UNION ALL
		SELECT N'Account_CreateAccount_PasswordIsSame', N'Nova i stara lozinka su iste.', N'New and old password are the same.' UNION ALL
		SELECT N'Account_CreateAccount_PasswordLength', N'Veličina lozinke mora biti najmanje {0} znakova dugačka.', N'The password length must be at least {0} characters long.' UNION ALL
		SELECT N'Account_CreateAccount_PasswordNoMatch', N'Lozinka i potvrđena lozinka se ne poklapaju. Molimo vas da provjerite.', N'The password and confirmation password do not match. Please, check it.' UNION ALL
		SELECT N'Account_CreateAccount_PasswordValidation', N'Lozinka treba sadržavati barem jedno malo slovo, veliko slovo, brojku, te ne smije sadržavati razmak.', N'Password should have one lower case letter, one upper case letter, one digit and no spaces.' UNION ALL
		SELECT N'Account_CreateAccount_TimeZone', N'Vaša vremenska zona', N'Your Time Zone' UNION ALL
		SELECT N'Account_CreateAccount_TimeZoneComment', N'Biti će primjenjena na polja datuma i vremena.', N'Will be applied to datetime fields' UNION ALL
		SELECT N'Account_CreateAccount_TimeZoneEmpty', N'Molimo, odaberite svoju vremensku zonu.', N'Please, select your time zone.' UNION ALL
		SELECT N'Account_CreateAccount_Title', N'Registracija', N'Sign Up' UNION ALL
		SELECT N'Account_ForgotPassword_Description', N'Molimo unesite Vašu lozinku da biste je promjenili, nakon toga ćemo Vam poslati Email s daljim uputstvima.', N'Please Enter Your Email To Reset Your Password.' + CHAR(13) + CHAR(10) + 'You''ll Receive An Email With Instructions.' UNION ALL
		SELECT N'Account_ForgotPassword_Instruction', N'Možemo poslati email uputstva kako resetovati lozinku na email adresu koju imamo u datoteci.', N'We can email instructions on how to reset your password to the email address we have on file.' UNION ALL
		SELECT N'Account_ForgotPassword_Title', N'Zaboravili ste lozinku?', N'Forgot your password?' UNION ALL
		SELECT N'Account_PasswordRecovery__Description', N'Molimo unesite email da biste obnovili Vašu lozinku. Poslat ćemo Vam email s daljim uputstvima.', N'Please enter your e-mail to reset e your password. You''ll receive an e-mail with instructions.' UNION ALL
		SELECT N'Account_PasswordRecovery_Title', N'Oporavak lozinke', N'Password Recovery' UNION ALL
		SELECT N'Account_SignIn', N'Prijava', N'Sign In' UNION ALL
		SELECT N'Account_SignIn_CanceledProvider', N'Račun je otkazan od strane provajdera.', N'Cancelled at provider.' UNION ALL
		SELECT N'Account_SignIn_Description', N'Prijavite se u svoj račun', N'Sign in into your account' UNION ALL
		SELECT N'Account_SignIn_EnterBlogger', N'Unesite Vaše Blogger korisničko ime', N'Enter Your Blogger account' UNION ALL
		SELECT N'Account_SignIn_EnterLJ', N'Unesite Vaše Livejournal korisničko ime', N'Enter your Livejournal username' UNION ALL
		SELECT N'Account_SignIn_EnterMyOpenId', N'Unesite Vaše MyOpenID korisničko ime', N'Enter your MyOpenID username' UNION ALL
		SELECT N'Account_SignIn_EnterOpenId', N'Unesite Vaš OpenID', N'Enter your OpenID' UNION ALL
		SELECT N'Account_SignIn_HaveOpenID', N'Da li imate OpenID račun?', N'Do you have OpenID account?' UNION ALL
		SELECT N'Account_SignIn_InvalidID', N'Neispravan identifikator.', N'Invalid identifier.' UNION ALL
		SELECT N'Account_SignIn_Link_SignUp', N'Nemaš račun? <a href=''{0}''>Registracija</a>', N'Don''t have an account? <a href=''{0}''>Sign Up</a>' UNION ALL
		SELECT N'Account_SignIn_Message_Redirecting', N'Preusmjeravanje na', N'Redirecting to the' UNION ALL
		SELECT N'Account_SignIn_Social_Ttile', N'ili se prijavi s nekim računom od društvenih mreža', N'or sign in via your social network account' UNION ALL
		SELECT N'Account_SignIn_SocialNetMember', N'Imate već postojeći račun na društvenim mrežama? Prijavi se sa', N'Already have a social network account? Sign in with' UNION ALL
		SELECT N'Account_SignIn_Title', N'Prijavi se', N'Sign In' UNION ALL
		SELECT N'Account_SignUp', N'Registracija', N'Sign Up' UNION ALL
		SELECT N'Account_SignUp_Field_NewPassword_Placeholder', N'Unesi novu lozinku', N'Enter a new password' UNION ALL
		SELECT N'Account_SignUp_Field_Password_Placeholder', N'Unesi lozinku', N'Create a password' UNION ALL
		SELECT N'Account_SignUp_Field_RetypePassword_Placeholder', N'Ponovno unesi lozinku', N'Retype your password' UNION ALL
		SELECT N'Account_SignUp_Field_Username_Placeholder', N'Odaberi korisničko ime', N'Choose your username' UNION ALL
		SELECT N'Account_SignUp_Headline_SetupAccount', N'Korisnička podešavanja', N'Set up your account' UNION ALL
		SELECT N'Account_SignUp_Link_CreateAccount', N'Kreiraj račun', N'Create Account' UNION ALL
		SELECT N'Account_SignUp_Link_SignIn', N'Već imaš račun? <a href=''{0}''>Prijava</a>', N'Already have an account? <a href=''{0}''>SignIn</a>' UNION ALL
		SELECT N'Account_SignUp_Title', N'Registracija', N'Register' UNION ALL
		SELECT N'Button_Send', N'Pošalji', N'Send' UNION ALL
		SELECT N'Button_Submit', N'Submit', N'Submit' UNION ALL
		SELECT N'ComboBox_DefaultValue', N'- Molimo odaberite -', N'- Please select -' UNION ALL
		SELECT N'Comments_Placeholder_WriteComment', N'Napiši komentar...', N'Write a comment...' UNION ALL
		SELECT N'Comments_Title', N'Komentari', N'Comments' UNION ALL
		SELECT N'Contact_Button_SendMessage', N'Pošalji poruku', N'Send Message' UNION ALL
		SELECT N'Contact_Message_Content', N'Primili smo vaš upit. Zahvaljujemo na interesu na saradnji s portalom {0} <a href="/">Početna</a>', N'We''ve received your inquiry. We appreciate your interest in {0}. <a href="/">Return Home</a>' UNION ALL
		SELECT N'Contact_Message_Title', N'HVALA', N'THANK YOU' UNION ALL
		SELECT N'Contact_SendMessage', N'Pošaljite poruku', N'Send a Message' UNION ALL
		SELECT N'Data_Email_Invalid', N'Neispravan email format', N'Email format is invalid.' UNION ALL
		SELECT N'Data_NewCustomer', N'Novi korisnik', N'New Customer' UNION ALL
		SELECT N'Data_NewPosts', N'Nove objave', N'New Posts' UNION ALL
		SELECT N'Data_PopularPosts', N'Popularne objave', N'Popular Posts' UNION ALL
		SELECT N'Default_Address', N'Adresa', N'Address' UNION ALL
		SELECT N'Default_All', N'Svi', N'All' UNION ALL
		SELECT N'Default_PostedBy', N'Objavio', N'Posted by' UNION ALL
		SELECT N'Default_Required', N'Obavezno', N'Required' UNION ALL
		SELECT N'Default_RequiredField_Asterisk', N': <strong style="color:red;"> *</strong>', N': <strong style="color:red;"> *</strong>' UNION ALL
		SELECT N'Default_Search', N'Traži...', N'Search...' UNION ALL
		SELECT N'ErrorMessage_RequiredField', N'Molimo unesite vrijednost za ''{0}''.', N'The {0} field is required.' UNION ALL
		SELECT N'Field_Captcha', N'Captcha', N'Captcha' UNION ALL
		SELECT N'Field_Client', N'Klijent', N'Client' UNION ALL
		SELECT N'Field_DateCompleted', N'Datum završetka', N'Date Completed' UNION ALL
		SELECT N'Field_Email', N'Email', N'Email' UNION ALL
		SELECT N'Field_EventDate', N'Datum događaja', N'Event Date' UNION ALL
		SELECT N'Field_Fax', N'Fax', N'Fax' UNION ALL
		SELECT N'Field_FirstName', N'Ime', N'First Name' UNION ALL
		SELECT N'Field_LastName', N'Prezime', N'Last Name' UNION ALL
		SELECT N'Field_Location', N'Lokacija', N'Location' UNION ALL
		SELECT N'Field_Member', N'Korisnik', N'Member' UNION ALL
		SELECT N'Field_Message', N'Poruka', N'Message' UNION ALL
		SELECT N'Field_Mobile', N'Mobilni', N'Mobile' UNION ALL
		SELECT N'Field_Name', N'Ime', N'Name' UNION ALL
		SELECT N'Field_Password', N'Lozinka', N'Password' UNION ALL
		SELECT N'Field_PasswordConfirmation', N'Ponovi lozinku', N'Password Confirmation' UNION ALL
		SELECT N'Field_Phone', N'Telefon', N'Phone' UNION ALL
		SELECT N'Field_Placeholder', N'Molimo Vas da unesete ''{0}''.', N'Plese enter ''{0}''.' UNION ALL
		SELECT N'Field_RememberMe', N'Zapamti me', N'Remember me' UNION ALL
		SELECT N'Field_RetypePassword', N'Ponovno unesi lozinku', N'Re-type Password' UNION ALL
		SELECT N'Field_Subject', N'Naslov', N'Subject' UNION ALL
		SELECT N'Field_Username', N'Korisničko ime', N'Username' UNION ALL
		SELECT N'Link_ContinueReading', N'Nastavi sa čitanjem', N'Continue Reading' UNION ALL
		SELECT N'Link_Delete', N'Obriši', N'Delete' UNION ALL
		SELECT N'Link_ForgotPassword', N'Zaboravljena lozinka?', N'Forgot your password?' UNION ALL
		SELECT N'Link_More', N'Više', N'More' UNION ALL
		SELECT N'Link_NextPost', N'Sljedeća objava', N'Next Post' UNION ALL
		SELECT N'Link_PasswordRecovery', N'Zaboravljena lozinka', N'Password Recovery' UNION ALL
		SELECT N'Link_PreviousPost', N'Prethodna objava', N'Previous Post' UNION ALL
		SELECT N'Link_Register', N'Registracija', N'Register' UNION ALL
		SELECT N'Link_Reply', N'Odgovori', N'Reply' UNION ALL
		SELECT N'Link_Send', N'Pošalji', N'Send' UNION ALL
		SELECT N'Link_Sent', N'Poslano', N'Sent' UNION ALL
		SELECT N'Link_Share', N'Podeli objavu ', N'Share' UNION ALL
		SELECT N'Link_SignIn', N'Prijava', N'Sign In' UNION ALL
		SELECT N'Link_SignOut', N'Odjava', N'Sign Out' UNION ALL
		SELECT N'Link_SignUp', N'Registracija', N'Sign Up' UNION ALL
		SELECT N'Link_Subscribe', N'Prijavi se', N'Subscribe' UNION ALL
		SELECT N'Link_Unsubscribe', N'Odjavi se', N'Unsubscribe' UNION ALL
		SELECT N'LinkEditProfile', N'Uredi profil', N'Edit Profile' UNION ALL
		SELECT N'Newsletter_Subscribe_Description', N'Vaša email adresa je sigurna i nikada je nećemo nikome proslijediti.', N'We''ll never share your email address and you can opt out at any time, we promise.' UNION ALL
		SELECT N'Newsletter_Subscribe_Headline', N'Ostanimo u dodiru...', N'Let''s stay in touch' UNION ALL
		SELECT N'Newsletter_Subscribe_Message_Content', N'Uspješno ste se prijavili na naš newsletter! <a href="/">Nazad</a>', N'You have successfully subscribed to our newsletter! <a href="/">Return Home</a>' UNION ALL
		SELECT N'Newsletter_Subscribe_Message_Title', N'HVALA', N'THANK YOU' UNION ALL
		SELECT N'Newsletter_Subscribe_Success_Subscribed', N'Uspješno ste se prijavili na naš newsletter!', N'You have been successfully subscribed!' UNION ALL
		SELECT N'Newsletter_Subscribe_Title', N'Prijavi se na naš newsletter', N'Subscribe to Our Newsletter' UNION ALL
		SELECT N'Newsletter_Subscribe_Validation_Subscribed', N'Već ste prijavljeni!', N'You have already subscribed!' UNION ALL
		SELECT N'Newsletter_Unsubscribe_Description', N'Da li ste sigurni da se želite odjaviti od naših obaveštenja?', N'Are you sure you want to unsubscribe from our mailings?' UNION ALL
		SELECT N'Newsletter_Unsubscribe_Headline', N'Želiš li se odjaviti s newsletter-a?', N'Do you want to unsubscribe?' UNION ALL
		SELECT N'Newsletter_Unsubscribe_Message_Content', N'Uspješno ste se odjavili s našeg newslettera! <a href="/">Nazad</a>', N'You have successfully unsubscribed from our newsletter! <a href="/">Return Home</a>' UNION ALL
		SELECT N'Newsletter_Unsubscribe_Message_Title', N'Otkazana pretplata', N'Unsubscribed' UNION ALL
		SELECT N'Newsletter_Unsubscribe_Title', N'Odjavi se s našeg newsletter-a', N'Unsubscribe from Our Newsletter' UNION ALL
		SELECT N'Porfolio_ProjectDescription_Title', N'Opis projekta', N'Project Description' UNION ALL
		SELECT N'Portfolio_ProjectUrl', N'Url projekta', N'Project Url' UNION ALL
		SELECT N'Portfolio_RelatedProjects', N'Slični projekti', N'Related Projects' UNION ALL
		SELECT N'Portfolio_WorkList', N'Što smo uradili', N'What we did' UNION ALL
		SELECT N'SiteMenu_Articles', N'Članci', N'Articles' UNION ALL
		SELECT N'SiteMenu_Blog', N'Blog', N'Blog' UNION ALL
		SELECT N'SiteMenu_BlogPost', N'Blog post', N'Blog Post' UNION ALL
		SELECT N'SiteMenu_BlogPosts', N'Blog postovi', N'Blog Posts' UNION ALL
		SELECT N'SiteMenu_Contact', N'Kontakt', N'Contact' UNION ALL
		SELECT N'SiteMenu_Events', N'Događaji', N'Events' UNION ALL
		SELECT N'SiteMenu_Home', N'Naslovna', N'Home' UNION ALL
		SELECT N'SiteMenu_Lists', N'Liste', N'Lists' UNION ALL
		SELECT N'SiteMenu_News', N'Vijesti', N'News' UNION ALL
		SELECT N'SiteMenu_Newsletter', N'Newsletter', N'Newsletter' UNION ALL
		SELECT N'SiteMenu_Portfolio', N'Referenca', N'Portfolio' UNION ALL
		SELECT N'SiteMenu_Portfolios', N'Reference', N'Portfolios' UNION ALL
		SELECT N'SocialNetwork_Facebook', N'Facebook', N'Facebook' UNION ALL
		SELECT N'SocialNetwork_Google', N'Google', N'Google' UNION ALL
		SELECT N'SocialNetwork_Twitter', N'Twitter', N'Twitter' UNION ALL
		SELECT N'SocialNetwork_Yahoo', N'Yahoo', N'Yahoo' UNION ALL
		SELECT N'Wall_Message_RegisterdUsersOnly', N'Samo registrovani korisnici mogu dodati komentar.<br/>Molimo vas da se<a href=''{0}''> prijavite </a> ili <a href=''{1}''> registrujete</a>.', N'Only registered users can add a new comment. Please <a href=''{0}''> Sign In</a> or <a href=''{1}''>Sign Up</a>.' UNION ALL
		SELECT N'Widget_Archive_Title', N'Arhiva', N'Archive' UNION ALL
		SELECT N'Widget_Categories_Title', N'Kategorije', N'Categories' UNION ALL
		SELECT N'Widget_Tags_Title', N'Tagovi', N'Tags' UNION ALL
		SELECT N'Widget_Related_Title', N'Vezani {0}', N'Related {0}' UNION ALL
		SELECT N'Field_Date', N'Datum', N'Date'
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
