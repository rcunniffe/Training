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
use training
GO
CREATE TABLE [address]
(	addressID int IDENTITY(1,1) Primary Key,	
	address1 VARCHAR (50) NOT NULL,
	address2 VARCHAR (50) NULL,
	address3 VARCHAR (50) NULL,
    );
GO
CREATE TABLE [addresstype]
(	addresstypeID int IDENTITY(1,1) Primary Key,
	code VARCHAR (50) NULL,	
	[description] VARCHAR (50) NULL,
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
CREATE TABLE [postcode]
(	postcodeID int IDENTITY(1,1) Primary Key,	
	postcode VARCHAR (50) NOT NULL,
	cityID int FOREIGN KEY REFERENCES city(cityID),	
    );
GO
CREATE TABLE [products]
(	productID int IDENTITY(1,1) Primary Key,
	name VARCHAR (300) NOT NULL,
	[description] VARCHAR (600) NOT NULL,
	price FLOAT  Not Null);
GO
INSERT INTO products (name, [description], price)
VALUES ('Sony Ericsson Xperia X8 black', 'View the viral. Chat to your chums. Xperia™ X8 keeps you entertained. Infinitely. This is the middle child, between the Xperia X10 and the X10 mini. Bringing you all the goodness of a small touchscreen Smartphone for a reasonable price. Now available in black. ', 69.00)
INSERT INTO products (name, [description], price)
VALUES ('Samsung Galaxy S II i9100', 'The Samsung Galaxy S II is the first Samsung phone to be powered by a dual-core processor. It runs Android version 2.3 (Gingerbread) and has an incredible 4.3 inch Super AMOLED touchscreen. Other highlights include 1080p Full HD video recording, an 8 megapixel still camera and a front-facing camera for making video calls.', 519.00)
INSERT INTO products (name, [description], price)
VALUES ('HTC One S', 'If you’re a multi-tasker, this phone is for you. It’s beautifully crafted, ultra thin and has all the features you want from your HTC phone. You can capture every special moment wherever you go, with camera features like auto smile detection, face focus and continuous shooting. You can even snap a picture while shooting HD video. You can browse the web, do some shopping online and at the same time enjoy music or movies in rich studio sounds with Beats Audio.. Listen. Watch. Browse. Work. Share. And Enjoy!', 449.00)
INSERT INTO products (name, [description], price)
VALUES ('iPhone 4S Black 16GB', 'got twice the power and up to 7 times faster graphics. Everything looks exactly like it should with the new 8-megapixel camera and advanced optics. And iOS 5 brings over 200 new features to iPhone 4S making it easier to do pretty much everything', 579.00)
INSERT INTO products (name, [description], price)
VALUES ('BlackBerry® Bold 9900', 'The Bold Touch is running the new BlackBerry 7 OS packed with powerful new features and apps. It comes with 5 MP camera and HD video recording (720p), 8GB memory, WiFi, integrated GPS and all the great features we know and love about the Bold series.', 539.00)
GO 
CREATE TABLE [personaddress]
(	personaddressID int IDENTITY(1,1) Primary Key,
	personID int FOREIGN KEY REFERENCES person(personID),
	addressID int FOREIGN KEY REFERENCES [address](addressID),
	addresstypeID int FOREIGN KEY REFERENCES addresstype(addresstypeID),
	cityID int FOREIGN KEY REFERENCES city(cityID),	
    );
GO
CREATE TABLE [order]
(	orderID int IDENTITY(1,1) Primary Key,	
	personaddressID int FOREIGN KEY REFERENCES personaddress(personaddressID),	
    );
GO  
CREATE TABLE [orderline]
(	orderlineID int IDENTITY(1,1) Primary Key,	
	orderID int FOREIGN KEY REFERENCES [order](orderID),
	productID int FOREIGN KEY REFERENCES products(productID),
	quantity int,	
    );
GO 