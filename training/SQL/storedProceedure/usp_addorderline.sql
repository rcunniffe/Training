DROP PROCEDURE [dbo].[usp_addorderline]
Go
CREATE PROCEDURE [dbo].[usp_addorderline]
	@productID int,
	@orderID int,
	@quantity int
AS
BEGIN

	INSERT INTO [orderline] (productID,orderID,quantity)
	VALUES(@productID,@orderID,@quantity)
    select SCOPE_IDENTITY()
    
END
GO