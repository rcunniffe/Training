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
GO
use training
GO
CREATE TABLE Products
(Id int IDENTITY(1,1),
	Name VARCHAR (300),
	ItemDescription VARCHAR (600) NOT NULL,
	Price VARCHAR (200) NOT NULL);
GO
INSERT INTO Products (Name, ItemDescription, Price)
VALUES ('Sony Ericsson Xperia X8 black', 'View the viral. Chat to your chums. Xperia™ X8 keeps you entertained. Infinitely. This is the middle child, between the Xperia X10 and the X10 mini. Bringing you all the goodness of a small touchscreen Smartphone for a reasonable price. Now available in black. ', '69')
INSERT INTO Products (Name, ItemDescription, Price)
VALUES ('Samsung Galaxy S II i9100', 'The Samsung Galaxy S II is the first Samsung phone to be powered by a dual-core processor. It runs Android version 2.3 (Gingerbread) and has an incredible 4.3 inch Super AMOLED touchscreen. Other highlights include 1080p Full HD video recording, an 8 megapixel still camera and a front-facing camera for making video calls.', '519')
INSERT INTO Products (Name, ItemDescription, Price)
VALUES ('HTC One S', 'If you’re a multi-tasker, this phone is for you. It’s beautifully crafted, ultra thin and has all the features you want from your HTC phone. You can capture every special moment wherever you go, with camera features like auto smile detection, face focus and continuous shooting. You can even snap a picture while shooting HD video. You can browse the web, do some shopping online and at the same time enjoy music or movies in rich studio sounds with Beats Audio.. Listen. Watch. Browse. Work. Share. And Enjoy!', '449')
INSERT INTO Products (Name, ItemDescription, Price)
VALUES ('iPhone 4S Black 16GB', 'got twice the power and up to 7 times faster graphics. Everything looks exactly like it should with the new 8-megapixel camera and advanced optics. And iOS 5 brings over 200 new features to iPhone 4S making it easier to do pretty much everything', '579')
INSERT INTO Products (Name, ItemDescription, Price)
VALUES ('BlackBerry® Bold 9900', 'The Bold Touch is running the new BlackBerry 7 OS packed with powerful new features and apps. It comes with 5 MP camera and HD video recording (720p), 8GB memory, WiFi, integrated GPS and all the great features we know and love about the Bold series.', '539')
GO    