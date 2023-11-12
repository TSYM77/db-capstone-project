use LittleLemonDB;
DROP PROCEDURE IF EXISTS UpdateBooking;

CREATE PROCEDURE UpdateBooking(IN UpdateID INT, IN TableNo INT)
UPDATE Bookings
SET Table_Number = TableNo
WHERE Booking_ID = UpdateID;

CALL UpdateBooking(6, 2);