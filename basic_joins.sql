
--1378. Replace Employee ID With The Unique Identifier
SELECT name, EmployeeUNI.unique_id 
FROM Employees
LEFT JOIN EmployeeUNI
ON Employees.id = EmployeeUNI.id;

--1068. Product Sales Analysis I
SELECT Product.product_name, Sales.year, Sales.price
FROM Sales
LEFT JOIN Product
On Sales.product_id = Product.product_id;

--1581. Customer Who Visited but Did Not Make Any Transactions
SELECT Visits.customer_id, COUNT(Visits.visit_id) AS count_no_trans
FROM Visits
LEFT JOIN Transactions 
ON Visits.visit_id = Transactions.visit_id
WHERE Transactions.transaction_id IS NULL
GROUP BY Visits.customer_id;

--197. Rising Temperature
SELECT w1.id
FROM Weather w1
JOIN Weather w2
ON w1.recordDate = w2.recordDate + INTERVAL 1 DAY
WHERE w1.temperature > w2.temperature;