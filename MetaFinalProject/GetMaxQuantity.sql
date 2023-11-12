use LittleLemonDB;
drop procedure if exists GetMaxQuantity;
create procedure GetMaxQuantity() select max(Order_Quantity) as Maximum_Quantity from Orders;
call GetMaxQuantity();