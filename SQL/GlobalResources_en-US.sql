/*=CONCATENATE("SELECT N'";A1;"', N'";B1;"' UNION ALL")*/
DECLARE @ResourcesTable TABLE (Name VARCHAR (128), Value NVARCHAR (MAX), Description NVARCHAR (MAX))

DECLARE @ResourceID INT, @ResourceTypeID INT, @LanguageID INT
DECLARE @Name VARCHAR (128), @Value NVARCHAR (MAX), @Description NVARCHAR (MAX)

SET @ResourceTypeID = NULL
SELECT TOP 1 @ResourceTypeID = ResourceTypeID FROM ResourceTypes WHERE Name = 'GlobalResources'
SET @ResourceTypeID = ISNULL (@ResourceTypeID, 0)

SET @LanguageID = NULL
SELECT TOP 1 @LanguageID = LanguageID FROM Languages WHERE CultureName = 'en-US' --AND IsEnabled = 1
SET @LanguageID = ISNULL (@LanguageID, 0)

IF (@ResourceTypeID > = 0 AND @LanguageID > 0) BEGIN
	INSERT INTO @ResourcesTable (Name, Value)
		SELECT N'Account__SignUp_Headline_Terms', N'Review the Terms' UNION ALL
		SELECT N'Account_ActivateAccount_Headline', N'Account Activation' UNION ALL
		SELECT N'Account_ActivateAccount_Title', N'Activate your account' UNION ALL
		SELECT N'Account_ActivationRequest_Title', N'Re-send Activation Request' UNION ALL
		SELECT N'Account_ChangeAccountPassword__Link_Change', N'Change Password' UNION ALL
		SELECT N'Account_ChangeAccountPassword_Title', N'Change Account Password' UNION ALL
		SELECT N'Account_Controller_AccountBlocked', N'Your account was blocked.' UNION ALL
		SELECT N'Account_Controller_AccountDoesntExist', N'The account doesn''t exist.' UNION ALL
		SELECT N'Account_Controller_AccountExists', N'The account already exists with that email address' UNION ALL
		SELECT N'Account_Controller_Activated', N'Your account {{name}} has been activated successfully.' UNION ALL
		SELECT N'Account_Controller_ActivationMailSent', N'Activation email has been sent. Please check your Inbox or Spam folder.' UNION ALL
		SELECT N'Account_Controller_CantSendNotification', N'Something went wrong with sending email notification. Site administration has been notified.' UNION ALL
		SELECT N'Account_Controller_DomainNotAllowed', N'The mail domain is not allowed. Please use another e-mail address.' UNION ALL
		SELECT N'Account_Controller_IsActivated', N'Your account is activated.' UNION ALL
		SELECT N'Account_Controller_NotActivated', N'Your account was not activated.' UNION ALL
		SELECT N'Account_Controller_PassChanged', N'Your password has been changed.' UNION ALL
		SELECT N'Account_Controller_ResetPassMail', N'Reset password email has been sent. Please check your Inbox or Spam folder.' UNION ALL
		SELECT N'Account_Controller_WrongActiveLink', N'The wrong activation link or activation has been expired.' UNION ALL
		SELECT N'Account_Controller_WrongEmail', N'Wrong e-mail address format.' UNION ALL
		SELECT N'Account_Controller_WrongResetPassLink', N'Wrong reset password link or the link has been expired.' UNION ALL
		SELECT N'Account_Controller_WrongUser', N'Wrong user name or password.' UNION ALL
		SELECT N'Account_CreateAccount_CreateAccount', N'Create your account' UNION ALL
		SELECT N'Account_CreateAccount_Description', N'Enter your account details below' UNION ALL
		SELECT N'Account_CreateAccount_Label_PrivacyTermsConditions', N'By registering, you agree to our <a href="{0}">Terms of Service</a> and <a href="{1}">Privacy Policy</a>.' UNION ALL
		SELECT N'Account_CreateAccount_Mandatory', N' {0} field is mandatory, please fill it.' UNION ALL
		SELECT N'Account_CreateAccount_NameLooksLikeEmail', N'The member''s username looks like an e-mail address. Please change it.' UNION ALL
		SELECT N'Account_CreateAccount_NameNonAlfaNum', N'The username contains non-alpha numeric characters (#@!$ etc...). Please change it.' UNION ALL
		SELECT N'Account_CreateAccount_PasswordIsSame', N'New and old password are the same.' UNION ALL
		SELECT N'Account_CreateAccount_PasswordLength', N'The password length must be at least {0} characters long.' UNION ALL
		SELECT N'Account_CreateAccount_PasswordNoMatch', N'The password and confirmation password do not match. Please, check it.' UNION ALL
		SELECT N'Account_CreateAccount_PasswordValidation', N'Password should have one lower case letter, one upper case letter, one digit and no spaces.' UNION ALL
		SELECT N'Account_CreateAccount_TimeZone', N'Your Time Zone' UNION ALL
		SELECT N'Account_CreateAccount_TimeZoneComment', N'Will be applied to datetime fields' UNION ALL
		SELECT N'Account_CreateAccount_TimeZoneEmpty', N'Please, select your time zone.' UNION ALL
		SELECT N'Account_CreateAccount_Title', N'Sign Up' UNION ALL
		SELECT N'Account_ForgotPassword_Description', N'Please Enter Your Email To Reset Your Password.' + CHAR(13) + CHAR(10) + N'You’ll Receive An Email With Instructions.' UNION ALL
		SELECT N'Account_ForgotPassword_Instruction', N'We can email instructions on how to reset your password to the email address we have on file.' UNION ALL
		SELECT N'Account_ForgotPassword_Title', N' Forgot your password?' UNION ALL
		SELECT N'Account_PasswordRecovery__Description', N'Please enter your e-mail to reset e your password. You''ll receive an e-mail with instructions.' UNION ALL
		SELECT N'Account_PasswordRecovery_Title', N'Password Recovery' UNION ALL
		SELECT N'Account_SignIn', N'Sign In' UNION ALL
		SELECT N'Account_SignIn_CanceledProvider', N'Cancelled at provider.' UNION ALL
		SELECT N'Account_SignIn_Description', N'Sign in into your account' UNION ALL
		SELECT N'Account_SignIn_EnterBlogger', N'Enter Your Blogger account' UNION ALL
		SELECT N'Account_SignIn_EnterLJ', N'Enter your Livejournal username' UNION ALL
		SELECT N'Account_SignIn_EnterMyOpenId', N'Enter your MyOpenID username' UNION ALL
		SELECT N'Account_SignIn_EnterOpenId', N'Enter your OpenID' UNION ALL
		SELECT N'Account_SignIn_HaveOpenID', N'Do you have OpenID account?' UNION ALL
		SELECT N'Account_SignIn_InvalidID', N'Invalid identifier.' UNION ALL
		SELECT N'Account_SignIn_Link_SignUp', N'Don''t have an account? <a href=''{0}''>Sign Up</a>' UNION ALL
		SELECT N'Account_SignIn_Message_Redirecting', N'Redirecting to the' UNION ALL
		SELECT N'Account_SignIn_Social_Ttile', N'or sign in via your social network account' UNION ALL
		SELECT N'Account_SignIn_SocialNetMember', N'Already have a social network account? Sign in with' UNION ALL
		SELECT N'Account_SignIn_Title', N'Sign In' UNION ALL
		SELECT N'Account_SignUp', N'Sign Up' UNION ALL
		SELECT N'Account_SignUp_Field_NewPassword_Placeholder', N'Enter a new password' UNION ALL
		SELECT N'Account_SignUp_Field_Password_Placeholder', N'Create a password' UNION ALL
		SELECT N'Account_SignUp_Field_RetypePassword_Placeholder', N'Retype your password' UNION ALL
		SELECT N'Account_SignUp_Field_Username_Placeholder', N'Choose your username' UNION ALL
		SELECT N'Account_SignUp_Headline_SetupAccount', N'Set up your account' UNION ALL
		SELECT N'Account_SignUp_Link_CreateAccount', N'Create Account' UNION ALL
		SELECT N'Account_SignUp_Link_SignIn', N'Already have an account? <a href=''{0}''>SignIn</a>' UNION ALL
		SELECT N'Account_SignUp_Title', N'Register' UNION ALL
		SELECT N'Button_Send', N'Send' UNION ALL
		SELECT N'Button_Submit', N'Submit' UNION ALL
		SELECT N'ComboBox_DefaultValue', N'- Please select -' UNION ALL
		SELECT N'Comments_Placeholder_WriteComment', N'Write a comment...' UNION ALL
		SELECT N'Comments_Title', N'Comments' UNION ALL
		SELECT N'Contact_Button_SendMessage', N'Send Message' UNION ALL
		SELECT N'Contact_Message_Content', N'We''ve received your inquiry. We appreciate your interest in {0}. <a href="/">Return Home</a>' UNION ALL
		SELECT N'Contact_Message_Title', N'THANK YOU' UNION ALL
		SELECT N'Data_Email_Invalid', N'Email format is invalid.' UNION ALL
		SELECT N'Default_Address', N'Address' UNION ALL
		SELECT N'Default_All', N'All' UNION ALL
		SELECT N'Default_PostedBy', N'Posted by' UNION ALL
		SELECT N'Default_Required', N'Required' UNION ALL
		SELECT N'Default_RequiredField_Asterisk', N': <strong style="color:red;"> *</strong>' UNION ALL
		SELECT N'Default_Search', N'Search...' UNION ALL
		SELECT N'ErrorMessage_RequiredField', N'The {0} field is required.' UNION ALL
		SELECT N'Field_Captcha', N'Captcha' UNION ALL
		SELECT N'Field_Client', N'Client' UNION ALL
		SELECT N'Field_DateCompleted', N'Date Completed' UNION ALL
		SELECT N'Field_Email', N'Email' UNION ALL
		SELECT N'Field_EventDate', N'Event Date' UNION ALL
		SELECT N'Field_Fax', N'Fax' UNION ALL
		SELECT N'Field_FirstName', N'First Name' UNION ALL
		SELECT N'Field_LastName', N'Last Name' UNION ALL
		SELECT N'Field_Location', N'Location' UNION ALL
		SELECT N'Field_Member', N'Member' UNION ALL
		SELECT N'Field_Message', N'Message' UNION ALL
		SELECT N'Field_Mobile', N'Mobile' UNION ALL
		SELECT N'Field_Name', N'Name' UNION ALL
		SELECT N'Field_Password', N'Password' UNION ALL
		SELECT N'Field_PasswordConfirmation', N'Password Confirmation' UNION ALL
		SELECT N'Field_Phone', N'Phone' UNION ALL
		SELECT N'Field_Placeholder', N'Plese enter ''{0}''.' UNION ALL
		SELECT N'Field_RememberMe', N'Remember me' UNION ALL
		SELECT N'Field_RetypePassword', N'Re-type Password' UNION ALL
		SELECT N'Field_Subject', N'Subject' UNION ALL
		SELECT N'Field_Username', N'Username' UNION ALL
		SELECT N'Link_ContinueReading', N'Continue Reading' UNION ALL
		SELECT N'Link_Delete', N'Delete' UNION ALL
		SELECT N'Link_ForgotPassword', N'Forgot your password?' UNION ALL
		SELECT N'Link_More', N'More' UNION ALL
		SELECT N'Link_PasswordRecovery', N'Password Recovery' UNION ALL
		SELECT N'Link_Register', N'Register' UNION ALL
		SELECT N'Link_Reply', N'Reply' UNION ALL
		SELECT N'Link_Send', N'Send' UNION ALL
		SELECT N'Link_Sent', N'Sent' UNION ALL
		SELECT N'Link_SignIn', N'Sign In' UNION ALL
		SELECT N'Link_SignOut', N'Sign Out' UNION ALL
		SELECT N'Link_SignUp', N'Sign Up' UNION ALL
		SELECT N'Link_Subscribe', N'Subscribe' UNION ALL
		SELECT N'Link_Unsubscribe', N'Unsubscribe' UNION ALL
		SELECT N'LinkEditProfile', N'Edit Profile' UNION ALL
		SELECT N'Newsletter_Subscribe_Description', N'We''ll never share your email address and you can opt out at any time, we promise.' UNION ALL
		SELECT N'Newsletter_Subscribe_Headline', N'Let’s stay in touch' UNION ALL
		SELECT N'Newsletter_Subscribe_Message_Content', N'You have successfully subscribed to our newsletter! <a href="/">Return Home</a>' UNION ALL
		SELECT N'Newsletter_Subscribe_Message_Title', N'THANK YOU' UNION ALL
		SELECT N'Newsletter_Subscribe_Success_Subscribed', N'You have been successfully subscribed!' UNION ALL
		SELECT N'Newsletter_Subscribe_Title', N'Subscribe to Our Newsletter' UNION ALL
		SELECT N'Newsletter_Subscribe_Validation_Subscribed', N'You have already subscribed!' UNION ALL
		SELECT N'Newsletter_Unsubscribe_Description', N'Are you sure you want to unsubscribe from our mailings?' UNION ALL
		SELECT N'Newsletter_Unsubscribe_Headline', N'Do you want to unsubscribe?' UNION ALL
		SELECT N'Newsletter_Unsubscribe_Message_Content', N'You have successfully unsubscribed from our newsletter! <a href="/">Return Home</a>' UNION ALL
		SELECT N'Newsletter_Unsubscribe_Message_Title', N'Unsubscribed' UNION ALL
		SELECT N'Newsletter_Unsubscribe_Title', N'Unsubscribe from Our Newsletter' UNION ALL
		SELECT N'Porfolio_ProjectDescription_Title', N'Project Description' UNION ALL
		SELECT N'Portfolio_ProjectUrl', N'Project Url' UNION ALL
		SELECT N'Portfolio_RelatedProjects', N'Related Projects' UNION ALL
		SELECT N'Portfolio_WorkList', N'What we did' UNION ALL
		SELECT N'SiteMenu_Articles', N'Articles' UNION ALL
		SELECT N'SiteMenu_Blog', N'Blog' UNION ALL
		SELECT N'SiteMenu_BlogPost', N'Blog Post' UNION ALL
		SELECT N'SiteMenu_BlogPosts', N'Blog Posts' UNION ALL
		SELECT N'SiteMenu_Contact', N'Contact' UNION ALL
		SELECT N'SiteMenu_Events', N'Events' UNION ALL
		SELECT N'SiteMenu_Home', N'Home' UNION ALL
		SELECT N'SiteMenu_Lists', N'Lists' UNION ALL
		SELECT N'SiteMenu_News', N'News' UNION ALL
		SELECT N'SiteMenu_Newsletter', N'Newsletter' UNION ALL
		SELECT N'SiteMenu_Portfolio', N'Portfolio' UNION ALL
		SELECT N'SiteMenu_Portfolios', N'Portfolios' UNION ALL
		SELECT N'SocialNetwork_Facebook', N'Facebook' UNION ALL
		SELECT N'SocialNetwork_Google', N'Google' UNION ALL
		SELECT N'SocialNetwork_Twitter', N'Twitter' UNION ALL
		SELECT N'SocialNetwork_Yahoo', N'Yahoo' UNION ALL
		SELECT N'Wall_Message_RegisterdUsersOnly', N'Only registered users can add a new comment. Please <a href=''{0}''> Sign In</a> or <a href=''{1}''>Sign Up</a>.' UNION ALL
		SELECT N'Widget_Archive_Title', N'Archive' UNION ALL
		SELECT N'Widget_Categories_Title', N'Categories' UNION ALL
		SELECT N'Widget_Tags_Title', N'Tags' UNION ALL
		SELECT N'Field_Date', N'Date'
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
