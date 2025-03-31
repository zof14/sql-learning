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