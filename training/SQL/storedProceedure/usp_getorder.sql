USE [training]
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
DROP PROCEDURE [dbo].[usp_getorder]
Go
CREATE PROCEDURE [dbo].[usp_getorder]
AS
BEGIN
select orderline.orderID, personID,orderstate.name, orderlineID, productID, quantity
from orderline
INNER JOIN [order] ON orderline.orderID = [order].orderID
JOIN [orderstate] ON [order].orderstateID = [orderstate].orderstateID
END
GO