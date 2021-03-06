/*=CONCATENATE("SELECT N'";A1;"', N'";B1;"' UNION ALL")*/
DECLARE @ResourcesTable TABLE (Name VARCHAR (128), Value NVARCHAR (MAX), [Description] NVARCHAR (MAX))

DECLARE @ResourceID INT, @ResourceTypeID INT, @LanguageID INT
DECLARE @Name VARCHAR (128), @Value NVARCHAR (MAX), @Description NVARCHAR (MAX)

SET @ResourceTypeID = NULL
SELECT TOP 1 @ResourceTypeID = ResourceTypeID FROM ResourceTypes WHERE Name = 'SocialResources'
SET @ResourceTypeID = ISNULL (@ResourceTypeID, 0)

SET @LanguageID = NULL
SELECT TOP 1 @LanguageID = LanguageID FROM Languages WHERE CultureName = 'sr-Latn-RS' --AND IsEnabled = 1
SET @LanguageID = ISNULL(@LanguageID, 0)

IF (@ResourceTypeID > 0 AND @LanguageID > 0) BEGIN
	INSERT INTO @ResourcesTable (Name, Value, [Description])
		SELECT N'Button_Aprove', N'Odobri', N'Aprove' UNION ALL
		SELECT N'Button_Follow', N'Prati', N'Follow' UNION ALL
		SELECT N'Button_Make_Admin', N'Postavi za admina', N'Make Admin' UNION ALL
		SELECT N'Button_Post', N'Objavi', N'Post' UNION ALL
		SELECT N'Button_Remove', N'Obriši', N'Remove' UNION ALL
		SELECT N'Button_Remove_Admin', N'Ukloni admina', N'Remove Admin' UNION ALL
		SELECT N'Button_UnFollow', N'Prestani praćenje', N'Unfollow' UNION ALL
		SELECT N'Comments_Comments_Share_WriteComment', N'Ostavi komentar...', N'Write a comment...' UNION ALL
		SELECT N'Comments_Title', N'Komentari', N'Comments' UNION ALL
		SELECT N'Comments_Wal_lTitle', N'Objavi komentare', N'Post Comments' UNION ALL
		SELECT N'Comments_Wall_Button_PostComment', N'Objavi komentar', N'Post Comment' UNION ALL
		SELECT N'Data_Author', N'Autor', N'Author' UNION ALL
		SELECT N'Data_Comment', N'Komentar', N'Comment' UNION ALL
		SELECT N'Data_Date', N'Datum', N'Date' UNION ALL
		SELECT N'Data_Sender', N'Pošiljalac', N'Sender' UNION ALL
		SELECT N'Data_Status', N'Status', N'Status' UNION ALL
		SELECT N'Data_Url', N'Url', N'Url' UNION ALL
		SELECT N'Defalt_Messages', N'Poruke', N'Messages' UNION ALL
		SELECT N'Group_Comments', N'Komentari', N'Comments' UNION ALL
		SELECT N'Group_Members', N'Članovi', N'Members' UNION ALL
		SELECT N'Group_Messages_NoActiveGroups', N'Nema aktivnih grupa', N'No Active Groups.' UNION ALL
		SELECT N'Group_Messages_Notification_Approved', N'Vaš zahtev mora biti odobren da bi videli sadržaj grupe.', N'Your request needs to be approved to see group content.' UNION ALL
		SELECT N'Group_Messages_Notification_Contact_Administrator', N'Molimo javite se administratoru za više detalja.', N'Please contact your system administrator for more details.' UNION ALL
		SELECT N'Group_Messages_Notification_Follow_Group', N'Morate pratiti grupu da bi videli njen sadržaj.', N'You need to follow this group first to see group content.' UNION ALL
		SELECT N'Group_Views', N'Pogledano', N'Views' UNION ALL
		SELECT N'Link_Comment', N'Komentar', N'Comment' UNION ALL
		SELECT N'Link_Comment_Alt', N'Ostavi komentar', N'Leave a comment' UNION ALL
		SELECT N'Link_Dislike', N'Ne sviđa mi se', N'Dislike' UNION ALL
		SELECT N'Link_Like', N'Sviđa mi se', N'Like' UNION ALL
		SELECT N'Link_Reply', N'Odgovori', N'Reply' UNION ALL
		SELECT N'Messages_Notification_All', N'Vidi sve poruke', N'See all messages' UNION ALL
		SELECT N'Messages_Notification_Total', N'Imate {0} novih poruka.', N'You have {0} new messages' UNION ALL
		SELECT N'Wall_Title', N'Zid', N'Wall' UNION ALL
		SELECT N'Wall_WallPost_Status_Share', N'Podeli šta je novo...', N'Share what''s new..' UNION ALL
		SELECT N'Wall_WallPost_Success', N'Uspešno ste objavili novi članak!', N'You have successfully posted a new post!' UNION ALL
		SELECT N'Wall_WallPost_Edit_Success', N'Uspešno ste izmenili članak!', N'You have successfully edited a post!' UNION ALL
		SELECT N'Wall_WallPost_Edit_Authorize', N'Samo ovlašteni korisnici mogu menjati ovu stavku!', N'Only authorized users can edit this item!' UNION ALL
		SELECT N'Wall_NotePost_Delete_Success', N'Komentar {0} je obrisan!', N'The note {0} has been deleted!' UNION ALL
		SELECT N'Wall_CommentPost_Authorize', N'Niste ovlašteni da komentarišete ovu poruku!', N'You are not authorized to post this message!' UNION ALL
		SELECT N'Wall_CommentPost_MessageEmpty', N'Poruka je prazna. Molimo unesite poruku.', N'Message is empty. Please, enter message.' UNION ALL
		SELECT N'Wall_CommentPost_Edit_Success', N'{0} \"{1}\" je ažuriran.', N'{0} \"{1}\" has been updated.' UNION ALL
		SELECT N'Wall_CommentPost_Create_Success', N'Novi {0} \"{1}\" je kreiran.', N'New {0} \"{1}\" has been created.' UNION ALL
		SELECT N'Wall_CommentPost_Delete_Success', N'Komentar: \"{0}\" je obrisan!', N'The comment: \"{0}\" has been deleted!'
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
