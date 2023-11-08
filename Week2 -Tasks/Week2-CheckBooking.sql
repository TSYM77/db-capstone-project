use LittleLemonDB;
DROP PROCEDURE IF EXISTS CheckBooking;
CREATE PROCEDURE CheckBooking(BookDate DATE,Table_Num INT)
SELECT CONCAT("Table ", TableNumber, " is booked")
    WHERE exists (select * from Bookings where Date = BookDate and TableNumber = Table_Num);
CALL CheckBooking("2022-11-12", 3);