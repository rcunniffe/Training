use training
BEGIN TRY
BEGIN TRANSACTION
INSERT INTO product (name, [description], price)
VALUES ('Sony Ericsson Xperia X8 black', 'View the viral. Chat to your chums. Xperia™ X8 keeps you entertained. Infinitely. This is the middle child, between the Xperia X10 and the X10 mini. Bringing you all the goodness of a', 69.00)
INSERT INTO product (name, [description], price)
VALUES ('Samsung Galaxy S II i9100', 'The Samsung Galaxy S II is the first Samsung phone to be powered by a dual-core processor. It runs Android version 2.3 (Gingerbread) and has an incredible 4.3 inch Super AMOLED touchscreen.', 519.00)
INSERT INTO product (name, [description], price)
VALUES ('HTC One S               ', 'If you’re a multi-tasker, this phone is for you. It’s beautifully crafted, ultra thin and has all the features you want from your HTC phone. You can capture every special moment wherever you go.', 449.00)
INSERT INTO product (name, [description], price)
VALUES ('iPhone 4S Black 16GB    ', 'got twice the power and up to 7 times faster graphics. Everything looks exactly like it should with the new 8-megapixel camera and advanced optics. And iOS 5 brings over 200 new features to iPhone', 579.00)
INSERT INTO product (name, [description], price)
VALUES ('BlackBerry® Bold 9900  ', 'The Bold Touch is running the new BlackBerry 7 OS packed with powerful new features and apps. It comes with 5 MP camera and HD video recording (720p), 8GB memory, WiFi, integrated GPS and all the', 539.00)
INSERT INTO product (name, [description], price)
VALUES ('Sony Ericsson Xperia X8 black', 'View the viral. Chat to your chums. Xperia™ X8 keeps you entertained. Infinitely. This is the middle child, between the Xperia X10 and the X10 mini. Bringing you all the goodness of a', 69.00)
 COMMIT TRAN
    END TRY
    BEGIN CATCH
    IF @@TRANCOUNT > 0
    ROLLBACK TRAN
    END CATCH
		