ALTER DATABASE training
SET Single_USER
WITH ROLLBACK IMMEDIATE; 
GO
USE [master]
GO
IF  EXISTS (SELECT name FROM sys.databases 
	WHERE name = N'training')
DROP DATABASE [training]
GO
CREATE DATABASE training
GO
use training
GO
CREATE TABLE Customers
(Id int IDENTITY(1,1),
	Firstname VARCHAR (20),
	Surname VARCHAR (20) NOT NULL,
	Address1 VARCHAR (50) NOT NULL,
	Address2 VARCHAR (50) NOT NULL,
	Address3 VARCHAR (50) NOT NULL,
    Postcode VARCHAR (50) NOT NULL,
    City VARCHAR (50) NOT NULL,
    Country VARCHAR (50) NOT NULL
    );