/*=CONCATENATE("SELECT N'";A1;"', N'";B1;"' UNION ALL")*/
DECLARE @ResourcesTable TABLE (Name VARCHAR (128), Value NVARCHAR (MAX), Description NVARCHAR (MAX))

DECLARE @ResourceID INT, @ResourceTypeID INT, @LanguageID INT
DECLARE @Name VARCHAR (128), @Value NVARCHAR (MAX), @Description NVARCHAR (MAX)

SET @ResourceTypeID = NULL
SELECT TOP 1 @ResourceTypeID = ResourceTypeID FROM ResourceTypes WHERE Name = 'eCommerceResources'
SET @ResourceTypeID = ISNULL (@ResourceTypeID, 0)

SET @LanguageID = NULL
SELECT TOP 1 @LanguageID = LanguageID FROM Languages WHERE CultureName = 'en-GB' --AND IsEnabled = 1
SET @LanguageID = ISNULL(@LanguageID, 0)

IF (@ResourceTypeID > 0 AND @LanguageID > 0) BEGIN
	INSERT INTO @ResourcesTable (Name, Value)
		SELECT N'AccountLocked_message', N'Your account is locked because your license has been expired. To continue using this App, please renew your license.' UNION ALL
		SELECT N'Add_To_Cart', N'Add to Cart' UNION ALL
		SELECT N'Add_to_Wishlist_Text', N'Add to Wishlist' UNION ALL
		SELECT N'Already_bought_Warning', N'You have already bought an Application' UNION ALL
		SELECT N'Amount_StatementTitle', N'Amount' UNION ALL
		SELECT N'Available_points', N'Available points' UNION ALL
		SELECT N'Best_Sales_Title', N'Best Sales' UNION ALL
		SELECT N'Button_PlaceOrder', N'Place Order' UNION ALL
		SELECT N'Button_RemoveAll', N'Remove All' UNION ALL
		SELECT N'Cancel_Payment_Message', N'Are you sure you want to cancel this payment?' UNION ALL
		SELECT N'Cancel_Payment_Message_Confirm', N'Yes, cancel it' UNION ALL
		SELECT N'Cart_Message_Successfully', N'Selected items was successfully added to your cart' UNION ALL
		SELECT N'Cart_Subtotal', N'Subtotal' UNION ALL
		SELECT N'Cart_Title', N'Cart' UNION ALL
		SELECT N'Cart_Total', N'Cart Totals' UNION ALL
		SELECT N'Cart_Totals_Title', N'Cart Totals' UNION ALL
		SELECT N'Cart_Total_Order_Message', N'It will be calculated during order finalization' UNION ALL
		SELECT N'Cart_VAT', N'VAT' UNION ALL
		SELECT N'Change_password', N'Change password' UNION ALL
		SELECT N'Checkout_Title', N'Checkout' UNION ALL
		SELECT N'CityTagCloud_Title', N'Cities Tag Cloud' UNION ALL
		SELECT N'Clear_Wishlist_Text', N'Clear Wishlist' UNION ALL
		SELECT N'Continue_Shopping', N'Continue Shopping' UNION ALL
		SELECT N'Country_Warning', N'Country is invalid. Select valid Country.' UNION ALL
		SELECT N'Coupon_Discounts', N'Coupon Discounts' UNION ALL
		SELECT N'CreateAccount', N'Create new online account' UNION ALL
		SELECT N'CreateAccount_Benefits_Checkout', N'A quick and easy checkout' UNION ALL
		SELECT N'CreateAccount_Benefits_Newslettera', N'Easy sign-up and sign-off from the newsletter' UNION ALL
		SELECT N'CreateAccount_Benefits_Orders', N'View all orders and reservations' UNION ALL
		SELECT N'CreateAccount_Benefits_Profile', N'Simple change of profile data' UNION ALL
		SELECT N'CreditCard_BillingAddress', N'Billing Address' UNION ALL
		SELECT N'CreditCard_CardTypeValidation', N'Invalid card type.' UNION ALL
		SELECT N'CreditCard_CityValidation', N'City is empty. Enter City.' UNION ALL
		SELECT N'CreditCard_Code', N'Code (CVC)' UNION ALL
		SELECT N'CreditCard_CreditCardNumber', N'Credit Card Number' UNION ALL
		SELECT N'CreditCard_CVC_Code', N'CVC Code' UNION ALL
		SELECT N'CreditCard_CvcEmpty', N'CVC is empty. Enter CVC.' UNION ALL
		SELECT N'CreditCard_CvcValidation', N'CVC is invalid. Enter valid CVC.' UNION ALL
		SELECT N'CreditCard_ExpirationDate', N'Expiration Date' UNION ALL
		SELECT N'CreditCard_ExpirationYear', N'Expiration Year' UNION ALL
		SELECT N'CreditCard_FirstNameValidation', N'First Name is empty. Enter First Name.' UNION ALL
		SELECT N'CreditCard_LastNameValidation', N'Last Name is empty. Enter Last Name.' UNION ALL
		SELECT N'CreditCard_ManagedAccountNote', N'Note: Only a non-prepaid US Visa or MasterCard debit cards are supported.' UNION ALL
		SELECT N'CreditCard_MonthValidation', N'Expiration Month is empty. Enter Expiration Month.' UNION ALL
		SELECT N'CreditCard_Note', N'NOTE: Your name must match the name on your credit card' UNION ALL
		SELECT N'CreditCard_Number', N'Card Number' UNION ALL
		SELECT N'CreditCard_NumberValidation', N'Credit Card Number is empty. Enter Credit Card Number.' UNION ALL
		SELECT N'CreditCard_StateValidation', N'State is empty. Enter State.' UNION ALL
		SELECT N'CreditCard_StreetValidation', N'Street is empty. Enter Street.' UNION ALL
		SELECT N'CreditCard_YearValidation', N'Expiration Year is empty. Enter Expiration Year.' UNION ALL
		SELECT N'CreditCard_ZipValidation', N'Zip is empty. Enter Zip.' UNION ALL
		SELECT N'Data_Address_Additional_Info', N'Apartment, Suit, Unit etc. (optional)' UNION ALL
		SELECT N'Data_All', N'All' UNION ALL
		SELECT N'Data_AllCategories', N'All Categories' UNION ALL
		SELECT N'Data_Booked', N'Booked' UNION ALL
		SELECT N'Data_Bookings', N'Bookings' UNION ALL
		SELECT N'Data_BreakEndTIme', N'Break end time' UNION ALL
		SELECT N'Data_BreakStartTime', N'Break start time' UNION ALL
		SELECT N'Data_BreakTimeByMinutes', N'Break By Minutes' UNION ALL
		SELECT N'Data_City', N'City' UNION ALL
		SELECT N'Data_CompletedOrders', N'Completed Orders' UNION ALL
		SELECT N'Data_ContractDate', N'Date by contract' UNION ALL
		SELECT N'Data_Country', N'Country' UNION ALL
		SELECT N'Data_CurrentBalance', N'Current Balance' UNION ALL
		SELECT N'Data_DaysOfWeek', N'Days of Week' UNION ALL
		SELECT N'Data_Deposits', N'Deposits' UNION ALL
		SELECT N'Data_Description', N'Description' UNION ALL
		SELECT N'Data_EventDate', N'Event Date' UNION ALL
		SELECT N'Data_EventEndTime', N'End Time' UNION ALL
		SELECT N'Data_EventEntriesAdd', N'Add Event Entries' UNION ALL
		SELECT N'Data_EventLocation', N'Event Location' UNION ALL
		SELECT N'Data_EventSettings', N'Event Settings' UNION ALL
		SELECT N'Data_EventStartTime', N'Start Time' UNION ALL
		SELECT N'Data_EventType', N'Type' UNION ALL
		SELECT N'Data_FirstName', N'First Name' UNION ALL
		SELECT N'Data_Friday', N'Friday' UNION ALL
		SELECT N'Data_ID', N'ID' UNION ALL
		SELECT N'Data_Image', N'Image' UNION ALL
		SELECT N'Data_LastName', N'Last Name' UNION ALL
		SELECT N'Data_Login', N'Login' UNION ALL
		SELECT N'Data_MyAccount', N'My Account' UNION ALL
		SELECT N'Data_Monday', N'Monday' UNION ALL
		SELECT N'Data_Month', N'Month' UNION ALL
		SELECT N'Data_NotBooked', N'Not booked' UNION ALL
		SELECT N'Data_Orders', N'Orders' UNION ALL
		SELECT N'Data_Payment', N'Payment' UNION ALL
		SELECT N'Data_PeriodEndDate', N'Period end date' UNION ALL
		SELECT N'Data_PeriodStartDate', N'Period start date' UNION ALL
		SELECT N'Data_Price', N'Price' UNION ALL
		SELECT N'Data_PriceAfterDiscount', N'Price after discount' UNION ALL
		SELECT N'Data_Repeat', N'Repeat' UNION ALL
		SELECT N'Data_RepeatCustom', N'Custom' UNION ALL
		SELECT N'Data_RepeatDaily', N'Daily' UNION ALL
		SELECT N'Data_RepeatEvery', N'Every' UNION ALL
		SELECT N'Data_Reviews', N'Reviews ({0})' UNION ALL
		SELECT N'Data_Saturday', N'Saturday' UNION ALL
		SELECT N'Data_Selected', N'Selected' UNION ALL
		SELECT N'Data_ShiftEndTime', N'Shift end time' UNION ALL
		SELECT N'Data_ShiftStartTime', N'Shift start time' UNION ALL
		SELECT N'Data_Shipping', N'Shipping' UNION ALL
		SELECT N'Data_StateProvince', N'State/Province' UNION ALL
		SELECT N'Data_Street', N'Street' UNION ALL
		SELECT N'Data_Sunday', N'Sunday' UNION ALL
		SELECT N'Data_Thursday', N'Thursday' UNION ALL
		SELECT N'Data_TotalAfterDiscount', N'Total after discount' UNION ALL
		SELECT N'Data_Tuesday', N'Tuesday' UNION ALL
		SELECT N'Data_Wednesday', N'Wednesday' UNION ALL
		SELECT N'Data_Year', N'Year' UNION ALL
		SELECT N'Data_Your_Order', N'Your Order' UNION ALL
		SELECT N'Data_ZipPostal', N'Zip/Postal' UNION ALL
		SELECT N'Default_Sorting', N'Default sorting' UNION ALL
		SELECT N'Details_StatementTitle', N'Details' UNION ALL
		SELECT N'Email_has_been_sent_Warning', N'Purchase notification e-mail has been successfully sent for member: {0}' UNION ALL
		SELECT N'Email_has_not_sent_Warning', N'Creating an account notification e-mail has not been sent' UNION ALL
		SELECT N'Message_AddedToFavorites', N'Added to favorites.' UNION ALL
		SELECT N'Message_Favorites_UnauthorizedAccess', N'Please <a href="/signin"> Sign In</a> or <a href="/signup">Sign Up</a> to add to favorites.' UNION ALL
		SELECT N'Message_RemovedFromFavorites', N'Removed from favorites.' UNION ALL
		SELECT N'SearchResults_Headline', N'Find everything for a wedding in your city.' UNION ALL
		SELECT N'Error_ChargingAccount', N'There Was an error while charging account!' UNION ALL
		SELECT N'Error_EmailData', N'There is no Email data!' UNION ALL
		SELECT N'Error_EmailFormatInvalid', N'Invalid Email format!' UNION ALL
		SELECT N'Error_EnterCorrectPrice', N'Please enter correct price! Minimum price is {0:N2}!' UNION ALL
		SELECT N'Error_EntryOverlaping', N'Entry for date {0:d} overlaps existing!' UNION ALL
		SELECT N'Error_EventBooked', N'Event {0} is already booked!' UNION ALL
		SELECT N'Error_EventDelete', N'There was an error while deleting Event Entries!' UNION ALL
		SELECT N'Error_EventEntrySaving', N'There was an error while save Event entry!' UNION ALL
		SELECT N'Error_EventLocation', N'Maximum allowed character length for Location is 250!' UNION ALL
		SELECT N'Error_ManagedAccount', N'Managed account error!' UNION ALL
		SELECT N'Error_MemberData', N'Invalid Member data!' UNION ALL
		SELECT N'Error_NoOrderData', N'There is no Order data!' UNION ALL
		SELECT N'Error_NoPaymentData', N'There is no Payment data!' UNION ALL
		SELECT N'Error_OrderAlreadyPaid', N'Order is already paid' UNION ALL
		SELECT N'Error_OrderHasNoBookings', N'Order does not contains any Event bookings!' UNION ALL
		SELECT N'Error_OrderInvalid', N'Invalid Order!' UNION ALL
		SELECT N'Error_OrderTotalInvalid', N'Invalid order Total!' UNION ALL
		SELECT N'Error_OrderTotalMissMatch', N'Order total does not match Event bookings total!' UNION ALL
		SELECT N'Error_PriceNotDefined', N'Event is not defined in Products!' UNION ALL
		SELECT N'Error_SendingEmail', N'There was an error while sending email!' UNION ALL
		SELECT N'Error_TokenDataInvalid', N'Invalid Token data!' UNION ALL
		SELECT N'ErrorMessage_MaxFieldSize', N'The maximum field size for a ''{0}'' field is {1}!' UNION ALL
		SELECT N'Error_while_saving_Warning', N'There was an error while saving Company data.' UNION ALL
		SELECT N'Event_Description', N'{0:d} {0:HH:mm} - {1:HH:mm}' UNION ALL
		SELECT N'Event_PageTitle', N'{0} - Event Settings' UNION ALL
		SELECT N'Existing_user', N'Existing user?' UNION ALL
		SELECT N'Featured_Products', N'Featured Products' UNION ALL
		SELECT N'File_Manager', N'File Manager' UNION ALL
		SELECT N'File_name', N'File name' UNION ALL
		SELECT N'File_Size', N'Size' UNION ALL
		SELECT N'Filter_Latest', N'Sort by newness' UNION ALL
		SELECT N'Filter_MaxPrice', N'Sort by price: high to low' UNION ALL
		SELECT N'Filter_MinPrice', N'Sort by price: low to high' UNION ALL
		SELECT N'Filter_MostPopular', N'Sort by popularity' UNION ALL
		SELECT N'Filter_Top', N'Sort by average rating' UNION ALL
		SELECT N'Filter_by_price', N'Filter by price' UNION ALL
		SELECT N'Footer_About_Us', N'About us' UNION ALL
		SELECT N'Footer_Complaints', N'Complaints' UNION ALL
		SELECT N'Footer_Cookie_Statement',N'Cookie Statement' UNION ALL
		SELECT N'Footer_Delivery_Terms', N'Terms of delivery' UNION ALL
		SELECT N'Footer_Instructions', N'Instructions' UNION ALL
		SELECT N'Footer_Legal_Entity', N'Legal entity' UNION ALL
		SELECT N'Footer_My_Account', N'My account' UNION ALL
		SELECT N'Footer_Order_History', N'Order History' UNION ALL
		SELECT N'Footer_Payment_Method', N'Method of payment' UNION ALL
		SELECT N'Footer_Payment_Security', N'Security of payments' UNION ALL
		SELECT N'Footer_Privacy_Statement', N'Privacy Statement' UNION ALL
		SELECT N'Footer_Terms_of_Use', N'Terms of use' UNION ALL
		SELECT N'Footer_Useful', N'Useful' UNION ALL
		SELECT N'Footer_Useful_Questions', N'Useful questions' UNION ALL
		SELECT N'Info_NoItems', N'No items match your search!' UNION ALL
		SELECT N'Info_SearchResult', N'{0} results match your serch' UNION ALL
		SELECT N'Invalid_Card_Number', N'Credit Card Number is invalid. Enter valid Credit Card Number.' UNION ALL
		SELECT N'Image_IsCover', N'Is Cover' UNION ALL
		SELECT N'Link_Copy_Text', N'Copy link' UNION ALL
		SELECT N'ManagedAccount_Default', N'Default' UNION ALL
		SELECT N'Manufacturer_Title', N'Manufacturer' UNION ALL
		SELECT N'Member_already_subscribed', N'You are already subscribed to {0}. If you want to renew your subscription or have more questions, please contact our support.' UNION ALL
		SELECT N'Membership_SignIn', N'Sign In' UNION ALL
		SELECT N'Message_CouponCodeSuccess', N'This coupon code has been successfully applied' UNION ALL
		SELECT N'Message_ExpiredOrInvalidCouponCode', N'This coupon code is invalid or has expired' UNION ALL
		SELECT N'Message_Success_ChangedSettings', N'Your settings have been changed!' UNION ALL
		SELECT N'Message_Store_UnauthorizedAccess', N'An account with this email already exists. Please <a href="/signin">Sign In</a> to proceed to checkout.' UNION ALL
		SELECT N'New_Customer_message', N'I am a new customer' UNION ALL
		SELECT N'Orders', N'Orders' UNION ALL
		SELECT N'Order_Details_Message', N'See your order details below' UNION ALL
		SELECT N'Order_number', N'Your order number is' UNION ALL
		SELECT N'Option_Country', N'Please, select your country' UNION ALL
		SELECT N'Package_Delivery_Message', N'In the case of purchasing several products with different delivery deadlines, delivery deadline for the complete order is the same as the longer term.' UNION ALL
		SELECT N'Package_Discount_Price', N'Discount Price:' UNION ALL
		SELECT N'Package_FreeDeliveryCRO', N'Shipping is free within Croatia!' UNION ALL
		SELECT N'Package_Lowest_Price', N'Lowest price:' UNION ALL
		SELECT N'Package_Regular_Price', N'Regular Price:' UNION ALL
		SELECT N'Pay_Order', N'Pay the order' UNION ALL
		SELECT N'Payment_BookingOrderText', N'Payment for Booking order: {0}' UNION ALL
		SELECT N'Payment_ChooseCreditCard', N'Choose your credit card' UNION ALL
		SELECT N'Payment_Complete_Message', N'Your payment has been completed.' UNION ALL
		SELECT N'Payment_InstalmentNumber', N'Instalment Number' UNION ALL
		SELECT N'Payment_InstalmentPayment', N'Instalment Payment' UNION ALL
		SELECT N'Payment_OneTima_Pay', N'One-Time Pay' UNION ALL
		SELECT N'Payment_Cancel_Title', N'Payment Cancel' UNION ALL
		SELECT N'Payment_Complete_Title', N'Payment Complete' UNION ALL
		SELECT N'Payment_CreditCardsAccepted', N'Credit Cards accepted' UNION ALL
		SELECT N'Payment_Delivery', N'Delivery' UNION ALL
		SELECT N'Payment_Error_Title', N'Payment Error' UNION ALL
		SELECT N'Payment_MainHeading', N'New Order' UNION ALL
		SELECT N'Payment_MainHeadingText', N'Use the form below to submit your credit card information.' UNION ALL
		SELECT N'Payment_NewCreditCard', N'New Credit Card' UNION ALL
		SELECT N'Payment_PageTitle', N'Order' UNION ALL
		SELECT N'Payment_Complete_Message', N'Your payment has been completed' UNION ALL
		SELECT N'Payment_Order_Number', N'Your order number is' UNION ALL
		SELECT N'Payment_PayWithCreditCard', N'Pay With Credit Card' UNION ALL
		SELECT N'Payment_Process_Problem', N'A problem has occurred during the payment process. Please try again. If this error continues, please contact support.' UNION ALL
		SELECT N'Payment_Reques_Cancel', N'Cancel Payment Reques' UNION ALL
		SELECT N'Payment_Rules_Message', N'Selecting a card and installment number is informative, payment will be made at the next step where you select a card to pay as well as the desired number of installments.' UNION ALL
		SELECT N'Payment_Total', N'TOTAL: ${0:N2}' UNION ALL
		SELECT N'Payment_Wire_Transfer', N'Wire Transfer ' UNION ALL
		SELECT N'Proceed_to_Checkout', N'Proceed to Checkout' UNION ALL
		SELECT N'Product_IsFeatured', N'Featured' UNION ALL
		SELECT N'Product_Image', N'Image' UNION ALL
		SELECT N'Product_Height', N'Height' UNION ALL
		SELECT N'Product_Length', N'Length' UNION ALL
		SELECT N'Product_Weight', N'Weight' UNION ALL
		SELECT N'Product_Width', N'Width' UNION ALL
		SELECT N'Product_IsAddedToInventory', N'Show on Inventory' UNION ALL
		SELECT N'Privacy_Policy_Agree', N'I read and agree with' UNION ALL
		SELECT N'Privacy_Policy_Message', N'Statement of Privacy' UNION ALL
		SELECT N'Purchase_app_Warning', N'You must first purchase an Application before you can buy this item.' UNION ALL
		SELECT N'Purchase_Notification_Warning', N'There was an error while sending Purchase notification e-mail. Please contact your Administrator.' UNION ALL
		SELECT N'Remove_From_Wishlist_Text', N'Remove from wishlist' UNION ALL
		SELECT N'Referral_Bonus', N'Bonus' UNION ALL
		SELECT N'Referral_Level', N'Level' UNION ALL
		SELECT N'Referral_Level_0', N'Level 0' UNION ALL
		SELECT N'Referral_Level_1', N'Level 1' UNION ALL
		SELECT N'Referral_Level_2', N'Level 2' UNION ALL
		SELECT N'Referral_Level_3', N'Level 3' UNION ALL
		SELECT N'Referral_Level_4', N'Level 4' UNION ALL
		SELECT N'Referral_Level_5', N'Level 5' UNION ALL
		SELECT N'Referrals_Member', N'Number of referrals' UNION ALL
		SELECT N'Referral_Members_Rule_Message', N'You still miss {0} members in the team to be able to use Superbonus. <br /> Minimum number of members = 1' UNION ALL
		SELECT N'Referral_Purchases_Rule_Message', N'You get a bonus from buying. So far, you did not make a purchase.' UNION ALL
		SELECT N'Registered_Users', N'Registered users' UNION ALL
		SELECT N'Referrals_Realized_Sales', N'Realized sales' UNION ALL
		SELECT N'Reward_points', N'Virtual Wallet' UNION ALL
		SELECT N'Success_EventDeleted', N'Event Entries successfully deleted!' UNION ALL
		SELECT N'Success_EventEntrySaved', N'Event entries successfully saved.' UNION ALL
		SELECT N'TipsForNewlyweds_Title', N'Tips for Newlyweds' UNION ALL
		SELECT N'Update_Cart', N'Update Cart' UNION ALL
		SELECT N'Validation_BreakEndTimeInvalid', N'Invalid Break end time!' UNION ALL
		SELECT N'Validation_BreakStartTimeGreater', N'Start time for Break is greater than end time!' UNION ALL
		SELECT N'Validation_BreakStartTimeInvalid', N'Invalid Break start time!' UNION ALL
		SELECT N'Validation_BreakTimeLonger', N'Break time is longer than Shift time!' UNION ALL
		SELECT N'Validation_BreakTimePeriodInvalid', N'Invalid Break time period!' UNION ALL
		SELECT N'Validation_BreatTimeNotEntered', N'Break time for settings is not entered!' UNION ALL
		SELECT N'Validation_CustomDatesNotSelected', N'Please select custom Dates.' UNION ALL
		SELECT N'Validation_DaysOfWeekNotSelected', N'Days of Week are not selected!' UNION ALL
		SELECT N'Validation_MemberData', N'Invalid Member Data!' UNION ALL
		SELECT N'Validation_MemberID', N'Invalid Member ID!' UNION ALL
		SELECT N'Validation_NumberOfTicketsNotEntered', N'Number of Customers is not entered!' UNION ALL
		SELECT N'Validation_PeriodEndDateOverlapping', N'End date for selected period is overlapping existing Event entries!' UNION ALL
		SELECT N'Validation_PeriodStartDateGreater', N'Start date for period is greater than end date!' UNION ALL
		SELECT N'Validation_PeriodStartDateOverlapping', N'Start date for selected period is overlapping existing Event entries!' UNION ALL
		SELECT N'Validation_PriceNotEntered', N'Prise is not entered!' UNION ALL
		SELECT N'Validation_SelectedPeriodOverlapping', N'Selected Period is overlapping existing!' UNION ALL
		SELECT N'Validation_ShiftStartTimeGreater', N'Start time for Shift is greater than end time!' UNION ALL
		SELECT N'Validation_ShiftTimePeriodInvalid', N'Invalid Shift time period!' UNION ALL
		SELECT N'Validation_VendorSetting_Success', N'Company settings have been changed!' UNION ALL
		SELECT N'Validation_VendorSetting_Warning', N'An error has been occurred during saving changes. Please try again!' UNION ALL
		SELECT N'VedorRegistration_Email_Content_AdvancedRegistration', N'You have successfully added your company in the Vendor Directory! Status of your advertising package is <strong>Free Basic</strong> listing.<br/>After we receive the payment, within 24 hours Status of your advertising package will be changed to <strong>{0}</ strong> listing.<br/><br/>Thank you for advertising your Company on the {1}.' UNION ALL
		SELECT N'Vendor_Contact_Headline_LeaveMessage', N'Leave a message' UNION ALL
		SELECT N'Vendor_Contact_Headline_WriteReview', N'Write your Review' UNION ALL
		SELECT N'Vendor_Contact_Placeholder_WriteMessage', N'Write a message...' UNION ALL
		SELECT N'Vendor_Contact_Subtitle', N'Contact {0}.<br />E-mail will be sent to the following email address: {1}' UNION ALL
		SELECT N'Vendor_Link_Registration', N'Vendor Registration' UNION ALL
		SELECT N'Vendor_Link_Registration_Tooltip', N'Sign Up for free and get listed today! Grow your business with {ApplicationTitle}.' UNION ALL
		SELECT N'Vendor_Literal_RateFirst', N'Rate it first' UNION ALL
		SELECT N'Vendor_Literal_Rating', N'Rating: {0}/5' UNION ALL
		SELECT N'Vendor_Literal_RatingNumOfUsers', N'from {0} users' UNION ALL
		SELECT N'Vendor_Literal_Views', N'Views {0}' UNION ALL
		SELECT N'Vendor_RelatedContent_Title', N'Featured Companies' UNION ALL
		SELECT N'Vendor_Review_Placeholder_WriteRevew', N'Write a review...' UNION ALL
		SELECT N'VendorDirectory_Title', N'Vendor Directory' UNION ALL
		SELECT N'VendorRegistration_Button_NextStep', N'Next Step' UNION ALL
		SELECT N'VendorRegistration_Button_PreviousStep', N'Previous Step' UNION ALL
		SELECT N'VendorRegistration_FirstStep_Subtitle', N'Vendor registration screen consists of four steps.<br /><strong>Note:</strong> All fields marked <strong style=color: #F86DA8;">*</strong> are required."' UNION ALL
		SELECT N'VendorRegistration_FourStep_Subtitle', N'Upload your company logo. Click on the button Browse" or "Choose File" and select the file from your computer.<br />If you currently don''t have a company logo, you can do this later!"' UNION ALL
		SELECT N'VendorRegistration_Message_Success', N'You have successfully added your company to the Vendor Directory!<br/>You can edit your company information using the following <a href="{0}">link</ a>.' UNION ALL
		SELECT N'VendorRegistration_Message_SuccessShort', N'You have successfully added your company to the Vendor Directory!' UNION ALL
		SELECT N'VendorRegistration_SecStep_Subtitle', N'Enter the name of your company or agency and select the corresponding category.<br />This is also good place where you can briefly explain why the couples should select your products or services.' UNION ALL
		SELECT N'VendorRegistration_ThirdStep_Subtitle', N'We recommend you to enter your address, location, phone, fax, mobile, e-mail or Web address.<br />All data will be visible to visitors of our portal.' UNION ALL
		SELECT N'Vlidation_UploadLogo_Format', N'Please upload a logo in one of the following formats {0}.' UNION ALL
		SELECT N'Vlidation_UploadLogo_Size', N'Maximum size of the logo is 1MB' UNION ALL
		SELECT N'Widget_LatestArticles_Headline', N'Latest Articles' UNION ALL
		SELECT N'Widget_Newsletter_Description', N'Subscribe to Our Newsletter to get Important News, Amazing Offers & Inside Scoops.' UNION ALL
		SELECT N'Widget_Newsletter_Headline', N'Newsletter Singup' UNION ALL
		SELECT N'Widget_RelatedFeeds_Title', N'Related Feeds' UNION ALL
		SELECT N'Message_Rating', N'Thank you for rating!' UNION ALL
		SELECT N'Message_AlredyRated', N'You have already rated.' UNION ALL
		SELECT N'Message_AlredyPosted', N'You have already posted.' UNION ALL
		SELECT N'Validation_Rating', N'Rating is required. Please rate.' UNION ALL
		SELECT N'Validation_RefferalBonus', N'Please enter a valid referral bonus amount' UNION ALL
		SELECT N'Validation_Post_Unauthorized', N'You are not authorized to post this message!' UNION ALL
		SELECT N'Message_AddedToBasket', N'Added to basket.' UNION ALL
		SELECT N'Message_RemovedFromBasket', N'Removed from basket.' UNION ALL
		SELECT N'Validation_ProductSelect', N'Please select Product.' UNION ALL 
		SELECT N'Button_PlaceOrder', N'Place Order' UNION ALL
		SELECT N'Error_CreatingCustomer', N'There was an error while creating customer.' UNION ALL
		SELECT N'Error_CreatingCreditCard', N'There was an error while creating credit card.' UNION ALL
		SELECT N'Error_CreatingMember', N'There was an error while creating Member.' UNION ALL
		SELECT N'Error_CreatingMemberToken', N'There was an error while generating Member Token.' UNION ALL
		SELECT N'Partner_Companies', N'Partner companies' UNION ALL
		SELECT N'Payment_Bank_Transfer_Warning', N'Once you have completed your order, you will receive the order details to e-mail. When your payment is recorded, the order delivery process will be launched' UNION ALL
		SELECT N'Payment_Credit_Card_Warning', N'Pay with your credit card. TEST MODE ENABLED. In test mode, you can use the card number 0000 0000 0000 0000 with any CVC and a valid expiration date.' UNION ALL
		SELECT N'Payment_Info_Warning', N'Make your payment directly into our bank account. Please use your Order ID as the payment reference. Your order won’t be shipped until the funds have cleared in our account.' UNION ALL
		SELECT N'PaymentSettings_CancellationPage', N'Cancellation Policy Page' UNION ALL
		SELECT N'PaymentSettings_PaymentCancelURL', N'Cancel URL' UNION ALL
		SELECT N'PaymentSettings_PaymentEnviroment', N'Enviroment' UNION ALL
		SELECT N'PaymentSettings_PaymentGateway', N'Payment Gateway' UNION ALL
		SELECT N'PaymentSettings_PaymentGatewayURL', N'Payment Gateway URL' UNION ALL
		SELECT N'PaymentSettings_PaymentPrivateKey', N'Payment Private Key' UNION ALL
		SELECT N'PaymentSettings_PaymentPublicKey', N'Payment Public Key' UNION ALL
		SELECT N'PaymentSettings_PaymentReturnErrorURL', N'Error URL' UNION ALL
		SELECT N'PaymentSettings_PaymentReturnURL', N'Return URL' UNION ALL
		SELECT N'PaymentSettings_PaymentMerchantID', N'Payment Merchant ID' UNION ALL
		SELECT N'PaymentSettings_PaymentsPageSettings', N'Payments Page Settings' UNION ALL
		SELECT N'PaymentSettings_PrivacyPage', N'Privacy Policy Page' UNION ALL
		SELECT N'PaymentSettings_RefundPage', N'Refund/Return Policy Page' UNION ALL
		SELECT N'PaymentSettings_TermsConditionPage', N'Terms and Conditions Page' UNION ALL
		SELECT N'Procesing_Payment', N'PROCESSING...' UNION ALL
		SELECT N'Product_Availability', N'Availability' UNION ALL
		SELECT N'Product_Description', N'Product Description' UNION ALL
		SELECT N'Product_Reviews', N'Reviews' UNION ALL
		SELECT N'Save_Info_Warning', N'Save my address and info for next time' UNION ALL
		SELECT N'Select_Country_Title', N'Please, select your country.' UNION ALL
		SELECT N'Share_Product_Title', N'Share this product' UNION ALL
		SELECT N'Share_ReferralLink_Title', N'Share your uniqoue referral link' UNION ALL
		SELECT N'Shop_Title', N'Shop' UNION ALL
		SELECT N'Signin_New_Customer', N'New Customer' UNION ALL
		SELECT N'Signin_Returning_Customer', N'Returning Customer' UNION ALL
		SELECT N'Signin_Returning_Customer_message', N'I am a returning customer' UNION ALL
		SELECT N'Store', N'Store' UNION ALL
		SELECT N'Subscription_cancelled', N'Your subscription {0} has been cancelled' UNION ALL
		SELECT N'Table_Purchases_Number', N'Number of purchases' UNION ALL
		SELECT N'Table_Sum', N'Sum' UNION ALL
		SELECT N'Total_Fund', N'Total fund' UNION ALL
		SELECT N'Trade_Margin', N'Trade Margin' UNION ALL
		SELECT N'Update_All_to_basket', N'Update All to basket' UNION ALL
		SELECT N'User_account', N'User account' UNION ALL
		SELECT N'User_data', N'User data' UNION ALL
		SELECT N'Username_or_email', N'Username or email' UNION ALL
		SELECT N'Webhooks_Error', N'Error' UNION ALL
		SELECT N'Wishlist_Title', N'Wishlist' UNION ALL
		SELECT N'Your_Order_Title', N'Your Order'
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
