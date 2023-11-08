use LittleLemonDB;
select Name from Menu where MenuID=any (select MenuID from orders where Quantity>2)