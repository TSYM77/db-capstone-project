use LittleLemonDB;
drop procedure if exists CancelOrder;
delimiter \\
create procedure CancelOrder(OrderID int)
begin
delete from orders where OrderID=Orderid;
select concat("Order ", OrderID, " is cancelled") as Confirmation;
end\\
delimiter ;

call CancelOrder(5)