/*=CONCATENATE("SELECT N'";A1;"', N'";B1;"' UNION ALL")*/
DECLARE @ResourcesTable TABLE (Name VARCHAR (128), Value NVARCHAR (MAX), Description NVARCHAR (MAX))

DECLARE @ResourceID INT, @ResourceTypeID INT, @LanguageID INT
DECLARE @Name VARCHAR (128), @Value NVARCHAR (MAX), @Description NVARCHAR (MAX)

SET @ResourceTypeID = NULL
SELECT TOP 1 @ResourceTypeID = ResourceTypeID FROM ResourceTypes WHERE Name = 'SocialResources'
SET @ResourceTypeID = ISNULL (@ResourceTypeID, 0)

SET @LanguageID = NULL
SELECT TOP 1 @LanguageID = LanguageID FROM Languages WHERE CultureName = 'en-US' --AND IsEnabled = 1
SET @LanguageID = ISNULL (@LanguageID, 0)

IF (@ResourceTypeID > 0 AND @LanguageID > 0) BEGIN
	INSERT INTO @ResourcesTable (Name, Value)
		SELECT N'Button_Aprove', N'Aprove' UNION ALL
		SELECT N'Button_Follow', N'Follow' UNION ALL
		SELECT N'Button_Make_Admin', N'Make Admin' UNION ALL
		SELECT N'Button_Post', N'Post' UNION ALL
		SELECT N'Button_Remove', N'Remove' UNION ALL
		SELECT N'Button_Remove_Admin', N'Remove Admin' UNION ALL
		SELECT N'Button_UnFollow', N'Unfollow' UNION ALL
		SELECT N'Comments_Comments_Share_WriteComment', N'Write a comment...' UNION ALL
		SELECT N'Comments_Title', N'Comments' UNION ALL
		SELECT N'Comments_Wal_lTitle', N'Post Comments' UNION ALL
		SELECT N'Comments_Wall_Button_PostComment', N'Post Comment' UNION ALL
		SELECT N'Data_Author', N'Author' UNION ALL
		SELECT N'Data_Comment', N'Comment' UNION ALL
		SELECT N'Data_Date', N'Date' UNION ALL
		SELECT N'Data_Sender', N'Sender' UNION ALL
		SELECT N'Data_Status', N'Status' UNION ALL
		SELECT N'Data_Url', N'Url' UNION ALL
		SELECT N'Defalt_Messages', N'Messages' UNION ALL
		SELECT N'Group_Comments', N'Comments' UNION ALL
		SELECT N'Group_Members', N'Members' UNION ALL
		SELECT N'Group_Messages_NoActiveGroups', N'No Active Groups.' UNION ALL
		SELECT N'Group_Messages_Notification_Approved', N'Your request needs to be approved to see group content.' UNION ALL
		SELECT N'Group_Messages_Notification_Contact_Administrator', N'Please contact your system administrator for more details.' UNION ALL
		SELECT N'Group_Messages_Notification_Follow_Group', N'You need to follow this group first to see group content.' UNION ALL
		SELECT N'Group_Views', N'Views' UNION ALL
		SELECT N'Link_Comment', N'Comment' UNION ALL
		SELECT N'Link_Comment_Alt', N'Leave a comment' UNION ALL
		SELECT N'Link_Dislike', N'Dislike' UNION ALL
		SELECT N'Link_Like', N'Like' UNION ALL
		SELECT N'Link_Reply', N'Reply' UNION ALL
		SELECT N'Messages_Notification_All', N'See all messages' UNION ALL
		SELECT N'Messages_Notification_Total', N'You have {0} new messages' UNION ALL
		SELECT N'Wall_Title', N'Wall' UNION ALL
		SELECT N'Wall_WallPost_Status_Share', N'Share what''s new..' UNION ALL
		SELECT N'Wall_WallPost_Success', N'You have successfully posted a new post!' UNION ALL
		SELECT N'Wall_WallPost_Edit_Success', N'You have successfully edited a post!' UNION ALL
		SELECT N'Wall_WallPost_Edit_Authorize', N'Only authorized users can edit this item!' UNION ALL
		SELECT N'Wall_NotePost_Delete_Success', N'The note {0} has been deleted!' UNION ALL
		SELECT N'Wall_CommentPost_Authorize', N'You are not authorized to post this message!' UNION ALL
		SELECT N'Wall_CommentPost_MessageEmpty', N'Message is empty. Please, enter message.' UNION ALL
		SELECT N'Wall_CommentPost_Edit_Success', N'{0} \"{1}\" has been updated.' UNION ALL
		SELECT N'Wall_CommentPost_Create_Success', N'New {0} \"{1}\" has been created.' UNION ALL
		SELECT N'Wall_CommentPost_Delete_Success', N'The comment: \"{0}\" has been deleted!'
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
