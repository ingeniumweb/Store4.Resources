/*=CONCATENATE("SELECT N'";C2;"', N'";D2;"' UNION ALL")*/
DECLARE @ResourcesTable TABLE (Name VARCHAR (128), Value NVARCHAR (MAX), [Description] NVARCHAR (MAX))

DECLARE @ResourceID INT, @ResourceTypeID INT, @LanguageID INT
DECLARE @Name VARCHAR (128), @Value NVARCHAR (MAX), @Description NVARCHAR (MAX)

SET @ResourceTypeID = NULL
SELECT TOP 1 @ResourceTypeID = ResourceTypeID FROM ResourceTypes WHERE Name = 'AdminResources'
SET @ResourceTypeID = ISNULL (@ResourceTypeID, 0)

SET @LanguageID = NULL
SELECT TOP 1 @LanguageID = LanguageID FROM Languages WHERE CultureName = 'en-US' --AND IsEnabled = 1
SET @LanguageID = ISNULL (@LanguageID, 0)

IF (@ResourceTypeID > 0 AND @LanguageID > 0) BEGIN
	INSERT INTO @ResourcesTable (Name, Value)
		SELECT N'AuditEvent_Headline_Details', N'Details' UNION ALL
		SELECT N'AuditEvent_Item_Added', N'A new {0} item ''{1}'' with following ID ''{2}'' has been added.' UNION ALL
		SELECT N'AuditEvent_Item_BuiltIn', N'The {0} is built in and can''t be deleted.' UNION ALL
		SELECT N'AuditEvent_Item_Changed', N'A {0} item ''{1}'' with following ID ''{2}'' has been changed.' UNION ALL
		SELECT N'AuditEvent_Item_Deleted', N'A {0} item ''{1}'' with following ID ''{2}'' has been deleted.' UNION ALL
		SELECT N'AuditEvent_Item_ItemDoesntExists', N'{0} ''{1}'' doesn''t exist. Please, refresh {0} list and try again.' UNION ALL
		SELECT N'AuditEvent_Item_ItemExists', N'An item with the same name ''{0}'' already exists.' UNION ALL
		SELECT N'AuditEvent_Item_ItemSpecificExists', N'An {0} with the same {1} ''{2}'' already exists.' UNION ALL
		SELECT N'AuditEvent_Item_NotDeleted', N'A {0} item ''{1}'' with following ID ''{2}'' has not been deleted. Attached fields: ' UNION ALL
		SELECT N'AuditEvent_Item_Role_AssignedMemebers', N'Members are already assigned to this role.' UNION ALL
		SELECT N'AuditEvent_Item_TimeZone_Changed', N'A member {0} updated time zone to: ''{1}''.' UNION ALL
		SELECT N'AuditEvent_Message_ApplicationRestarded', N'Application has been successfully restarted.' UNION ALL
		SELECT N'AuditEvent_Message_TempFileDeleted', N'Temporary files have been successfully deleted.' UNION ALL
		SELECT N'AvatarPanel_Button_FileManager', N'File Manager' UNION ALL
		SELECT N'AvatarPanel_Button_ResetPhoto', N'Reset Photo' UNION ALL
		SELECT N'AvatarPanel_Button_SavePhoto', N'Save Photo' UNION ALL
		SELECT N'AvatarPanel_Button_UploadPhoto', N'Upload Photo' UNION ALL
		SELECT N'AvatarPanel_Description', N'You can upload a JPG, GIF or PNG file. File size limit is about 4 MB.' UNION ALL
		SELECT N'AvatarPanel_Message_Facebook', N'Authenticated via Facebook.' UNION ALL
		SELECT N'AvatarPanel_Message_HideEncrypted', N'This field contains confidential information. Please, click here to edit.' UNION ALL
		SELECT N'AvatarPanel_Message_Twitter', N'Authenticated via Twitter.' UNION ALL
		SELECT N'AvatarPanel_Message_Warning', N'Only images are allowed.' UNION ALL
		SELECT N'AvatarPanel_Reset_Confirm', N'Are you sure you want to reset avatar image?' UNION ALL
		SELECT N'AvatarPanel_Title', N'Upload a Photo' UNION ALL
		SELECT N'Button_Add', N'Add' UNION ALL
		SELECT N'Button_AddContact', N'Add Contact' UNION ALL
		SELECT N'Button_AddLookupGroup', N'Add Lookup Group' UNION ALL
		SELECT N'Button_AddNew', N'Add New' UNION ALL
		SELECT N'Button_AddRoles', N'Add Roles' UNION ALL
		SELECT N'Button_Apply', N'Apply' UNION ALL
		SELECT N'Button_Archive', N'Archive' UNION ALL
		SELECT N'Button_Assign', N'Assign' UNION ALL
		SELECT N'Button_Cancel', N'Cancel' UNION ALL
		SELECT N'Button_Clear', N'Clear' UNION ALL
		SELECT N'Button_Close', N'Close' UNION ALL
		SELECT N'Button_Compose', N'Compose' UNION ALL
		SELECT N'Button_Create', N'Create' UNION ALL
		SELECT N'Button_CreateRecord', N'Create Record' UNION ALL
		SELECT N'Button_Delete', N'Delete' UNION ALL
		SELECT N'Button_DeleteAll', N'Delete All' UNION ALL
		SELECT N'Button_DeleteTempFile', N'Delete Temporary files' UNION ALL
		SELECT N'Button_DownloadPDF', N'Download PDF' UNION ALL
		SELECT N'Button_Edit', N'Edit' UNION ALL
		SELECT N'Button_EditGallery', N'Edit Gallery' UNION ALL
		SELECT N'Button_Export', N'Export' UNION ALL
		SELECT N'Button_Follow', N'Follow' UNION ALL
		SELECT N'Button_GenerateAndSendPassword', N'Generate & Send Password' UNION ALL
		SELECT N'Button_GenerateAndSendPassword_DoneText', N'Done' UNION ALL
		SELECT N'Button_GenerateAndSendPassword_LoadingText', N'Generating...' UNION ALL
		SELECT N'Button_GenerateAPIToken', N'Generate a new API Token' UNION ALL
		SELECT N'Button_GenerateAPIToken_DoneText', N'Done' UNION ALL
		SELECT N'Button_GenerateAPIToken_LoadingText', N'Generating...' UNION ALL
		SELECT N'Button_GenerateStore', N'Generate Member Store' UNION ALL
		SELECT N'Button_GenerateStore_DoneText', N'Done' UNION ALL
		SELECT N'Button_GenerateStore_LoadingText', N'Generating Store...' UNION ALL
		SELECT N'Button_Grid', N'Grid' UNION ALL
		SELECT N'Button_Import', N'Import' UNION ALL
		SELECT N'Button_MappData', N'Mapp Data' UNION ALL
		SELECT N'Button_MarkAsRead', N'Mark as Read' UNION ALL
		SELECT N'Button_MoveToInbox', N'Move to Inbox' UNION ALL
		SELECT N'Button_Preview', N'Preview' UNION ALL
		SELECT N'Button_PrintPreview', N'Print Preview' UNION ALL
		SELECT N'Button_Refresh', N'Refresh' UNION ALL
		SELECT N'Button_Remove', N'Remove' UNION ALL
		SELECT N'Button_RemoveAll', N'Remove All' UNION ALL
		SELECT N'Button_RemoveToken', N'Remove Token' UNION ALL
		SELECT N'Button_RemoveToken_DoneText', N'Done' UNION ALL
		SELECT N'Button_RemoveToken_LoadingText', N'Removing...' UNION ALL
		SELECT N'Button_Resend', N'Resend' UNION ALL
		SELECT N'Button_Reset', N'Reset' UNION ALL
		SELECT N'Button_RestartApplication', N'Restart Application' UNION ALL
		SELECT N'Button_RestartApplication_DoneText', N'Restarted' UNION ALL
		SELECT N'Button_RestartApplication_LoadingText', N'Restarting...' UNION ALL
		SELECT N'Button_Save', N'Save' UNION ALL
		SELECT N'Button_SaveChanges', N'Save Changes' UNION ALL
		SELECT N'Button_SaveChanges_DoneText', N'Changes Saved' UNION ALL
		SELECT N'Button_SaveChanges_LoadingText', N'Saving...' UNION ALL
		SELECT N'Button_Search', N'Search' UNION ALL
		SELECT N'Button_Send', N'Send' UNION ALL
		SELECT N'Button_SendEmail', N'Send E-mail' UNION ALL
		SELECT N'Button_Sent', N'Sent' UNION ALL
		SELECT N'Button_Unfollow', N'Unfollow' UNION ALL
		SELECT N'Button_ViewAll', N'View All' UNION ALL
		SELECT N'ContentType_AccountSettings', N'Account Settings' UNION ALL
		SELECT N'ContentType_Article', N'Article' UNION ALL
		SELECT N'ContentType_BlogPost', N'Blog Post' UNION ALL
		SELECT N'ContentType_Campaign', N'Campaign' UNION ALL
		SELECT N'ContentType_CampaignList', N'Campaign List' UNION ALL
		SELECT N'ContentType_Category', N'Category' UNION ALL
		SELECT N'ContentType_City', N'City' UNION ALL
		SELECT N'ContentType_Comment', N'Comment' UNION ALL
		SELECT N'ContentType_Company', N'Company' UNION ALL
		SELECT N'ContentType_Contact', N'Contact' UNION ALL
		SELECT N'ContentType_Content', N'Content' UNION ALL
		SELECT N'ContentType_Country', N'Country' UNION ALL
		SELECT N'ContentType_CountyStateProvince', N'County/State/Province' UNION ALL
		SELECT N'ContentType_Domain', N'Domain' UNION ALL
		SELECT N'ContentType_EmailCampaign', N'Email Campaign' UNION ALL
		SELECT N'ContentType_Event', N'Event' UNION ALL
		SELECT N'ContentType_Field', N'Field' UNION ALL
		SELECT N'ContentType_Form', N'Form' UNION ALL
		SELECT N'ContentType_FormEntry', N'Form Entry' UNION ALL
		SELECT N'ContentType_Gallery', N'Gallery' UNION ALL
		SELECT N'ContentType_Group', N'Group' UNION ALL
		SELECT N'ContentType_IPBlockAddress', N'IP Block Address' UNION ALL
		SELECT N'ContentType_List', N'List' UNION ALL
		SELECT N'ContentType_Lookup', N'Lookup' UNION ALL
		SELECT N'ContentType_Media', N'Media' UNION ALL
		SELECT N'ContentType_MediaItem', N'Media Item' UNION ALL
		SELECT N'ContentType_Member', N'Member' UNION ALL
		SELECT N'ContentType_NavigationItem', N'Navigation Item' UNION ALL
		SELECT N'ContentType_News', N'News' UNION ALL
		SELECT N'ContentType_Note', N'Note' UNION ALL
		SELECT N'ContentType_Note_Additional_Info', N'Notes above your order, e.g. special notes for delivery' UNION ALL
		SELECT N'ContentType_Organization', N'Organization' UNION ALL
		SELECT N'ContentType_Portfolio', N'Portfolio' UNION ALL
		SELECT N'ContentType_Portfolios', N'Portfolios' UNION ALL
		SELECT N'ContentType_Role', N'Role' UNION ALL
		SELECT N'ContentType_Task', N'Task' UNION ALL
		SELECT N'ContentType_Template', N'Template' UNION ALL
		SELECT N'ContentType_Testimonial', N'Testimonial' UNION ALL
		SELECT N'Contract_Compliance_Percentage', N'Contract Compliance Percentage' UNION ALL
		SELECT N'Contract_Delay', N'Delay (in days)' UNION ALL
		SELECT N'Data_About', N'About' UNION ALL
		SELECT N'Data_Abbreviation', N'Abbreviation' UNION ALL
		SELECT N'Data_AccountType', N'Account Type' UNION ALL
		SELECT N'Data_Active', N'Active' UNION ALL
		SELECT N'Data_AdditionalInfo', N'Additional info' UNION ALL
		SELECT N'Data_Address', N'Address' UNION ALL
		SELECT N'Data_Admins', N'Admins' UNION ALL
		SELECT N'Data_AdminUse', N'Admin Use' UNION ALL
		SELECT N'Data_AdminUseOnly', N'Admin Use Only' UNION ALL
		SELECT N'Data_Allow', N'Allow' UNION ALL
		SELECT N'Data_AlternativeText', N'Alternative Text' UNION ALL
		SELECT N'Data_Application', N'Application' UNION ALL
		SELECT N'Data_Area', N'Area' UNION ALL
		SELECT N'Data_AreaCode', N'Area Code' UNION ALL
		SELECT N'Data_AssignedMember', N'Assigned Member' UNION ALL
		SELECT N'Data_BackgroundColor', N'Background Color' UNION ALL
		SELECT N'Data_CampaignEndDate', N'Campaign End Date' UNION ALL
		SELECT N'Data_CampaignEndDate_Required', N'Please change campaign end date.' UNION ALL
		SELECT N'Data_CampaignStartDate', N'Campaign Start Date' UNION ALL
		SELECT N'Data_CampaignStartDate_Required', N'Please select campaign start date.' UNION ALL
		SELECT N'Data_Capital', N'Capital' UNION ALL
		SELECT N'Data_Categories', N'Categories' UNION ALL
		SELECT N'Data_Category', N'Category' UNION ALL
		SELECT N'Data_City', N'City' UNION ALL
		SELECT N'Data_Client', N'Client' UNION ALL
		SELECT N'Data_Comment', N'Comment' UNION ALL
		SELECT N'Data_Company', N'Company' UNION ALL
		SELECT N'Data_CompanyAdmins', N'Company Admins' UNION ALL
		SELECT N'Data_CompanySize', N'Company Size' UNION ALL
		SELECT N'Data_Content', N'Content' UNION ALL
		SELECT N'Data_ContentType', N'Content Type' UNION ALL
		SELECT N'Data_ContentTypes', N'Content Types' UNION ALL
		SELECT N'Data_Countries', N'Countries' UNION ALL
		SELECT N'Data_Country', N'Country' UNION ALL
		SELECT N'Data_CountyStateProvince', N'County/State/Province' UNION ALL
		SELECT N'Data_Created', N'Created' UNION ALL
		SELECT N'Data_CssClass', N'CSS Class' UNION ALL
		SELECT N'Data_Description', N'Description' UNION ALL
		SELECT N'Data_Discount', N'Discount' UNION ALL
		SELECT N'Data_DisplayName', N'Display Name' UNION ALL
		SELECT N'Data_Domain', N'Domain' UNION ALL
		SELECT N'Data_Drafts', N'Drafts' UNION ALL
		SELECT N'Data_Email', N'Email' UNION ALL
		SELECT N'Data_Email_Invalid', N'Email format is invalid.' UNION ALL
		SELECT N'Data_Enabled', N'Enabled' UNION ALL
		SELECT N'Data_Entry', N'Entry' UNION ALL
		SELECT N'Data_Encrypted', N'Encrypted' UNION ALL
		SELECT N'Data_EndTime', N'End Time' UNION ALL
		SELECT N'Data_EventDate', N'Event Date' UNION ALL
		SELECT N'Data_EventEndDate', N'End Date' UNION ALL
		SELECT N'Data_EventLocation', N'Location' UNION ALL
		SELECT N'Data_EventStartDate', N'Start Date' UNION ALL
		SELECT N'Data_Fax', N'Fax' UNION ALL
		SELECT N'Data_Field', N'Field' UNION ALL
		SELECT N'Data_Fields', N'Fields' UNION ALL
		SELECT N'Data_FileOwner', N'File Owner' UNION ALL
		SELECT N'Data_Filter', N'Filter' UNION ALL
		SELECT N'Data_FirstName', N'First Name' UNION ALL
		SELECT N'Data_Form', N'Form' UNION ALL
		SELECT N'Data_Forms', N'Forms' UNION ALL
		SELECT N'Data_FormTypes', N'Form Types' UNION ALL
		SELECT N'Data_Group', N'Group' UNION ALL
		SELECT N'Data_GroupName', N'Group Name' UNION ALL
		SELECT N'Data_GroupOrder', N'Group Order' UNION ALL
		SELECT N'Data_HtmlBody', N'Html Body' UNION ALL
		SELECT N'Data_ID', N'ID' UNION ALL
		SELECT N'Data_ImageOwner', N'Image Owner' UNION ALL
		SELECT N'Data_Important', N'Important' UNION ALL
		SELECT N'Data_IncomingMailServer', N'Incoming Mail Server' UNION ALL
		SELECT N'Data_Industry', N'Industry' UNION ALL
		SELECT N'Data_Interval', N'Interval' UNION ALL
		SELECT N'Data_InvalidInput', N'Please enter a valid {0}.' UNION ALL
		SELECT N'Data_IP', N'IP Address' UNION ALL
		SELECT N'Data_IPAddress', N'IP Address' UNION ALL
		SELECT N'Data_IPAddresses', N'IP Addresses' UNION ALL
		SELECT N'Data_IsActive', N'Is Active' UNION ALL
		SELECT N'Data_IsDefaultSmptClient', N'Is Default Email Client' UNION ALL
		SELECT N'Data_IsFilterColumn', N'Is Filter Column' UNION ALL
		SELECT N'Data_IsMandatory', N'Is Mandatory' UNION ALL
		SELECT N'Data_IsPrivate', N'Is Private Group' UNION ALL
		SELECT N'Data_ISO', N'ISO' UNION ALL
		SELECT N'Data_ISO3', N'ISO3' UNION ALL
		SELECT N'Data_IsSortColumn', N'Is Sort Column' UNION ALL
		SELECT N'Data_IsSubForm', N'Is Subform' UNION ALL
		SELECT N'Data_IsSubscribed', N'Is Subscribed' UNION ALL
		SELECT N'Data_Language', N'Language' UNION ALL
		SELECT N'Data_LastLogin', N'Last Login' UNION ALL
		SELECT N'Data_LastName', N'Last Name' UNION ALL
		SELECT N'Data_LastStart', N'Last Start' UNION ALL
		SELECT N'Data_LastSuccess', N'Last Success' UNION ALL
		SELECT N'Data_LastSuccessfulLogin', N'Last Successful Login' UNION ALL
		SELECT N'Data_Latitude', N'Latitude' UNION ALL
		SELECT N'Data_LinkUrl', N'Link Url' UNION ALL
		SELECT N'Data_Longitude', N'Longitude' UNION ALL
		SELECT N'Data_Lookup', N'Lookup' UNION ALL
		SELECT N'Data_LookupGroup_Empty', N'The list of lookups is empty for now. Please click on {0} button to create a new lookup group.' UNION ALL
		SELECT N'Data_Mandatory', N'Mandatory' UNION ALL
		SELECT N'Data_Members', N'Members' UNION ALL
		SELECT N'Data_MembershipType', N'Membership Type' UNION ALL
		SELECT N'Data_Message', N'Message' UNION ALL
		SELECT N'Data_MessageType', N'Message Type' UNION ALL
		SELECT N'Data_MessageTypes', N'Message Types' UNION ALL
		SELECT N'Data_Mobile', N'Mobile' UNION ALL
		SELECT N'Data_MobileGrid', N'Mobile Grid' UNION ALL
		SELECT N'Data_Modified', N'Modified' UNION ALL
		SELECT N'Data_Name', N'Name' UNION ALL
		SELECT N'Data_NewsletterSubscriber', N'Newsletter Subscriber' UNION ALL
		SELECT N'Data_No', N'No' UNION ALL
		SELECT N'Data_None', N'None' UNION ALL
		SELECT N'Data_NotActive', N'Not Active' UNION ALL
		SELECT N'Data_NumberOfAttempts', N'Number of Attempts' UNION ALL
		SELECT N'Data_NumCode', N'Num Code' UNION ALL
		SELECT N'Data_OperatingStatus', N'Operating Status' UNION ALL
		SELECT N'Data_OrdersNumber', N'Enter Number of Orders' UNION ALL
		SELECT N'Data_OutgoingMailServer', N'Outgoing Mail Server' UNION ALL
		SELECT N'Data_Parent', N'Parent' UNION ALL
		SELECT N'Data_Password', N'Password' UNION ALL
		SELECT N'Data_Password_Incorrect', N'The password you entered is incorrect, please retype your current password.' UNION ALL
		SELECT N'Data_Percentage', N'Percentage' UNION ALL
		SELECT N'Data_Permalink', N'Permalink' UNION ALL
		SELECT N'Data_Permissions', N'Permissions' UNION ALL
		SELECT N'Data_Phone', N'Phone' UNION ALL
		SELECT N'Data_Placeholder', N'Placeholder' UNION ALL
		SELECT N'Data_PlainBody', N'Plain Body' UNION ALL
		SELECT N'Data_Population', N'Population' UNION ALL
		SELECT N'Data_Position', N'Position' UNION ALL
		SELECT N'Data_PossibleValues', N'Possible Values' UNION ALL
		SELECT N'Data_Primary', N'Primary' UNION ALL
		SELECT N'Data_PrimaryPhone', N'Primary Phone' UNION ALL
		SELECT N'Data_ProjectEndDate', N'Project End Date' UNION ALL
		SELECT N'Data_ProjectEndDate_Required', N'Please change project end date.' UNION ALL
		SELECT N'Data_ProjectStartDate', N'Project Start Date' UNION ALL
		SELECT N'Data_ProjectStartDate_Required', N'Please select project start date.' UNION ALL
		SELECT N'Data_ProjectUrl', N'Project Url' UNION ALL
		SELECT N'Data_Publish', N'Publish' UNION ALL
		SELECT N'Data_Published', N'Published' UNION ALL
		SELECT N'Data_Records', N'Records' UNION ALL
		SELECT N'Data_RepeatPassword', N'Repeat Password' UNION ALL
		SELECT N'Data_RepeatPassword_Mismatch', N'Password doesn''t match confirmation.' UNION ALL
		SELECT N'Data_Resource', N'Resource' UNION ALL
		SELECT N'Data_Result', N'Result' UNION ALL
		SELECT N'Data_Role', N'Role' UNION ALL
		SELECT N'Data_RowNumber', N'Row Number' UNION ALL
		SELECT N'Data_Schedule', N'Schedule' UNION ALL
		SELECT N'Data_Scheduler', N'' UNION ALL
		SELECT N'Data_SecondaryPhone', N'Secondary Phone' UNION ALL
		SELECT N'Data_Select', N'Select' UNION ALL
		SELECT N'Data_SentMail', N'Sent Mail' UNION ALL
		SELECT N'Data_Settings', N'Settings' UNION ALL
		SELECT N'Data_Settled', N'Settled' UNION ALL
		SELECT N'Data_ShowOnTable', N'Show On Table' UNION ALL
		SELECT N'Data_ShowProdDescription', N'Show description under document items' UNION ALL
		SELECT N'Data_ShowOnSignUpForm', N'Show On SignUp Form' UNION ALL
		SELECT N'Data_SignUp', N'SignUp' UNION ALL
		SELECT N'Data_Social_AccessToken', N'Access Token' UNION ALL
		SELECT N'Data_Social_AccessTokenSecret', N'Access Token Secret' UNION ALL
		SELECT N'Data_Social_AppID', N'App ID' UNION ALL
		SELECT N'Data_Social_AppSecret', N'App Secret' UNION ALL
		SELECT N'Data_Social_AssignMember', N'Assign Member to Following Roles.' UNION ALL
		SELECT N'Data_Social_ConsumerKey', N'Consumer Key' UNION ALL
		SELECT N'Data_Social_ConsumerSecret', N'Consumer Secret' UNION ALL
		SELECT N'Data_SortOrder', N'Sort Order' UNION ALL
		SELECT N'Data_SortPossibleValues', N'Sort Possible Values' UNION ALL
		SELECT N'Data_Source', N'Source' UNION ALL
		SELECT N'Data_Spam', N'Spam' UNION ALL
		SELECT N'Data_StartTime', N'Start Time' UNION ALL
		SELECT N'Data_Street1', N'Street 1' UNION ALL
		SELECT N'Data_Street2', N'Street 2' UNION ALL
		SELECT N'Data_Subform', N'Subform' UNION ALL
		SELECT N'Data_Subforms', N'Subforms' UNION ALL
		SELECT N'Data_Subject', N'Subject' UNION ALL
		SELECT N'Data_SubnetMask', N'Subnet Mask' UNION ALL
		SELECT N'Data_Subscribed', N'Subscribed' UNION ALL
		SELECT N'Data_SubscriberList', N'Subscriber List' UNION ALL
		SELECT N'Data_Table', N'Table' UNION ALL
		SELECT N'Data_Tags', N'Tags' UNION ALL
		SELECT N'Data_Task', N'Task' UNION ALL
		SELECT N'Data_TaskType', N'Task Type' UNION ALL
		SELECT N'Data_ThreeLetterISO', N'Three Letter ISO' UNION ALL
		SELECT N'Data_TimeSpan', N'Time Span' UNION ALL
		SELECT N'Data_TimeZone', N'Time Zone' UNION ALL
		SELECT N'Data_Title', N'Title' UNION ALL
		SELECT N'Data_TollFree', N'Toll-free' UNION ALL
		SELECT N'Data_TollFree_Long', N'Toll-free telephone number' UNION ALL
		SELECT N'Data_Trash', N'Trash' UNION ALL
		SELECT N'Data_TwoLetterISO', N'Two Letter ISO' UNION ALL
		SELECT N'Data_Type', N'Type' UNION ALL
		SELECT N'Data_Username', N'Username' UNION ALL
		SELECT N'Data_Value', N'Value' UNION ALL
		SELECT N'Data_Version', N'Version' UNION ALL
		SELECT N'Data_VerticalLayout', N'Vertical Layout' UNION ALL
		SELECT N'Data_WebGrid', N'Web Grid' UNION ALL
		SELECT N'Data_Website', N'Website' UNION ALL
		SELECT N'Data_Yes', N'Yes' UNION ALL
		SELECT N'Data_Zip', N'Zip' UNION ALL
		SELECT N'Date_PublishDate', N'Publish Date' UNION ALL
		SELECT N'Default_All', N'All' UNION ALL
		SELECT N'Default_CSV', N'CSV' UNION ALL
		SELECT N'Default_Export', N'Export' UNION ALL
		SELECT N'Default_Friends', N'Friends' UNION ALL
		SELECT N'Default_Import', N'Import' UNION ALL
		SELECT N'Default_Invitations', N'Invitations' UNION ALL
		SELECT N'Default_Search', N'Search...' UNION ALL
		SELECT N'Default_SearchTerm', N'Search term' UNION ALL
		SELECT N'Default_ShowAllRoles', N'Show All Roles' UNION ALL
		SELECT N'Default_StatusAll', N'Status (All)' UNION ALL
		SELECT N'Default_StatusAllowed', N'Allowed' UNION ALL
		SELECT N'Default_StatusBlocked', N'Blocked' UNION ALL
		SELECT N'Default_Statuses', N'Statuses' UNION ALL
		SELECT N'Default_StatusPublished', N'Published' UNION ALL
		SELECT N'Default_StatusUnpublished', N'Unpublished' UNION ALL
		SELECT N'Delivery', N'Delivery' UNION ALL
		SELECT N'Delivery_Day', N'Delivery day' UNION ALL
		SELECT N'Dialog_Title_Success', N'Success' UNION ALL
		SELECT N'Dialog_Title_Warning', N'Warning' UNION ALL
		SELECT N'Distance_Of_Two_Deliveries', N'Distance between the last 2 deliveries' UNION ALL
		SELECT N'Drfault_And', N'And' UNION ALL
		SELECT N'Drfault_OR', N'Or' UNION ALL
		SELECT N'DropDown_Default', N'Please Select' UNION ALL
		SELECT N'DropDown_FilterBy', N'Filter by {0}' UNION ALL
		SELECT N'DropDown_Message_PleaseSelectMembers', N'Please, select member(s) and try again.' UNION ALL
		SELECT N'DropDown_Select', N'Select {0}' UNION ALL
		SELECT N'DropDown_SortBy', N'Sort by {0}' UNION ALL
		SELECT N'DropDown_TimeZone', N'Please, select time zone' UNION ALL
		SELECT N'DropDown_Value_AllRoles', N'All Roles' UNION ALL
		SELECT N'Email_Compse_Field_Bcc', N'Bcc' UNION ALL
		SELECT N'Email_Compse_Field_Cc', N'Cc' UNION ALL
		SELECT N'Email_Compse_Field_From', N'From' UNION ALL
		SELECT N'Email_Compse_Field_To', N'To' UNION ALL
		SELECT N'Email_Compse_Title', N'Compose Message' UNION ALL
		SELECT N'EmailStatus_Read', N'Read' UNION ALL
		SELECT N'EmailStatus_Unread', N'Unread' UNION ALL
		SELECT N'Enable_ShippingCheckout', N'Enable shipping on checkout' UNION ALL
		SELECT N'Errors_403_Description', N'You are not authorized to access this page.' UNION ALL
		SELECT N'Errors_403_Headline', N'Access denied' UNION ALL
		SELECT N'Errors_403_Title', N'Unauthorized access' UNION ALL
		SELECT N'Errors_404_Description', N'The page you were looking for could not be found.' UNION ALL
		SELECT N'Errors_404_Headline', N'Whoops... Page Not Found' UNION ALL
		SELECT N'Errors_404_Title', N'Page Not Found' UNION ALL
		SELECT N'Errors_500_Description', N'Looks like something went wrong' UNION ALL
		SELECT N'Errors_500_Headline', N'An Error Occurred' UNION ALL
		SELECT N'Errors_500_Title', N'Site Error' UNION ALL
		SELECT N'Errors_Link_GoBack', N'Back to Homepage' UNION ALL
		SELECT N'Expected_Contract_Compliance_Percentage', N'Expected Contract Compliance Percentage' UNION ALL
		SELECT N'Link_Google', N'Google map link' UNION ALL
		SELECT N'Exporting_Headline', N'Export Data with the Data Export Wizard' UNION ALL
		SELECT N'Exporting_HelpBlock', N'Please choose which columns to export?.' UNION ALL
		SELECT N'Field_Encrypted_Message', N'The field value will be encrypted in the database.' UNION ALL
		SELECT N'Fields_Description', N'This area provides the ability to create <u><b>member profile fields</b></u> which will keep additional information about a member. Any field can be included to sign up form. The fields can be grouped as well. To change the order of a field just click on a table row and drag & drop the row into a specific position. To change a group order, please click on "Edit Group" button and drag & drop the group row into a specific position on. You can use these fields during sign up process or to fill that after the sign up.' UNION ALL
		SELECT N'Fields_Required_Headline', N'All fields marked with an asterisk (*) are required.' UNION ALL
		SELECT N'Filter_Headline', N'Filter {0}' UNION ALL
		SELECT N'Filter_Headline_Search', N'Search {0}' UNION ALL
		SELECT N'Friends_NoActiveConnections', N'No Active Connections' UNION ALL
		SELECT N'Gallery_Button_AddFiles', N'Add File(s)' UNION ALL
		SELECT N'Gallery_Button_AddMediaLink', N'Add Media Link' UNION ALL
		SELECT N'Gallery_Button_CancelUpload', N'Cancel upload' UNION ALL
		SELECT N'Gallery_Button_StartUpload', N'Start upload' UNION ALL
		SELECT N'Gallery_Title', N'{0} Gallery' UNION ALL
		SELECT N'HelpBlock_AdminUseOnly', N'The admin members will see this group only.' UNION ALL
		SELECT N'HelpBlock_AlternativeText', N'Alternative text or optional subtitle to display.' UNION ALL
		SELECT N'HelpBlock_CampaignPosition', N'Campaign item position in campaign list (eg. 1, 2, 3 etc.)' UNION ALL
		SELECT N'HelpBlock_CampaignsSent', N'The Campaign has been sent.' UNION ALL
		SELECT N'HelpBlock_Category', N'You must provide a category name.' UNION ALL
		SELECT N'HelpBlock_ClassName', N'Optional additional CSS classes to apply to this item.' UNION ALL
		SELECT N'HelpBlock_ContentTitle', N'You must provide a {0} title.' UNION ALL
		SELECT N'HelpBlock_Default', N'You must provide a {0} name.' UNION ALL
		SELECT N'HelpBlock_Email', N'You must provide a valid E-mail.' UNION ALL
		SELECT N'HelpBlock_Encrypted', N'The field value will be stored encrypted in the database and you can''t edit this flag after.' UNION ALL
		SELECT N'HelpBlock_Field_AdminUseOnly', N'The admin members will see this field only.' UNION ALL
		SELECT N'HelpBlock_Field_IsActive', N'If unchecked then the field is hidden.' UNION ALL
		SELECT N'HelpBlock_Field_ShowOnTable', 'If unchecked then the values will not be shown on the related table.' UNION ALL
		SELECT N'HelpBlock_GroupOrder', N'To change the group order just drag & drop appropriate item in the group table below to place you need:' UNION ALL
		SELECT N'HelpBlock_IPAddress', N'You must provide an IP Address.' UNION ALL
		SELECT N'HelpBlock_IsActive', N'The members don''t see this group on the profile page if it is not active.' UNION ALL
		SELECT N'HelpBlock_Lookup', N'You must provide a Lookup name' UNION ALL
		SELECT N'HelpBlock_MediaEmbed', N'Embed a vimeo or youtube video.' UNION ALL
		SELECT N'HelpBlock_MediaTitle', N'You must provide a media title.' UNION ALL
		SELECT N'HelpBlock_MenuPosition', N'Menu item position in menu, using decimal places (eg. 1, 1.1, 1.12 etc.).' UNION ALL
		SELECT N'HelpBlock_Permalink', N'Save the current item and leave the input empty to have it automatically generated using the pattern Title e.g., my-page' UNION ALL
		SELECT N'HelpBlock_RoleName', N'This rols is built in, so you can''t change the role name.' UNION ALL
		SELECT N'HelpBlock_SubnetMask', N'Subnet mask ''255.255.255.0'' blocks network from 83.116.119.0 to 83.116.119.255.' UNION ALL
		SELECT N'HelpBlock_Tags', N'Separate multiple tags with commas' UNION ALL
		SELECT N'HelpBlock_Username', N'You must provide a Username.' UNION ALL
		SELECT N'HelpBlock_VerticalLayout', N'Use vertical layout for checkbox and radio button group only' UNION ALL
		SELECT N'Importing_Contacts_Headline', N'Importing Contacts Report' UNION ALL
		SELECT N'Importing_Delimiter', N'Choose your delimiter' UNION ALL
		SELECT N'Importing_Headline', N'Import Data with the Data Import Wizard' UNION ALL
		SELECT N'Importing_HelpBlock', N'Please map each coulmn of your source CSV file to one of destination columns.' UNION ALL
		SELECT N'Importing_Members_Headline', N'Importing Members Report' UNION ALL
		SELECT N'Importing_Roles_Headline', N'Importing Roles Report' UNION ALL
		SELECT N'Inventory_Only_Summary', N'Show Only Summary' UNION ALL
		SELECT N'Link_AddField', N'Add Field' UNION ALL
		SELECT N'Link_AddGroup', N'Add Group' UNION ALL
		SELECT N'Link_Details', N'Details' UNION ALL
		SELECT N'Link_EditField', N'Edit Field' UNION ALL
		SELECT N'Link_EditGroup', N'Edit Group' UNION ALL
		SELECT N'Link_Entries', N'Entries' UNION ALL
		SELECT N'Link_Fields', N'Fields' UNION ALL
		SELECT N'Link_Gallery', N'Gallery' UNION ALL
		SELECT N'Link_GoBack', N'Go Back' UNION ALL
		SELECT N'Link_Link', N'Link' UNION ALL
		SELECT N'Link_LogOut', N'Logout' UNION ALL
		SELECT N'Link_Preview', N'Preview' UNION ALL
		SELECT N'Link_RemoveFields', N'Remove Field(s)' UNION ALL
		SELECT N'Link_RemoveGroup', N'Remove Group' UNION ALL
		SELECT N'Link_Run', N'Run' UNION ALL
		SELECT N'Link_View', N'View' UNION ALL
		SELECT N'Members_Message_AccountNotExists', N'The account doesn''t exists.' UNION ALL
		SELECT N'Members_Message_AuthorizedToModifyData', N'You are not authorized to make changes.' UNION ALL
		SELECT N'Members_Message_MemberTokenCreated', N'The token has been created.' UNION ALL
		SELECT N'Members_Message_MemberTokenRemoved', N'The token has been removed.' UNION ALL
		SELECT N'Members_Message_NumberOfUsers', N'You have exceeded the maximum number of member accounts you are allowed to create.' UNION ALL
		SELECT N'Members_Message_PasswordNonAlphaNumeric', N'The name contains non-alpha numeric characters (#@!$ etc...). Please change it.' UNION ALL
		SELECT N'Members_Message_RandomPassDidNotSend', N'Something went wrong. Random password has been generated but didn''t send to the member.' UNION ALL
		SELECT N'Members_Message_RandomPassSent', N'Random password has been generated and sent to the member.' UNION ALL
		SELECT N'Members_Message_UserNameIsSameAsEmail', N'The member''s name looks like an e-mail address. Please change it.' UNION ALL
		SELECT N'Message_Members_Desc', N'In progress, please wait ...' UNION ALL
		SELECT N'Message_Members_Title', N'Importing Roles' UNION ALL
		SELECT N'Message_Roles_Desc', N'In progress, please wait ...' UNION ALL
		SELECT N'Message_Roles_Title', N'Importing Roles' UNION ALL
		SELECT N'ModalTitle_Add', N'Add {0}' UNION ALL
		SELECT N'ModalTitle_AssignRoles', N'Assign roles to {0}' UNION ALL
		SELECT N'ModalTitle_Edit', N'Edit' UNION ALL
		SELECT N'ModalTitle_New', N'New {0}' UNION ALL
		SELECT N'No_Delivery_Packages', N'Number of delivery packages' UNION ALL
		SELECT N'Package_Delivered', N'Package Delivered' UNION ALL
		SELECT N'Packet_Lag', N'The packet lag' UNION ALL
		SELECT N'Pager_ShowingEntries', N'Showing <b>{0}</b> to <b>{1}</b> of <b>{2}</b> entries' UNION ALL
		SELECT N'Placaholder_Default', N'Enter {0}' UNION ALL
		SELECT N'Planned_Delivery', N'Planned for delivery' UNION ALL
		SELECT N'Profile_Message_HideEncrypted', N'This field contains confidential information. Please, click here to edit' UNION ALL
		SELECT N'Profile_Message_PhotoNotReset', N'Photo has not been reset: ' UNION ALL
		SELECT N'Profile_Message_PhotoNotSaved', N'Your new photo has not been saved successfully: ' UNION ALL
		SELECT N'Profile_Message_PhotoReset', N'Photo has been reset.' UNION ALL
		SELECT N'Profile_Message_PhotoSaved', N'Your new photo has been saved successfully.' UNION ALL
		SELECT N'Profile_Message_ProfileSaved', N'Your profile has been updated successfully.' UNION ALL
		SELECT N'Profile_Setting_Headline_FieldSettings', N'{0} Settings' UNION ALL
		SELECT N'Profile_Setting_Headline_General', N'General Settings' UNION ALL
		SELECT N'Profile_Setting_Message_DomainSwitched', N'The profile for current domain ''{0}'' is switched off. Please contact site administrator.' UNION ALL
		SELECT N'RemoveDialog_Description', N'Are you sure to remove selected item(s)?' UNION ALL
		SELECT N'RemoveDialog_Title', N'Remove item(s)' UNION ALL
		SELECT N'ResizeAvatar_Description', N'To make adjustments, you can drag around and resize the square below.<br/> When you are happy with your photo click the “Save Photo” button.' UNION ALL
		SELECT N'ResizeAvatar_Headline', N'To the left is what your content cover will look like.' UNION ALL
		SELECT N'ResizeAvatar_Title', N'Resize Photo' UNION ALL
		SELECT N'Roles_Assign_Description', N'Are you sure you want to assign the <span style=''background-color:#{0};'' class="label">{1}</span> role to selected member(s)?' UNION ALL
		SELECT N'Roles_Assign_Headline', N'Assign Roles' UNION ALL
		SELECT N'Roles_Assigned_Headline', N'Assigned Roles' UNION ALL
		SELECT N'Roles_Reset_Description', N'Are you sure you want to reset the <span style=''background-color:#{0};'' class="label">{1}</span> role to selected member(s)?' UNION ALL
		SELECT N'Roles_Reset_Headline', N'Reset Roles' UNION ALL
		SELECT N'Settings_Data_Activation', N'Activation' UNION ALL
		SELECT N'Settings_Data_AddGroupAsRole', N'Add Group as Role' UNION ALL
		SELECT N'Settings_Data_AdminEmail', N'Admin E-mail' UNION ALL
		SELECT N'Settings_Data_AndRedirectTo', N'And Redirect To' UNION ALL
		SELECT N'Settings_Data_APIEnabled', N'API Enabled' UNION ALL
		SELECT N'Settings_Data_APISecretURL', N'API Secret URL' UNION ALL
		SELECT N'Settings_Data_ApplicationName', N'Application Name' UNION ALL
		SELECT N'Settings_Data_ApplicationPath', N'Application Path' UNION ALL
		SELECT N'Settings_Data_AssignMemberToRole', N'Assign Member to Role' UNION ALL
		SELECT N'Settings_Data_AuthCookieName', N'Auth Cookie Name' UNION ALL
		SELECT N'Settings_Data_Bcc', N'Blind Carbon Copy (Bcc)' UNION ALL
		SELECT N'Settings_Data_DefaultPagingSize', N'Default Paging Size' UNION ALL
		SELECT N'Settings_Data_DefaultUILanguage', N'Default UI Language' UNION ALL
		SELECT N'Settings_Data_DomainName', N'Domain Name' UNION ALL
		SELECT N'Settings_Data_EnablePrivacyAndPolicyConfirmation', N'Enable Privacy and policy confirmation' UNION ALL
		SELECT N'Settings_Data_Fluid', N'Fluid' UNION ALL
		SELECT N'Settings_Data_GoogleAnalyticsID', N'Google Analytics Tracking ID' UNION ALL
		SELECT N'Settings_Data_GooglePublisherId', N'Google Publisher Id' UNION ALL
		SELECT N'Settings_Data_LDAP_Domain', N'LDAP Domain' UNION ALL
		SELECT N'Settings_Data_LDAP_MemberToRole', N'Add Member to Role' UNION ALL
		SELECT N'Settings_Data_LDAP_Path', N'LDAP Path' UNION ALL
		SELECT N'Settings_Data_LDAPEnabled', N'LDAP Enabled' UNION ALL
		SELECT N'Settings_Data_LDAPUseOnly', N'LDAP Use Only' UNION ALL
		SELECT N'Settings_Data_Logs', N'Logs' UNION ALL
		SELECT N'Settings_Data_MailDomains', N'Mail Domains' UNION ALL
		SELECT N'Settings_Data_MailDomains_AllowAll', N'Allow All (Excluding from the list)' UNION ALL
		SELECT N'Settings_Data_MailDomains_DenyAll', N'Deny All (Excluding from the list)' UNION ALL
		SELECT N'Settings_Data_MaintenanceTime', N'Maintenance Time' UNION ALL
		SELECT N'Settings_Data_MaintenanceTimeURL', N'Maintenance Time URL' UNION ALL
		SELECT N'Settings_Data_MandrilAPIKey', N'Mandril API Key' UNION ALL
		SELECT N'Settings_Data_PasswordChange', N'Password Change' UNION ALL
		SELECT N'Settings_Data_PasswordFailed', N'If Password Was Failed' UNION ALL
		SELECT N'Settings_Data_RedirectAfterSignIn', N'Redirect After Sign In' UNION ALL
		SELECT N'Settings_Data_RedirectAfterSignOut', N'Redirect After Sign Out' UNION ALL
		SELECT N'Settings_Data_RedirectAfterSignUp', N'Redirect After Sing Up' UNION ALL
		SELECT N'Settings_Data_Registration', N'Registration' UNION ALL
		SELECT N'Settings_Data_ResetPassword', N'Reset Password' UNION ALL
		SELECT N'Settings_Data_SecretAdminURL', N'Secret Admin URL' UNION ALL
		SELECT N'Settings_Data_SelfActivation', N'Self-Activation' UNION ALL
		SELECT N'Settings_Data_SelfActivationRoles', N'Self-Activation Roles' UNION ALL
		SELECT N'Settings_Data_SelfRegistration', N'Self-Registration' UNION ALL
		SELECT N'Settings_Data_SelfRegistrationRoles', N'Self-Registration Roles' UNION ALL
		SELECT N'Settings_Data_SendEmail', N'Send Email' UNION ALL
		SELECT N'Settings_Data_SendEmailsViaMandrilAPI', N'Send Emails via Mandril API' UNION ALL
		SELECT N'Settings_Data_SendEmailsViaSendGridAPI', N'Send Emails via SendGrid API' UNION ALL
		SELECT N'Settings_Data_SMTPHost', N'SMTP Host' UNION ALL
		SELECT N'Settings_Data_SMTPPassword', N'SMTP Password' UNION ALL
		SELECT N'Settings_Data_SMTPPort', N'SMTP Port' UNION ALL
		SELECT N'Settings_Data_SMTPUserEmail', N'SMTP User Email' UNION ALL
		SELECT N'Settings_Data_SMTPUserName', N'SMTP User Name' UNION ALL
		SELECT N'Settings_Data_SN_Blogger', N'Blogger' UNION ALL
		SELECT N'Settings_Data_SN_Facebook', N'Facebook' UNION ALL
		SELECT N'Settings_Data_SN_Google', N'Google' UNION ALL
		SELECT N'Settings_Data_SN_LiveJournal', N'Live Journal' UNION ALL
		SELECT N'Settings_Data_SN_myOpenID', N'myOpenID' UNION ALL
		SELECT N'Settings_Data_SN_OpenID', N'OpenID' UNION ALL
		SELECT N'Settings_Data_SN_Twitter', N'Twitter' UNION ALL
		SELECT N'Settings_Data_SN_Yahoo', N'Yahoo' UNION ALL
		SELECT N'Settings_Data_SSL', N'SSL' UNION ALL
		SELECT N'Settings_Data_SublimeToken', N'Sublime Token' UNION ALL
		SELECT N'Settings_Data_Theme', N'Theme' UNION ALL
		SELECT N'Settings_HelpBlock_AddGroupAsRole', N'Add members groups as role automatically if it doesn''t exists.' UNION ALL
		SELECT N'Settings_HelpBlock_AdminEmail', N'The E-mail address of the site admin.' UNION ALL
		SELECT N'Settings_HelpBlock_AndRedirectTo', N'Redirect to the url if account was blocked.' UNION ALL
		SELECT N'Settings_HelpBlock_APIEnabled', N'Enables API support.' UNION ALL
		SELECT N'Settings_HelpBlock_APISecretURL', N'The URL which will be used for API method execution.' UNION ALL
		SELECT N'Settings_HelpBlock_ApplicationName', N'The name of the application.' UNION ALL
		SELECT N'Settings_HelpBlock_ApplicationPath', N'Application''s absolute path.' UNION ALL
		SELECT N'Settings_HelpBlock_AuthCookieName', N'The name of the cookie which will use for the user authentication.' UNION ALL
		SELECT N'Settings_HelpBlock_Bcc', N'This is a copy of an email message sent to a recipient whose email address does not appear in the message.<br/> Use "," - comma as separator.' UNION ALL
		SELECT N'Settings_HelpBlock_DefaultPagingSize', N'The default page size for all grids.' UNION ALL
		SELECT N'Settings_HelpBlock_DefaultUILanguage', N'Default public UI language.' UNION ALL
		SELECT N'Settings_HelpBlock_DomainName', N'The website domain.' UNION ALL
		SELECT N'Settings_HelpBlock_Fluid', N'Enable fluid behavior for admin UI.' UNION ALL
		SELECT N'Settings_HelpBlock_GoogleAnalyticsID', N'This is the Universal Google Analytics tracking code.' UNION ALL
		SELECT N'Settings_HelpBlock_GooglePublisherId', N'Google+ Publisher Id.' UNION ALL
		SELECT N'Settings_HelpBlock_LDAP_Domain', N'LDAP mail domain which will be used for member name.' UNION ALL
		SELECT N'Settings_HelpBlock_LDAP_Path', N'When connecting to AD you can use "serverless" binding or you can specify a serverbound to use everytime (server bound). Here''s an example of using both:' UNION ALL
		SELECT N'Settings_HelpBlock_LDAPEnabled', N'Using LDAP as primary for a member authentication.' UNION ALL
		SELECT N'Settings_HelpBlock_LDAPUseOnly', N'Using LDAP authentication only. Please, add LDAP admin user to Admins role before.' UNION ALL
		SELECT N'Settings_HelpBlock_Logs', N'Enable logs functionality.' UNION ALL
		SELECT N'Settings_HelpBlock_MailDomains', N'Restricted mail domain list.</br> Use "," - comma as separator' UNION ALL
		SELECT N'Settings_HelpBlock_MaintenanceTime', N'Switch to the maintenance mode.' UNION ALL
		SELECT N'Settings_HelpBlock_MaintenanceTimeURL', N'Local or external path of maintenance page.' UNION ALL
		SELECT N'Settings_HelpBlock_MandrilAPIKey', N'The Mandrill API Key for Mandrill Api used for sending emails.' UNION ALL
		SELECT N'Settings_HelpBlock_MemberToRole', N'Assign created member to the following roles.' UNION ALL
		SELECT N'Settings_HelpBlock_PasswordFailed', N'Role list (Blocked; Blocked > 5 for instance).' UNION ALL
		SELECT N'Settings_HelpBlock_RedirectAfterAccountActivation', N'Redirect to the url after success account activation.' UNION ALL
		SELECT N'Settings_HelpBlock_RedirectAfterSignIn', N'Redirect to the url after sign in if there is no back link.' UNION ALL
		SELECT N'Settings_HelpBlock_RedirectAfterSignOut', N'Redirect to the url after sign out if there is no back link.' UNION ALL
		SELECT N'Settings_HelpBlock_RedirectAfterSignUp', N'Redirect to the url after sign up if there is no back link.' UNION ALL
		SELECT N'Settings_HelpBlock_ResetPassword', N'Enables reset password functionality,' UNION ALL
		SELECT N'Settings_HelpBlock_SecretAdminURL', N'The administration secret URL.' UNION ALL
		SELECT N'Settings_HelpBlock_SelfActivation', N'Enables self-activation functionality' UNION ALL
		SELECT N'Settings_HelpBlock_SelfActivationRoles', N'Assign member to these roles after self-activation.' UNION ALL
		SELECT N'Settings_HelpBlock_SelfRegistration', N'Enables self-registration functionality.' UNION ALL
		SELECT N'Settings_HelpBlock_SelfRegistrationRoles', N'Assign member to these roles after self-registration' UNION ALL
		SELECT N'Settings_HelpBlock_SendEmailsViaMandrilAPI', N'Enable Madrill for sending emails.' UNION ALL
		SELECT N'Settings_HelpBlock_SendEmailsViaSendGridAPI', N'Enable SendGrid for sending emails.' UNION ALL
		SELECT N'Settings_HelpBlock_SMTPHost', N'SMTP server host used for sending emails (e.g. smtp.domainname.com).' UNION ALL
		SELECT N'Settings_HelpBlock_SMTPPassword', N'The password for the SMTP account used for sending emails.' UNION ALL
		SELECT N'Settings_HelpBlock_SMTPPort', N'The port for SMTP server used for sending emails.' UNION ALL
		SELECT N'Settings_HelpBlock_SMTPUserEmail', N'The user email for SMTP account used for sending emails.' UNION ALL
		SELECT N'Settings_HelpBlock_SMTPUserName', N'The user name for SMTP account used for sending emails.' UNION ALL
		SELECT N'Settings_HelpBlock_SN_Blogger', N'Enable login via Blogger.' UNION ALL
		SELECT N'Settings_HelpBlock_SN_Facebook', N'Enable login via Facebook.' UNION ALL
		SELECT N'Settings_HelpBlock_SN_Google', N'Enable login via Google.' UNION ALL
		SELECT N'Settings_HelpBlock_SN_LiveJournal', N'Enable login via Live Journal.' UNION ALL
		SELECT N'Settings_HelpBlock_SN_myOpenID', N'Enable login via LivemyOpenIDl.' UNION ALL
		SELECT N'Settings_HelpBlock_SN_OpenID', N'Enable login via OpenID.' UNION ALL
		SELECT N'Settings_HelpBlock_SN_Twitter', N'Enable login via Twitter.' UNION ALL
		SELECT N'Settings_HelpBlock_SN_Yahoo', N'Enable login via Yahoo.' UNION ALL
		SELECT N'Settings_HelpBlock_SSL', N'Enable SSL connection between application and mail server.' UNION ALL
		SELECT N'Settings_HelpBlock_SublimeToken', N'The Sublime Token Id.' UNION ALL
		SELECT N'Settings_HelpBlock_Theme', N'Select application main theme.' UNION ALL
		SELECT N'Settings_Instructions_SN_Facebook', N'To use this option you must first setup a <a href="https://developers.facebook.com/apps"> Facebook App.</a>' UNION ALL
		SELECT N'Settings_Instructions_SN_Facebook_Detailed', N'It is recommended that users be able to authenticate with Facebook when using Socialize so as to maximize the exposure and promotion of your app. First step for Facebook is retrieve the App ID and App Secret (it is based on oAuth 2.0), so register you application on <a href=https://developers.facebook.com/apps">https://developers.facebook.com/apps</a>."' UNION ALL
		SELECT N'Settings_Instructions_SN_Twitter', N'To use this option you must first setup a <a href="https://dev.twitter.com/apps/new" target="_blank">Twitter App.</a>' UNION ALL
		SELECT N'Settings_Instructions_SN_Twitter_Detailed', N'You need to register your application with Twitter. That means you should have your production URL ready before you think to start your development. When you finished with registration, you will receive consumer key and consumer secret. These unique credentials will help your app to interact with Twitter. No big deal. You can visit your all registered applications on <a href="http://twitter.com/oauth">http://twitter.com/oauth</a>. And to register for new app you need to visit <a href="http://twitter.com/apps/new">http://twitter.com/apps/new</a>.' UNION ALL
		SELECT N'Settings_RedirectAfterAccountActivation', N'Redirect After Account Activation' UNION ALL
		SELECT N'SiteMenu_AccountSettings', N'Account Settings' UNION ALL
		SELECT N'SiteMenu_Ads', N'Ads/Banners' UNION ALL
		SELECT N'SiteMenu_Articles', N'Articles' UNION ALL
		SELECT N'SiteMenu_Audit', N'Event Log' UNION ALL
		SELECT N'SiteMenu_Blog', N'Blog' UNION ALL
		SELECT N'SiteMenu_Campaigns', N'Campaigns' UNION ALL
		SELECT N'SiteMenu_Categories', N'Categories' UNION ALL
		SELECT N'SiteMenu_Cities', N'Cities' UNION ALL
		SELECT N'SiteMenu_Comments', N'Comments' UNION ALL
		SELECT N'SiteMenu_Companies', N'Companies' UNION ALL
		SELECT N'SiteMenu_Connections', N'Connections' UNION ALL
		SELECT N'SiteMenu_Content', N'Content' UNION ALL
		SELECT N'SiteMenu_Countries', N'Countries' UNION ALL
		SELECT N'SiteMenu_CountyStateProvinces', N'County/State/Provinces' UNION ALL
		SELECT N'SiteMenu_CRM', N'CRM' UNION ALL
		SELECT N'SiteMenu_Dashboard', N'Dashboard' UNION ALL
		SELECT N'SiteMenu_Description_Default', N'{0} Editor' UNION ALL
		SELECT N'SiteMenu_Description_Lists', N'Lists Editor (FAQs)' UNION ALL
		SELECT N'SiteMenu_Description_Settings', N'Global Settings' UNION ALL
		SELECT N'SiteMenu_Description_Support', N'Help & Support' UNION ALL
		SELECT N'SiteMenu_Domains', N'Domains' UNION ALL
		SELECT N'SiteMenu_EmailCampaigns', N'Email Campaigns' UNION ALL
		SELECT N'SiteMenu_Events', N'Events' UNION ALL
		SELECT N'SiteMenu_Fields', N'Fields' UNION ALL
		SELECT N'SiteMenu_FilesManager', N'Files Manager' UNION ALL
		SELECT N'SiteMenu_FormBuilder', N'Form Builder' UNION ALL
		SELECT N'SiteMenu_FormCategories', N'Form Categories' UNION ALL
		SELECT N'SiteMenu_FormEntries', N'Form Entries' UNION ALL
		SELECT N'SiteMenu_FormFields', N'Form Fields' UNION ALL
		SELECT N'SiteMenu_FormLookups', N'Form Lookups' UNION ALL
		SELECT N'SiteMenu_FormSettings', N'Form Settings' UNION ALL
		SELECT N'SiteMenu_Forms', N'Forms' UNION ALL
		SELECT N'SiteMenu_Friends', N'Friends' UNION ALL
		SELECT N'SiteMenu_Home', N'Home' UNION ALL
		SELECT N'SiteMenu_HtmlTemplates', N'Html Templates' UNION ALL
		SELECT N'SiteMenu_Inbox', N'Inbox' UNION ALL
		SELECT N'SiteMenu_IPBlockList', N'IP Block List' UNION ALL
		SELECT N'SiteMenu_Lists', N'Lists' UNION ALL
		SELECT N'SiteMenu_Locations', N'Locations' UNION ALL
		SELECT N'SiteMenu_Lookups', N'Lookups' UNION ALL
		SELECT N'SiteMenu_Marketing', N'Marketing' UNION ALL
		SELECT N'SiteMenu_Members', N'Members' UNION ALL
		SELECT N'SiteMenu_Messages', N'Messages' UNION ALL
		SELECT N'SiteMenu_News', N'News' UNION ALL
		SELECT N'SiteMenu_Organizations', N'Organizations' UNION ALL
		SELECT N'SiteMenu_Pages', N'Pages' UNION ALL
		SELECT N'SiteMenu_Plugins', N'Plugins' UNION ALL
		SELECT N'SiteMenu_Portfolios', N'Portfolios' UNION ALL
		SELECT N'SiteMenu_Posts', N'Posts' UNION ALL
		SELECT N'SiteMenu_Profile', N'Profile' UNION ALL
		SELECT N'SiteMenu_Roles', N'Roles' UNION ALL
		SELECT N'SiteMenu_ScheduledTasks', N'Scheduled Tasks' UNION ALL
		SELECT N'SiteMenu_Security', N'Security' UNION ALL
		SELECT N'SiteMenu_Settings', N'Settings' UNION ALL
		SELECT N'SiteMenu_SignOut', N'Sign Out' UNION ALL
		SELECT N'SiteMenu_SiteContent', N'Site Content' UNION ALL
		SELECT N'SiteMenu_SiteNavigation', N'Site Navigation' UNION ALL
		SELECT N'SiteMenu_SubscriberLists', N'Subscriber Lists' UNION ALL
		SELECT N'SiteMenu_Subscribers', N'Subscribers' UNION ALL
		SELECT N'SiteMenu_Support', N'Support' UNION ALL
		SELECT N'SiteMenu_Tasks', N'Tasks' UNION ALL
		SELECT N'SiteMenu_Testimonials', N'Testimonials' UNION ALL
		SELECT N'Store_Name_Placeholder', N'Enter valid Store Name' UNION ALL	
		SELECT N'Tabs_Address', N'Address' UNION ALL
		SELECT N'Tabs_API', N'API' UNION ALL
		SELECT N'Tabs_API_Description', N'In order to access the API, you need two pieces of information. The first is a member email which is a unique code that we use to identify your account. The other is an API Token which acts as a password when you connect to the API. You can get both of those here. You should click on the "Generate a new API Token" to display it. You''ll need to remember both of those later when you start writing code.' UNION ALL
		SELECT N'Tabs_Attempts', N'Attempts' UNION ALL
		SELECT N'Tabs_Contacts', N'Contacts' UNION ALL
		SELECT N'Tabs_Details', N'Details' UNION ALL
		SELECT N'Tabs_Domains', N'Domains' UNION ALL
		SELECT N'Tabs_FacebookWall', N'Facebook Wall' UNION ALL
		SELECT N'Tabs_General', N'General' UNION ALL
		SELECT N'Tabs_Languages', N'Languages' UNION ALL
		SELECT N'Tabs_LDAP', N'LDAP' UNION ALL
		SELECT N'Tabs_Membership', N'Membership' UNION ALL
		SELECT N'Tabs_OutgoingMailServer', N'SMTP Settings' UNION ALL
		SELECT N'Tabs_POPAndIMAP', N'POP and IMAP' UNION ALL
		SELECT N'Tabs_Profile', N'Profile' UNION ALL
		SELECT N'Tabs_Profile_Description', N'This area contains extra fields which can be defined by you on Settings/Fields. Please pay attention what fields can be mandatory and filled in by a member during sign up process.' UNION ALL
		SELECT N'Tabs_ProfileFields', N'Profile Fields' UNION ALL
		SELECT N'Tabs_Registration', N'Registration' UNION ALL
		SELECT N'Tabs_RestrictedByDomains', N'Restricted By Domains' UNION ALL
		SELECT N'Tabs_RestrictedByRoles', N'Restricted By Roles' UNION ALL
		SELECT N'Tabs_Rules', N'Rules' UNION ALL
		SELECT N'Tabs_Sales', N'Sales' UNION ALL
		SELECT N'Tabs_SocialNetworks', N'Social Networks' UNION ALL
		SELECT N'Tabs_Store', N'Store' UNION ALL
		SELECT N'Tabs_Store_Description', N'Store' UNION ALL
		SELECT N'Tabs_Themes', N'Themes' UNION ALL
		SELECT N'Tabs_Title', N'General' UNION ALL
		SELECT N'Tabs_Tweets', N'Tweets' UNION ALL
		SELECT N'Tabs_UserInterface', N'User Interface' UNION ALL
		SELECT N'Total_Delay', N'Total delay'
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
