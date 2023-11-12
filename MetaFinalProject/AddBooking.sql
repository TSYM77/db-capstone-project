DROP PROCEDURE IF EXISTS AddBooking; 
DELIMITER $$ 
CREATE PROCEDURE AddBooking(IN BookingID INT, IN CustomerID INT, IN TableNumber INT, IN BookingDate DATE)
BEGIN 
INSERT INTO Bookings (Booking_ID, Customer_ID, Table_Number, Bookinh_Date) VALUES (BookingID, CustomerID, TableNumber, BookingDate); 
SELECT "New booking added" AS "Confirmation";
END$$ DELIMITER ; 
CALL AddBooking(9, 3, 4, "2022-12-30");