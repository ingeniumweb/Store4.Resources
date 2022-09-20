/*=CONCATENATE("SELECT N'";A1;"', N'";B1;"' UNION ALL")*/
DECLARE @ResourcesTable TABLE (Name VARCHAR (128), Value NVARCHAR (MAX), Description NVARCHAR (MAX))

DECLARE @ResourceID INT, @ResourceTypeID INT, @LanguageID INT
DECLARE @Name VARCHAR (128), @Value NVARCHAR (MAX), @Description NVARCHAR (MAX)

SET @ResourceTypeID = NULL
SELECT TOP 1 @ResourceTypeID = ResourceTypeID FROM ResourceTypes WHERE Name = 'DefaultResources'
SET @ResourceTypeID = ISNULL (@ResourceTypeID, 0)

SET @LanguageID = NULL
SELECT TOP 1 @LanguageID = LanguageID FROM Languages WHERE CultureName = 'en-US' --AND IsEnabled = 1
SET @LanguageID = ISNULL(@LanguageID, 0)

IF (@ResourceTypeID > 0 AND @LanguageID > 0) BEGIN
	INSERT INTO @ResourcesTable (Name, Value)
		SELECT N'Data_SubscribeToTheNewsletter', N'Subscribe to the Newsletter' UNION ALL
		SELECT N'Data_Item_Added', N'A {0} item has been added.' UNION ALL
		SELECT N'Data_Item_Changed', N'A {0} item has been changed.' UNION ALL
		SELECT N'Data_Item_Deleted', N'A {0} item(s) has been deleted.' UNION ALL
		SELECT N'ContentType_Project', N'Project' UNION ALL
		SELECT N'ContentType_Ticket', N'Ticket' UNION ALL
		SELECT N'DropDown_SearchBy', N'Search by {0}' UNION ALL
		SELECT N'Link_MarkAsPaused', N'Mark as Paused' UNION ALL
		SELECT N'Link_MarkAsActive', N'Mark as Active' UNION ALL
		SELECT N'Link_MarkAsInProgress', N'Mark as In Review' UNION ALL
		SELECT N'Link_MarkAsInReview', N'Mark as Paused' UNION ALL
		SELECT N'Link_MarkAsInCompleted', N'Mark as Completed' UNION ALL
		SELECT N'List_Title_Education', N'Education' UNION ALL
		SELECT N'List_Title_Experience', N'Experience' UNION ALL
		SELECT N'List_Title_Insurance', N'Insurance' UNION ALL
		SELECT N'Data_CloneTicket', N'Clone Ticket' UNION ALL
		SELECT N'Data_CloneProject', N'Clone Project' UNION ALL
		SELECT N'Error_ProjectMemberAdd', N'An error occurred while adding member {0} on the the following project: "{1}".' UNION ALL
		SELECT N'Error_ProjectMemberExist', N'The member {0} has been already assinged to the project {1}.' UNION ALL
		SELECT N'Error_ProjectRemoval', N'An error occurred while deleting the project!' UNION ALL
		SELECT N'Error_ProjectStatus', N'Invalid project status!' UNION ALL
		SELECT N'Error_ProjectTime', N'Enter the number of working hours!' UNION ALL
		SELECT N'Error_ProjectTimeSaving', N'An error occurred while saving Member Task!' UNION ALL	
		SELECT N'Data_Status', N'Status'
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
