--1757 Recyclable Products--
SELECT product_id
FROM Products
WHERE low_fats = 'Y' AND recyclable = 'Y';
--584. Find Customer Referee
SELECT name
FROM Customer
WHERE referee_id IS NULL OR referee_id <> 2;