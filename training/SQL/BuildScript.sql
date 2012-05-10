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
CREATE TABLE [person]
(personID int IDENTITY(1,1) Primary Key,
	firstname VARCHAR (50) NOT NULL,
	surname VARCHAR (50) NOT NULL,
    );
GO
CREATE TABLE [addresstype]
(	addresstypeID int IDENTITY(1,1) Primary Key,
	code VARCHAR (50) NOT NULL,	
	[description] VARCHAR (50) NOT NULL,
    );
GO
CREATE TABLE [country]
(	countryID int IDENTITY(1,1) Primary Key,	
	country VARCHAR (50) NOT NULL,
    );
GO
CREATE TABLE [city]
(	cityID int IDENTITY(1,1) Primary Key,	
	city VARCHAR (50) NOT NULL,	 		
	countryID int FOREIGN KEY REFERENCES country(countryID),
	);
GO
use training
GO
CREATE TABLE [address]
(	addressID int IDENTITY(1,1) Primary Key,	
	address1 VARCHAR (50) NOT NULL,
	address2 VARCHAR (50) NULL,
	address3 VARCHAR (50) NULL,
	cityID int FOREIGN KEY REFERENCES city(cityID),	
    );
GO
CREATE TABLE [postcode]
(	postcodeID int IDENTITY(1,1) Primary Key,	
	postcode VARCHAR (50) NOT NULL,	
    );
GO
CREATE TABLE [product]
(	productID int IDENTITY(1,1) Primary Key,
	name VARCHAR (300) NOT NULL,
	[description] VARCHAR (600) NOT NULL,
	price FLOAT  Not Null);
GO
CREATE TABLE [personaddress]
(	personaddressID int IDENTITY(1,1) Primary Key,
	personID int FOREIGN KEY REFERENCES person(personID),
	addressID int FOREIGN KEY REFERENCES [address](addressID),
	addresstypeID int FOREIGN KEY REFERENCES addresstype(addresstypeID),	
    );
GO

CREATE TABLE [orderstate]
( 
	orderstateID int IDENTITY(1,1) Primary Key,
	orderstate VARCHAR (100) NOT NULL,
	statecode VARCHAR (10) NOT NULL
)
CREATE TABLE [order]
(	orderID int IDENTITY(1,1) Primary Key,	
	personID int FOREIGN KEY REFERENCES personaddress(personaddressID),
	statecode VARCHAR (50) NOT NULL	
    );
GO  
CREATE TABLE [orderline]
(	orderlineID int IDENTITY(1,1) Primary Key,	
	orderID int FOREIGN KEY REFERENCES [order](orderID),
	productID int FOREIGN KEY REFERENCES product(productID),
	quantity int,	
    );
GO 