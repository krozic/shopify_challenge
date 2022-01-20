-- Part 1:
-- Filtered by ID from Shippers table
SELECT COUNT(OrderID) AS NumberOfOrders
FROM Orders
WHERE ShipperID = '1';

-- Filtered by the name
SELECT COUNT(OrderID) AS NumberOfOrders
FROM Orders
LEFT JOIN Shippers USING(ShipperID)
WHERE ShipperName = 'Speedy Express';
-- 54 Orders

-- Part 2:
-- Table to show NumberOfOrders for each employee
-- SELECT COUNT(OrderID) AS NumberOfOrders, Orders.EmployeeID, LastName, FirstName
-- FROM Orders
-- LEFT JOIN Employees ON Orders.EmployeeID = Employees.EmployeeID
-- GROUP BY Orders.EmployeeID
-- ORDER BY NumberOfOrders DESC;

SELECT COUNT(OrderID) AS NumberOfOrders, EmployeeID, LastName, FirstName
FROM Orders
LEFT JOIN Employees USING(EmployeeID)
GROUP BY EmployeeID
ORDER BY NumberOfOrders DESC;

-- Just shows the answer
SELECT LastName
FROM Orders
LEFT JOIN Employees USING(EmployeeID)
GROUP BY EmployeeID
ORDER BY COUNT(OrderID) DESC
LIMIT 1;


-- Part 3:
-- Table showing values
SELECT SUM(Quantity) AS QuantitySold, ProductID, ProductName
FROM OrderDetails
LEFT JOIN Products USING(ProductID)
LEFT JOIN Orders USING(OrderID)
LEFT JOIN Customers USING(CustomerID)
WHERE Country = 'Germany'
GROUP BY ProductID
ORDER BY SUM(Quantity) DESC;

-- Just the answer
SELECT ProductName
FROM OrderDetails
LEFT JOIN Products USING(ProductID)
LEFT JOIN Orders USING(OrderID)
LEFT JOIN Customers USING(CustomerID)
WHERE Country = 'Germany'
GROUP BY ProductID
ORDER BY SUM(Quantity) DESC
LIMIT 1;