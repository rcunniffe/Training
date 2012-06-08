USE [training]
-- ================================================
-- Template generated from Template Explorer using:
-- Create Procedure (New Menu).SQL
--
-- Use the Specify Values for Template Parameters 
-- command (Ctrl-Shift-M) to fill in the parameter 
-- values below.
--
-- This block of comments will not be included in
-- the definition of the procedure.
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
DROP PROCEDURE [dbo].[usp_getperson]
Go
CREATE PROCEDURE [dbo].[usp_getperson]
	-- Add the parameters for the stored procedure here
AS
BEGIN
	Select person.firstname, person.surname,[address].addressID, [address].address1, [address].address2, [address].address3, [postcode].postcode, city.city, country.country
    from [address]
    INNER JOIN [personaddress] ON [address].addressID = personaddress.addressID
    Join person ON personaddress.personaddressID = person.personID
    Join [order] ON [order].personID = person.personID
    Join addresstype ON addresstype.addresstypeID = personaddress.addresstypeID
    Join city ON city.cityID = [address].cityID
    Join country ON city.countryID = country.countryID
    Join [orderstate] ON [order].orderstateID = [orderstate].orderstateID
    Join [postcode] ON [postcode].postcodeID = [address].postcodeID
END
GO