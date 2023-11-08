USE littlelemon;
CREATE VIEW Ordersview AS SELECT OrderID, Quantity, TotalCost FROM Orders;
SELECT * FROM Ordersview;