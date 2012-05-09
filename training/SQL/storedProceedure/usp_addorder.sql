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
DROP PROCEDURE [dbo].[usp_addorder]
Go
CREATE PROCEDURE [dbo].[usp_addorder]
	-- Add the parameters for the stored procedure here
	@productID int,
	@orderID int,
	@quantity int
AS
BEGIN
INSERT INTO [orderline] (productID,orderID,quantity)
VALUES(@productID,@orderID,@quantity)
END
GO