use LittleLemonDB;
prepare GetOrderDetail from 'select OrderID, Quantity, TotalCost from orders where orderID=?';

set @id = 1;
EXECUTE GetOrderDetail USING @id;