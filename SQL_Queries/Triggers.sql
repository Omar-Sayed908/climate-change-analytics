/* Trigger 1: Check the year of observation (Should be till current year) */

CREATE TRIGGER trg_observation_validate
ON Observation
INSTEAD OF INSERT
AS
BEGIN
    IF EXISTS (
        SELECT 1 FROM inserted 
        WHERE Year > YEAR(GETDATE())
    )
    BEGIN
        DECLARE @msg VARCHAR(200);
        SET @msg = 'Invalid: the year should be till ' + CAST(YEAR(GETDATE()) AS VARCHAR(4)) + '.';

        PRINT @msg;
        ROLLBACK TRANSACTION;
        RETURN;
    END;

    INSERT INTO Observation (I_ID, C_ID, Value, Year, Created_At, Updated_At)
    SELECT I_ID, C_ID, Value, Year, GETDATE(), GETDATE()
    FROM inserted;
END;
GO

/* Trigger 2: Prevent deleting a country that has observations */

CREATE TRIGGER trg_country_delete
ON Country
INSTEAD OF DELETE
AS
BEGIN
    IF EXISTS (
        SELECT 1 FROM Observation o
        JOIN deleted d ON o.C_ID = d.Country_ID
    )
    BEGIN
        DECLARE @msg VARCHAR(200);
        SET @msg = 'Cannot delete Country with Observations.';

        PRINT @msg;
        ROLLBACK TRANSACTION;
        RETURN;
    END;

    DELETE FROM Country
    WHERE Country_ID IN (SELECT Country_ID FROM deleted);
END;
GO

/* Trigger 3: Always Uppercase the ISO code when insert or update */

CREATE TRIGGER trg_Country_UppercaseISO
ON Country
AFTER INSERT, UPDATE
AS
BEGIN

    UPDATE c
    SET c.ISO_Code = UPPER(i.ISO_Code)
    FROM Country c
    INNER JOIN inserted i ON c.Country_ID = i.Country_ID

END;
GO

/* Trigger 4: Check if this's a trusted URL source or not (Should Convert sorce_url to nvarchar to work)*/

CREATE TRIGGER trg_Check_SRC_URL
ON Source
AFTER INSERT, UPDATE
AS
BEGIN
    SET NOCOUNT ON;

    IF EXISTS (
        SELECT 1
        FROM inserted
        WHERE source_url IS NULL
           OR source_url NOT LIKE 'https%'
    )
    BEGIN
        DECLARE @msg VARCHAR(200);
        SET @msg = 'Invalid URL: This is empty or not a trusted source.';

        PRINT @msg;
        ROLLBACK TRANSACTION;
    END
END;
GO

/* Trigger 5: Prevent deleting an Indicator that has observations */

CREATE TRIGGER trg_indicator_delete
ON Indicator
INSTEAD OF DELETE
AS
BEGIN
    IF EXISTS (
        SELECT 1 FROM Observation o
        JOIN deleted d ON o.I_ID = d.Indicator_ID
    )
    BEGIN
        DECLARE @msg VARCHAR(200);
        SET @msg = 'Cannot delete Indicator with Observations.';

        PRINT @msg;
        ROLLBACK TRANSACTION;
        RETURN;
    END;

    DELETE FROM Indicator
    WHERE Indicator_ID IN (SELECT Indicator_ID FROM deleted);
END;
GO

/* Trigger 6: Prevent deleting a Source that has observations */

CREATE TRIGGER trg_source_delete
ON Source
INSTEAD OF DELETE
AS
BEGIN
    IF EXISTS (
        SELECT 1 FROM Indicator i
        JOIN deleted d ON i.S_ID = d.source_id
    )
    BEGIN
        DECLARE @msg VARCHAR(200);
        SET @msg = 'Cannot delete Source with Observations.';

        PRINT @msg;
        ROLLBACK TRANSACTION;
        RETURN;
    END;

    DELETE FROM source
    WHERE source_id IN (SELECT source_id FROM deleted);
END;
GO

