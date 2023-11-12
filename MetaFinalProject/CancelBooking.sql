DROP PROCEDURE IF EXISTS CancelBooking;

DELIMITER $$ 
CREATE PROCEDURE CancelBooking(IN BookingID INT) 
BEGIN 
DELETE FROM Bookings WHERE Booking_ID = BookingID; SELECT CONCAT("Booking ", BookingID, " cancelled") AS "Confirmation"; 
END$$ 
DELIMITER ; 

CALL CancelBooking(9);