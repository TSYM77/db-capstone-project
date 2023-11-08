use LittleLemonDB;
select customer.CustomerID, customer.Name, order.OrderID, order.TotalCost, menu.Name, menuitem.Course, menuitem.Starter
from Customers inner join Orders on customer.CustomerID=order.CustomerID
inner join Menus on order.MenuID=menu.MenuID
inner join MenuContent on menu.MenuID=MenuItem.MenuID
inner join MenuItems on MenuContent.MenuItemID=MenuItem.MenuItemID
where order.TotalCost>150;