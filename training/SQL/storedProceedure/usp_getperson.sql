USE [training]
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
DROP PROCEDURE [dbo].[usp_getperson]
Go
CREATE PROCEDURE [dbo].[usp_getperson]
AS
BEGIN
	Select person.personID, person.firstname, person.surname,[address].addressID, [address].address1, [address].address2, [address].address3, [postcode].postcode, city.city, country.country
    from [address]
    INNER JOIN [personaddress] ON [address].addressID = personaddress.addressID
    INNER JOIN person ON personaddress.personaddressID = person.personID    
    INNER JOIN addresstype ON addresstype.addresstypeID = personaddress.addresstypeID
    INNER JOIN city ON city.cityID = [address].cityID
    INNER JOIN country ON city.countryID = country.countryID 
    INNER JOIN [postcode] ON [postcode].postcodeID = [address].postcodeID
END
GO