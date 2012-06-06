DROP PROCEDURE [dbo].[usp_addorder]
Go
CREATE PROCEDURE [dbo].[usp_addorder]
	-- Add the parameters for the stored procedure here
	@personID int,
	@orderstatecode VARCHAR(10)
AS
BEGIN
	DECLARE @orderstateID int    
    Select @orderstateID = orderstateID from [orderstate]
    where @orderstatecode = [orderstate].code
	
    INSERT INTO [order](personID,orderstateID) 
    VALUES (@personID,@orderstateID)                            

    SELECT SCOPE_IDENTITY()
END
GO
