USE [training]
GO

/****** Object:  StoredProcedure [dbo].[usp_addperson]    Script Date: 05/08/2012 16:07:09 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[usp_addperson]
	-- Add the parameters for the stored procedure here
	@firstname VarChar(50),
	@surname VarChar(50),
	@address1 VarChar(50),
	@address2 VarChar(50),
	@address3 VarChar(50),
	@country VarChar(50),
	@city VarChar(50),
	@postcode VARCHAR(50)
		
AS
BEGIN
	BEGIN TRY
    BEGIN TRANSACTION
    INSERT INTO person (firstname,surname)
    VALUES(@firstname,@surname) 
    declare @personID as int 
    SET @personID = SCOPE_IDENTITY() 

    INSERT INTO addresstype(code,[description]) 
    VALUES ('p','primary address') 
    declare @addresstypeID as int 
    SET @addresstypeID = SCOPE_IDENTITY() 
    
    INSERT INTO country(country) 
    VALUES (@country) 
    declare @countryID as int 
    SET @countryID = SCOPE_IDENTITY() 

    INSERT INTO city(city,countryID) 
    VALUES (@city,@countryID) 
    declare @cityID as int 
    SET @cityID = SCOPE_IDENTITY() 

    INSERT INTO [address](address1,address2,address3, cityID) 
    VALUES (@address1,@address2,@address3, @cityID) 
    declare @addressID as int 
    SET @addressID = SCOPE_IDENTITY() 
    
    INSERT INTO postcode(postcode) 
    VALUES ('D4') 
    declare @postcodeID as int 
    SET @postcodeID = SCOPE_IDENTITY() 

    INSERT INTO personaddress(personID,addressID,addresstypeID) 
    VALUES (@personID,@addressID,@addresstypeID) 
    declare @personaddressID as int 
    SET @personaddressID = SCOPE_IDENTITY() 

    INSERT INTO [order](personID) 
    VALUES (@personID)                            
    declare @orderID as int 
    SET @orderID = SCOPE_IDENTITY()
    
    COMMIT TRAN
    END TRY
    BEGIN CATCH
    IF @@TRANCOUNT > 0
    ROLLBACK TRAN
    END CATCH
                                                        
    select @orderID
END

GO


