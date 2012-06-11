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
select [order].orderID, personID,orderstate.name
from [order]
INNER JOIN [orderstate] ON [order].orderstateID = [orderstate].orderstateID
END
GO