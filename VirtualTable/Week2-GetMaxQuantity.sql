use LittleLemonDB;
drop procedure if exists GetMaxQuantity;
create procedure GetMaxQuantity() select max(Quantity) as Max_Quantity from orders;
call GetMaxQuantity();