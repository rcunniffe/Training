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
DROP PROCEDURE [dbo].[usp_getorderline]
Go
CREATE PROCEDURE [dbo].[usp_getorderline]
	-- Add the parameters for the stored procedure here
	@orderID int
AS
BEGIN
select @orderID AS orderID, product.name, quantity
from orderline
INNER JOIN [product] ON orderline.productID = product.productID
Where [orderline].orderID = @orderID
END
GO