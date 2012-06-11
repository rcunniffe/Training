USE [training]
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
DROP PROCEDURE [dbo].[usp_getproducts]
Go
CREATE PROCEDURE [dbo].[usp_getproducts]
AS
BEGIN
SELECT  [productID], [name], [description], [price] FROM [product]
END
GO